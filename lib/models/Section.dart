class Section {
  int id;
  String name;
  String? nameuz;
  String imagepath;

  Section({required this.id, required this.name, required this.nameuz, required this.imagepath});

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'],
      name: json['name'],
      nameuz: json['nameuz'],
      imagepath: json['imagepath'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nameuz'] = this.nameuz;
    data['imagepath'] = this.imagepath;
    return data;
  }
}
