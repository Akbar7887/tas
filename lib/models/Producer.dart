import 'ModelSet.dart';

class Producer {
  String active;
  int id;
  String imagepath;
  List<ModelSet>? modelSet;
  String name;

  Producer(
      {required this.active,
      required this.id,
      required this.imagepath,
      required this.modelSet,
      required this.name});

  factory Producer.fromJson(Map<String, dynamic> json) {
    return Producer(
      active: json['active'],
      id: json['id'],
      imagepath: json['imagepath'],
      modelSet: json['modelSet'] != null
          ? (json['modelSet'] as List).map((i) => ModelSet.fromJson(i)).toList()
          : null,
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['id'] = this.id;
    data['imagepath'] = this.imagepath;
    data['name'] = this.name;
    if (this.modelSet != null) {
      data['modelSet'] = this.modelSet?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
