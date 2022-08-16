import 'ModelSet.dart';

class Producer {
  int? id;
  String? imagepath;
  List<ModelSet>? modelSet;
  String? name;
  String? country;
  String? countryuz;

  Producer(
      {required this.id,
      required this.imagepath,
      required this.modelSet,
      required this.name,
      required this.country,
      required this.countryuz});

  factory Producer.fromJson(Map<String, dynamic> json) {
    return Producer(
        id: json['id'],
        imagepath: json['imagepath'],
        modelSet: json['modelSet'] != null
            ? (json['modelSet'] as List)
                .map((i) => ModelSet.fromJson(i))
                .toList()
            : null,
        name: json['name'],
        country: json['country'],
        countryuz: json['countryuz']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imagepath'] = this.imagepath;
    data['name'] = this.name;
    if (this.modelSet != null) {
      data['modelSet'] = this.modelSet?.map((v) => v.toJson()).toList();
    }
    data['country'] = this.country;
    data['countryuz'] = this.countryuz;
    return data;
  }
}
