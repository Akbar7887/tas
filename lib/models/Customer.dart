import 'CustomerOrder.dart';

class Customer {
    List<CustomerOrder>? customerOrders;
    String? email;
    int? id;
    String? name;
    String? phone;


    Customer({ this.customerOrders,
         this.email,
        this.id,
         this.name,
         this.phone});

    factory Customer.fromJson(Map<String, dynamic> json) {
        return Customer(
            customerOrders: json['customerOrders'] != null ? (json['customerOrders'] as List).map((i) => CustomerOrder.fromJson(i)).toList() : null, 
            email: json['email'], 
            id: json['id'], 
            name: json['name'], 
            phone: json['phone']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['id'] = this.id;
        data['name'] = this.name;
        data['phone'] = this.phone;
        if (this.customerOrders != null) {
            data['customerOrders'] = this.customerOrders?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}