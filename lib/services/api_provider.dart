import 'dart:convert';

import 'package:tas/models/ModelSet.dart';
import 'package:tas/models/News_Company.dart';
import 'package:tas/models/Producer.dart';
import 'package:http/http.dart' as http;
import 'package:tas/models/Section.dart';
import 'package:tas/models/ui.dart';

import '../models/Customer.dart';

class ApiProvider{
  Map<String, String> header = {
    "Content-Type": "application/json",
  };

  Future<List<Producer>> getProducers() async{

    Uri uri = Uri.parse("${Ui.url}producerget");
    final response =  await http.get(uri);

    if(response.statusCode == 200){

      final List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

      return json.map((e) => Producer.fromJson(e)).toList();

    }else{
      throw Exception("Error");
    }
  }

  Future<List<ModelSet>> getModelAll() async{
    Uri uri = Uri.parse("${Ui.url}modelget");
    final response =  await http.get(uri);

    if(response.statusCode == 200){

      final List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

      return json.map((e) => ModelSet.fromJson(e)).toList();

    }else{
      throw Exception("Error");
    }
  }

  Future<Customer> postCustomer(Customer customer) async{
    Uri uri = Uri.parse("${Ui.url}customeradd");

    final response = await http.post(uri, body: json.encode(customer), headers: header);
    if(response.statusCode == 200){

      var json = jsonDecode(utf8.decode(response.bodyBytes));

      return Customer.fromJson(json);

    }else{
      throw Exception("Error connect");
    }

  }

  Future<List<Section>> getSection() async{
    Uri uri = Uri.parse("${Ui.url}sectionget");
    final response =  await http.get(uri);

    if(response.statusCode == 200){

      final List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

      return json.map((e) => Section.fromJson(e)).toList();

    }else{
      throw Exception("Error");
    }
  }

  Future<List<NewsCompany>> getNews() async{
    Uri uri = Uri.parse("${Ui.url}newsget");
    final response =  await http.get(uri);

    if(response.statusCode == 200){

      final List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

      return json.map((e) => NewsCompany.fromJson(e)).toList();

    }else{
      throw Exception("Error");
    }
  }
}