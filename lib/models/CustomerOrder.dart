

import 'ModelSet.dart';

class CustomerOrder {
  String? currentdate;
  int? id;
  ModelSet? modelset;

  CustomerOrder({required this.currentdate, this.id, required this.modelset});

  factory CustomerOrder.fromJson(Map<String, dynamic> json) {
    return CustomerOrder(
      currentdate: json['currentdate'],
      id: json['id'],
      modelset: json['model'] != null ? ModelSet.fromJson(json['model']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentdate'] = this.currentdate;
    data['id'] = this.id;
    if (this.modelset != null) {
      data['model'] = this.modelset?.toJson();
    }
    return data;
  }
}
