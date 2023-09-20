import 'package:projeto_base_mobile/home/data/home_list_parser.dart';
import 'package:projeto_base_mobile/home/model/home_model.dart';

class HomeViewModel {
  List<HomeModel> _homes = [];

  final parser = HomeListParser();

  List<HomeModel> get homes => _homes;

  Future<void> initHomes() async {
    await _refreshHomes();
  }

  Future<void> addHome(HomeModel home) async {
    await parser.addHome(home);
    await _refreshHomes();
  }

  Future<void> removeHome(HomeModel home) async {
    await parser.removeHome(home);
    await _refreshHomes();
  }

  Future<void> _refreshHomes() async {
    _homes = await parser.readHomes();
  }
}
