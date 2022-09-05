import 'package:TAS/provider/simle_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/News_Company.dart';
import '../models/ui.dart';

var formatter = new DateFormat('yyyy-MM-dd');

class NewsPage1 extends StatelessWidget {
  final NewsCompany newsCompany;

  NewsPage1({required this.newsCompany});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.read<SimpleProvider>().changepage(7);
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            newsCompany.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: Ui.textstyle,
                fontSize: 20),
          ),
        ),

        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.bottomLeft,
          child: Text(
            formatter.format(DateTime.parse(newsCompany.date.toString())),
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: Ui.textstyle,
                fontSize: 10),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "   " + newsCompany.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: Ui.textstyle,
                  fontSize: 15),
            )),
        Divider(),
        Image.network(
          "${Ui.url}download/news/${newsCompany.imagepath}",
          height: 250,
        ),
      ],
    );
  }
}
