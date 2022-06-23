class OptionConstant {
  int id;
  String? namerus;
  String? nameuz;

  OptionConstant(
      {required this.id, required this.namerus, required this.nameuz});

  factory OptionConstant.fromJson(Map<String, dynamic> json) {
    return OptionConstant(
      id: json['id'],
      namerus: json['namerus'],
      nameuz: json['nameuz'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['namerus'] = this.namerus;
    data['nameuz'] = this.nameuz;
    return data;
  }
}
