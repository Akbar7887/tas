import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tas/bloc/model_bloc.dart';
import 'package:tas/bloc/producer_state.dart';
import 'package:tas/models/ModelSet.dart';
import 'package:tas/provider/models_provider.dart';
import 'package:tas/provider/section_provider.dart';
import 'package:tas/provider/simle_provider.dart';

import '../models/Section.dart';
import '../models/ui.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool formlist = false;
  final numberFormat = NumberFormat.simpleCurrency(locale: "UZ");

  // Section? section;

  // @override
  // void initState() {
  //   super.initState();
  // } // int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 50,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                Ui.f1[context.watch<SimpleProvider>().getuzru]!,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Oswald",
                    color: Colors.indigo,
                    fontWeight: FontWeight.w200),
              ),
            ),

            Spacer(
              flex: 4,
            ),
            // Divider(),
            Container(
              child: IconButton(
                icon: Icon(Icons.view_module),
                onPressed: () {
                  setState(() {
                    formlist = false;
                  });
                },
                iconSize: 30,
                color: Colors.amber,
              ),
            ),
            Container(
                // alignment: Alignment.topRight,
                child: IconButton(
              icon: Icon(Icons.view_list),
              iconSize: 30,
              color: Colors.amber,
              onPressed: () {
                setState(() {
                  formlist = true;
                });
              },
            ))
          ],
        ),
      ),
      mainread(),
    ]);
  }

  Widget mainread() {
    return BlocConsumer<ModelBloc, ProducerState>(builder: (context, state) {
      if (state is ProducerEmtyState) {
        return Center(child: Text("No data!"));
      }

      if (state is ProducerLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is ModelLoadedState) {
        List<ModelSet>? modelList = [];
        if (context.watch<SectionProvider>().getSection?.id != null) {
          modelList = state.loadedModel
              .where((element) =>
                  element.section?.id ==
                  context.watch<SectionProvider>().getSection?.id)
              .toList();
          return Expanded(
              child: formlist == false
                  ? gridform(modelList)
                  : listform(modelList));
        } else {
          modelList = state.loadedModel;
          return Expanded(
              child: formlist == false
                  ? gridform(modelList)
                  : listform(modelList));
        }
        //

      }

      if (state is ProducerErorState) {
        return Center(
          child: Text("Сервер не работает!"),
        );
      }

      return SizedBox.shrink();
    }, listener: (context, state) {
      // if (state is ProducerLoadedState) {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text("Produer is loaded")));
      // }
    });
  }

  Widget gridform(modelList) {
    return GridView.builder(
        // scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 210),
        itemCount: modelList.length,
        itemBuilder: (context, index) {
          // context.read<ModelsProvider>().changemodel(state.loadedModel[0]);
          return InkWell(
            onDoubleTap: () {
              context.read<SimpleProvider>().changepage(2);
              context.read<SimpleProvider>().changetitle("Выше выбор!");
              context.read<SimpleProvider>().changeindexSelected(index);
              context.read<ModelsProvider>().changemodel(modelList[index]);
            },
            onTap: () {
              context.read<ModelsProvider>().changemodel(modelList[index]);
              context.read<SimpleProvider>().changeindexSelected(index);
            },
            child: Container(
                // height: 350,
                // padding: EdgeInsets.all(10),
                color: index == context.watch<SimpleProvider>().getindexSelected
                    ? Colors.yellow
                    : Colors.white,
                child: Card(
                  child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "${modelList[index].section.name}: ${modelList[index].producername}",
                            style: TextStyle(
                                color: Colors.indigo,
                                fontFamily: Ui.textstyle,
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${modelList[index].name}",
                              style: TextStyle(
                                  fontFamily: Ui.textstyle,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            )),
                        Container(
                          child: Image.network(
                            "${Ui.url}download/model/${modelList[index].imagepath}",
                            height: 80,
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "цены от ",
                            style: TextStyle(
                                // fontFamily: Ui.textstyle,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '${numberFormat.format(modelList[index].price)}',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: Ui.textstyle,
                                color: Colors.indigo,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w200),
                          ),
                        )
                      ]),
                )),
          );
        });
  }

  Widget listform(modelList) {
    return ListView.builder(
        itemCount: modelList.length,
        itemBuilder: (context, index) {
          // context.read<ModelsProvider>().changemodel(state.loadedModel[0]);

          return InkWell(
              onDoubleTap: () {
                context.read<SimpleProvider>().changepage(2);
                context.read<SimpleProvider>().changetitle("Выше выбор!");
                context.read<SimpleProvider>().changeindexSelected(index);
                context.read<ModelsProvider>().changemodel(modelList[index]);
              },
              onTap: () {
                context.read<ModelsProvider>().changemodel(modelList[index]);
                context.read<SimpleProvider>().changeindexSelected(index);
              },
              child: Container(
                color: index == context.watch<SimpleProvider>().getindexSelected
                    ? Colors.yellow
                    : Colors.white,
                child: Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Spacer(),
                        // VerticalDivider(color: Colors.black,width: 2,),
                        Container(
                          width: 150,
                          // alignment: Alignment.topRight,
                          padding: EdgeInsets.all(10),
                          child: Image.network(
                            "${Ui.url}download/model/${modelList[index].imagepath}",
                            height: 80,
                          ),
                        ),
                        Container(
                            width: 220,
                            padding: EdgeInsets.all(10),
                            // alignment: Alignment.topLeft,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${modelList[index].section.name}: ${modelList[index].producername}",
                                    style: TextStyle(
                                        fontFamily: Ui.textstyle,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.indigo),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${modelList[index].name}",
                                    style: TextStyle(
                                        fontFamily: Ui.textstyle,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20),
                                  ),
                                ),
                                const Divider(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text("цены от ",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w200)),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "${numberFormat.format(modelList[index].price)}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.indigo,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w200),
                                  ),
                                )
                              ],
                            )),
                      ]),
                ),
              ));
        });
  }
}
