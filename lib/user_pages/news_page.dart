import 'package:TAS/provider/news_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../bloc/newscompany_bloc.dart';
import '../bloc/producer_state.dart';
import '../models/News_Company.dart';
import '../models/ui.dart';
import '../provider/simle_provider.dart';

var formatter = new DateFormat('yyyy-MM-dd');
Uz_ru? uz_ru;

class NewsPage extends StatelessWidget {
  NewsPage();

  List<NewsCompany> _list = [];

  @override
  Widget build(BuildContext context) {
    uz_ru = Provider.of<SimpleProvider>(context).getuzru;

    return BlocConsumer<NewsCompanyBloc, ProducerState>(
        builder: (context, state) {
          if (state is ProducerEmtyState) {
            return Center(child: Text("No data!"));
          }
          if (state is ProducerLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is NewsCompanyLoadedState) {
            _list = state.loadednews;

            return newsform();
          }
          if (state is ProducerErorState) {
            return Center(
              child: Text("Сервер не работает!"),
            );
          }
          return SizedBox.shrink();
        },
        listener: (context, state) {});
  }

  Widget newsform() {
    return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                  onTap: () {
                    context
                        .read<NewsProvider>()
                        .changenewscompany(_list[index]);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage1(
                    //     newsCompany: context.watch<NewsProvider>().getnewsCompany)));
                    context.read<SimpleProvider>().changepage(8);
                  },
                  child: Card(
                      elevation: 5,
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15)),
                      child: Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.yellow[30]),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  uz_ru == Uz_ru.RU
                                      ? _list[index].title!
                                      : _list[index].titleuz!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Ui.textstyle,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  formatter.format(DateTime.parse(
                                      _list[index].date.toString())),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Ui.textstyle,
                                      fontSize: 10),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "   " +
                                    (uz_ru! == Uz_ru.RU
                                        ? _list[index].description!
                                        : _list[index].descriptionuz!),
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: Ui.textstyle,
                                    fontSize: 10),
                              ),
                              Divider(),
                              Image.network(
                                "${Ui.url}download/news/${_list[index].imagepath}",
                                height: 130,
                              ),
                            ],
                          )))));
        });
  }
}
