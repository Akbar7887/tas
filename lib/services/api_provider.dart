import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Customer.dart';
import '../models/CustomerOrder.dart';
import '../models/ModelSet.dart';
import '../models/News_Company.dart';
import '../models/Producer.dart';
import '../models/Section.dart';
import '../models/ui.dart';

class ApiProvider {
  Map<String, String> header = {
    "Content-Type": "application/json",
  };

  Future<List<Producer>> getProducers() async {
    Uri uri = Uri.parse("${Ui.url}producerget");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

      return json.map((e) => Producer.fromJson(e)).toList();
    } else {
      throw Exception("Error");
    }
  }

  Future<List<ModelSet>> getModelAll() async {
    Uri uri = Uri.parse("${Ui.url}modelget");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

      return json.map((e) => ModelSet.fromJson(e)).toList();
    } else {
      throw Exception("Error");
    }
  }

  Future<Customer> postCustomer(Customer customer) async {
    // Map<String, dynamic> quiryParam = {
    //   "model_id": model_id,
    // };
    Uri uri = Uri.parse("${Ui.urllogin}/custom/customeradd");

    final response =
        await http.post(uri, body: json.encode(customer), headers: header);
    if (response.statusCode == 200) {
      var json = jsonDecode(utf8.decode(response.bodyBytes));

      return Customer.fromJson(json);
    } else {
      throw Exception("Error connect");
    }
  }

  Future<CustomerOrder> postCustomerOrder(
      CustomerOrder customerOrder, String customer_id) async {
    Map<String, dynamic> quiryParam = {
      "customer_id": customer_id,
    };
    Uri uri = Uri.parse("${Ui.urllogin}/custom/customerorderadd")
        .replace(queryParameters: quiryParam);

    final response =
        await http.post(uri, body: json.encode(customerOrder), headers: header);
    if (response.statusCode == 200) {
      var json = jsonDecode(utf8.decode(response.bodyBytes));

      return CustomerOrder.fromJson(json);
    } else {
      throw Exception("Error connect");
    }
  }

  Future<List<Section>> getSection() async {
    Uri uri = Uri.parse("${Ui.url}sectionget");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

      return json.map((e) => Section.fromJson(e)).toList();
    } else {
      throw Exception("Error");
    }
  }

  Future<List<NewsCompany>> getNews() async {
    Uri uri = Uri.parse("${Ui.url}newsget");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

      return json.map((e) => NewsCompany.fromJson(e)).toList();
    } else {
      throw Exception("Error");
    }
  }
}
