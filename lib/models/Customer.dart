import 'CustomerOrder.dart';
import 'ModelSet.dart';

class Customer {
    List<CustomerOrder>? customerOrders;
    String? email;
    int? id;
    String name;
    String phone;
    ModelSet? modelset;

    Customer({ required this.customerOrders,
        required this.email,
        this.id,
        required this.name,
        required this.phone,
    this.modelset});

    factory Customer.fromJson(Map<String, dynamic> json) {
        return Customer(
            customerOrders: json['customerOrders'] != null ? (json['customerOrders'] as List).map((i) => CustomerOrder.fromJson(i)).toList() : null, 
            email: json['email'], 
            id: json['id'], 
            name: json['name'], 
            phone: json['phone'],
            modelset: json['modelset'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['id'] = this.id;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['modelset'] = this.modelset;
        if (this.customerOrders != null) {
            data['customerOrders'] = this.customerOrders?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}