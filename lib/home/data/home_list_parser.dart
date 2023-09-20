import 'dart:convert';

import 'package:projeto_base_mobile/data/file_controller.dart';
import 'package:projeto_base_mobile/home/model/home_model.dart';
import 'package:projeto_base_mobile/home/model/home_model_list.dart';

class HomeListParser {
  final _fileController = FileController();

  Future<void> addHome(HomeModel home) async {
    var homeList = await readHomes();
    home.id = _getNextId(homeList);
    homeList.add(home);
    await _fileController.write(jsonEncode(homeList), fileName);
  }

  Future<List<HomeModel>> readHomes() async {
    return _readHomes(await _readHomesFromFile());
  }

  Future<bool> removeHome(HomeModel home) async {
    var homeList = await readHomes();
    var indexToRemove = -1;
    for (var i = 0; i < homeList.length; ++i) {
      var listedHome = homeList[i];
      if(listedHome.id != home.id) continue;
      indexToRemove = i;
      break;
    }
    if(indexToRemove == -1) return false;
    homeList.removeAt(indexToRemove);
    await _fileController.write(jsonEncode(homeList), fileName);
    return true;
  }

  List<HomeModel> _readHomes(String? readHomes) {
    return readHomes != null
        ? HomeModelList.fromJson(jsonDecode(readHomes)).homes
        : [];
  }

  Future<String?> _readHomesFromFile() async {
    return await _fileController.read(fileName);
  }

  int _getNextId(List<HomeModel> homeList) {
    return homeList.isNotEmpty ? ((homeList.last.id as int) + 1) : 0;
  }

  String get fileName => 'homes.json';
}
