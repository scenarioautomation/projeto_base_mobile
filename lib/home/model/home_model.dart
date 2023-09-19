class HomeModel {
  final String name;
  final String imagePath;

  HomeModel({required this.name, required this.imagePath});

  @override
  String toString() {
    return 'HomeModel{name: $name, imagePath: $imagePath}';
  }
}
