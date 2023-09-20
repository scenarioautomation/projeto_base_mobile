import 'package:json_annotation/json_annotation.dart';
import 'package:projeto_base_mobile/home/model/home_model.dart';
part 'home_model_list.g.dart';

@JsonSerializable()
class HomeModelList {
  final List<HomeModel> homes;

  HomeModelList(this.homes);

  factory HomeModelList.fromJson(List<dynamic> json) {
    return HomeModelList(
      json.map((item) => HomeModel.fromJson(item)).toList(),
    );
  }

  List<dynamic> toJson() {
    return homes.map((item) => item.toJson()).toList();
  }
}
