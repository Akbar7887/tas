import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/newscompany_bloc.dart';
import '../bloc/producer_state.dart';
import '../models/News_Company.dart';
import '../models/ui.dart';

class NewsPage extends StatelessWidget {
  NewsPage();

  List<NewsCompany> _list = [];

  @override
  Widget build(BuildContext context) {
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
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.yellow[30]),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              _list[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Ui.textstyle),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _list[index].description,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: Ui.textstyle,
                                fontSize: 17),
                          ),
                          Image.network(
                            "${Ui.url}download/news/${_list[index].imagepath}",
                            height: 130,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              _list[index].date.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontFamily: Ui.textstyle,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ))));
        });
  }
}
