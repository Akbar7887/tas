import 'package:TAS/models/CustomerOrder.dart';

import '../models/Customer.dart';
import '../models/ModelSet.dart';
import '../models/News_Company.dart';
import '../models/Producer.dart';
import '../models/Section.dart';
import 'api_provider.dart';

class Repository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<Producer>> getAllProducers() => _apiProvider.getProducers();

  Future<List<ModelSet>> getAllModels() => _apiProvider.getModelAll();

  Future<Customer> postCustomer(Customer customer) =>
      _apiProvider.postCustomer(customer);

  Future<List<Section>> getSections() => _apiProvider.getSection();

  Future<List<NewsCompany>> getNews() => _apiProvider.getNews();

  Future<CustomerOrder> postCustomerOrder(
          CustomerOrder customerOrder, String customer_id) =>
      _apiProvider.postCustomerOrder(customerOrder, customer_id);
}
