import 'OptionSet.dart';
import 'Section.dart';

class ModelSet {
  String active;
  int id;
  String imagepath;
  String name;
  double? price;
  double? priceuzs;
  String description;
  String producername;
  Section? section;
  String? country;
  String? countryuz;
  List<OptionSet>? optionSet;

  ModelSet(
      {required this.active,
      required this.id,
      required this.imagepath,
      required this.name,
      this.price,
      this.priceuzs,
      required this.description,
      required this.producername,
      required this.section,
      required this.optionSet,
      this.country,
      this.countryuz});

  factory ModelSet.fromJson(Map<String, dynamic> json) {
    return ModelSet(
      active: json['active'],
      id: json['id'],
      imagepath: json['imagepath'],
      name: json['name'],
      price: json['price'],
      priceuzs: json['priceuzs'],
      description: json['description'],
      producername: json['producername'],
      section:
          json['section'] != null ? Section.fromJson(json['section']) : null,
      optionSet: json['optionSet'] != null
          ? (json['optionSet'] as List)
              .map((i) => OptionSet.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['id'] = this.id;
    data['imagepath'] = this.imagepath;
    data['name'] = this.name;
    data['price'] = this.price;
    data['priceuzs'] = this.priceuzs;
    data['description'] = this.description;
    data['producername'] = this.producername;
    if (this.section != null) {
      data['section'] = this.section?.toJson();
    }
    if (this.optionSet != null) {
      data['optionSet'] = this.optionSet?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
