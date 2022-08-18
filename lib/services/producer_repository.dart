import 'package:tas/models/Customer.dart';
import 'package:tas/models/ModelSet.dart';
import 'package:tas/models/News_Company.dart';
import 'package:tas/models/Producer.dart';
import 'package:tas/models/Section.dart';
import 'package:tas/services/api_provider.dart';

class Repository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<Producer>> getAllProducers() => _apiProvider.getProducers();

  Future<List<ModelSet>> getAllModels() => _apiProvider.getModelAll();

  Future<Customer> postCustomer(Customer customer, String model_id) =>
      _apiProvider.postCustomer(customer, model_id);

  Future<List<Section>> getSections() => _apiProvider.getSection();

  Future<List<NewsCompany>> getNews() => _apiProvider.getNews();
}
