import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../bloc/producer_bloc.dart';
import '../bloc/producer_state.dart';
import '../models/ModelSet.dart';
import '../models/Producer.dart';
import '../models/Section.dart';
import '../models/ui.dart';
import '../provider/models_provider.dart';
import '../provider/section_provider.dart';
import '../provider/simle_provider.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool formlist = false;
  final numberFormat = NumberFormat.decimalPattern('en_us');
  List<Producer> producerlist = [];
  ProducerBloc? producerBloc;
  List<ModelSet> modelList = [];
  Uz_ru? uz_ru;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    uz_ru = Provider.of<SimpleProvider>(context).getuzru;

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
                    fontSize: 15,
                    fontFamily: Ui.textstyle,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w300),
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
    return BlocConsumer<ProducerBloc, ProducerState>(builder: (context, state) {
      if (state is ProducerEmtyState) {
        return Center(child: Text("No data!"));
      }

      if (state is ProducerLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is ProducerLoadedState) {
        producerlist = state.loadedProduser;
        modelList = [];

        for (Producer prod in producerlist) {
          // modelList!.addAll(prod.modelSet!);
          List<ModelSet> modellist = prod.modelSet!
              .where((element) => element.active == 'ACTIVE')
              .toList();
          for (ModelSet modelSet in modellist) {
            modelSet.country = prod.country;
            modelSet.countryuz = prod.countryuz;
            modelList.add(modelSet);
          }
        }
        ModelsProvider modelsProvider = Provider.of<ModelsProvider>(context);
        modelsProvider.changeListmodel(modelList);

        SectionProvider sectionProvider = context.watch<SectionProvider>();
        Section? section = sectionProvider.getSection;

        if (section != null) {
          modelList = modelList
              .where((element) => element.section!.id == section.id)
              .toList();
        }

        if (modelList.length != 0) {
          return Expanded(
              child: formlist == false
                  ? gridform(modelList)
                  : listform(modelList));
        }
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

  Future<Null> getmodellist() async {
    ProducerBloc producerBloc = BlocProvider.of<ProducerBloc>(context);
    producerBloc.getAll().then((value) {
      producerlist = value;
    });
  }

  Widget gridform(modelList) {
    return RefreshIndicator(
        onRefresh: getmodellist,
        child: GridView.builder(
            // scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 270),
            itemCount: modelList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.read<SimpleProvider>().changepage(2);
                  context.read<SimpleProvider>().changeindexSelected(index);
                  context.read<ModelsProvider>().changemodel(modelList[index]);
                },
                child: Container(
                    // height: 350,
                    // padding: EdgeInsets.all(10),
                    // color: index == context.watch<SimpleProvider>().getindexSelected
                    //     ? Colors.yellow
                    //     : Colors.white,
                    child: Card(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "${uz_ru == Uz_ru.UZ ? modelList[index].section.nameuz : modelList[index].section.name}: ${modelList[index].producername} (${uz_ru == Uz_ru.RU ? modelList[index].country.toString().toLowerCase() : modelList[index].countryuz.toString().toLowerCase()})", //
                            style: TextStyle(
                                color: Colors.indigo,
                                fontFamily: Ui.textstyle,
                                fontWeight: FontWeight.w400),
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
                        // Divider(color: Colors.white),
                        SizedBox(
                          // alignment: Alignment.center,
                          child: Image.network(
                            "${Ui.url}download/model/${modelList[index].imagepath}",
                            height: 100,
                          ),
                        ),
                        Spacer(),
                        Divider(),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            Ui.cena[uz_ru]!,
                            style: TextStyle(
                                // fontFamily: Ui.textstyle,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10, bottom: 5),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '${numberFormat.format(modelList[index].priceuzs)} ${Ui.excchange[context.watch<SimpleProvider>().getuzru]}',
                            style: TextStyle(
                                // fontSize: 18,
                                fontFamily: Ui.textstyle,
                                color: Colors.indigo,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w200),
                          ),
                        )
                      ]),
                )),
              );
            }));
  }

  Widget listform(modelList) {
    return ListView.builder(
        itemCount: modelList.length,
        itemBuilder: (context, index) {
          // context.read<ModelsProvider>().changemodel(state.loadedModel[0]);

          return InkWell(
              onTap: () {
                context.read<SimpleProvider>().changepage(2);
                context.read<SimpleProvider>().changeindexSelected(index);
                context.read<ModelsProvider>().changemodel(modelList[index]);
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
                                    "${uz_ru == Uz_ru.UZ ? modelList[index].section.nameuz : modelList[index].section.name}: ${modelList[index].producername} (${uz_ru == Uz_ru.RU ? modelList[index].country.toString().toLowerCase() : modelList[index].countryuz.toString().toLowerCase()})", //
                                    style: TextStyle(
                                        fontFamily: Ui.textstyle,
                                        fontWeight: FontWeight.w400,
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
                                  child: Text(Ui.cena[uz_ru]!,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w200)),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    '${numberFormat.format(modelList[index].priceuzs)} ${Ui.excchange[context.watch<SimpleProvider>().getuzru]}',
                                    style: TextStyle(
                                        // fontSize: 18,
                                        color: Colors.indigo,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: Ui.textstyle),
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
