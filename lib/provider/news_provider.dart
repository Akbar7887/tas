import 'package:TAS/models/News_Company.dart';
import 'package:flutter/widgets.dart';



class NewsProvider with ChangeNotifier {


  NewsCompany? newsCompany;

  NewsCompany get getnewsCompany => newsCompany!;

  void changenewscompany(NewsCompany newnewscompany){
    this.newsCompany = newnewscompany;
    notifyListeners();

  }

}