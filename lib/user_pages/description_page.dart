import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tas/models/ModelSet.dart';
import 'package:tas/provider/models_provider.dart';
import 'package:tas/provider/simle_provider.dart';

import '../models/ui.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  // late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    ModelSet modelSet = context.watch<ModelsProvider>().getmodel;
    // _tabController = TabController(length: 2, vsync: this);
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              child: TabBar(
                  // controller: _tabController,
                  tabs: [
                    Tab(text: Ui.d1[context.watch<SimpleProvider>().getuzru]),
                    Tab(text: Ui.d2[context.watch<SimpleProvider>().getuzru]),
                  ]),
            ),
            Expanded(child: TabBarView(
                // controller: _tabController,
                children: [description(context,modelSet), options(modelSet)])),
          ],
        ));
  }

  Widget description(BuildContext context,ModelSet modelSet) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            "${modelSet.section!.name}-${modelSet.producername}:",
            style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20,
                fontFamily: "Oswald"),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  "модель:",
                  style: TextStyle(
                      fontWeight: FontWeight.w200, fontFamily: "Oswald"),
                ),
                SizedBox(width: 5,),
                Text(
                  "${modelSet.name}",
                  style: TextStyle(fontFamily: "OpenSans", fontSize: 20),
                ),
              ],
            )),
        Container(
          width: 150,
          // alignment: Alignment.topRight,
          padding: EdgeInsets.all(10),
          child: Image.network(
            "${Ui.url}download/model/${modelSet.imagepath}",
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            Ui.d1[context.watch<SimpleProvider>().getuzru]!,
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            "${modelSet.description}",
            style: TextStyle(
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.italic,
                fontSize: 13),
          ),
        ),
      ],
    );
  }

  Widget options(ModelSet modelSet) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: modelSet.optionSet?.length,
                itemBuilder: (context, idx) {
                  String? textconstat = "";
                  String? textname = "";
                  if (modelSet.optionSet?.length != 0) {
                    // modelSet.optionSet?.sort((a, b) => a
                    //     .optionConstant?.namerus!
                    //     .compareTo(b.optionConstant?.namerus!));
                    //
                    if(context.watch<SimpleProvider>().getuzru.name == "RU"){
                      textconstat =
                          modelSet.optionSet?[idx].optionConstant?.namerus;
                    }else{
                      textconstat =
                          modelSet.optionSet?[idx].optionConstant?.nameuz;
                    }

                    textname = modelSet.optionSet?[idx].optionname;
                  }
                  return Container(
                      height: 70,
                      child: Card(
                        elevation: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(textconstat!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic))),
                              Expanded(
                                  child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  textname!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ));
                }))
      ],
    );
  }
}
