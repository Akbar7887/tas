import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tas/bloc/producer_state.dart';
import 'package:tas/bloc/section_bloc.dart';
import 'package:tas/models/ModelSet.dart';
import 'package:tas/models/Section.dart';
import 'package:tas/provider/models_provider.dart';
import 'package:tas/provider/section_provider.dart';
import 'package:tas/provider/simle_provider.dart';

import '../models/ui.dart';

List<Section> listSection = [];

class SectionPage extends StatelessWidget {
  const SectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SectionBloc, ProducerState>(
      builder: (context, state) {
        if (state is ProducerEmtyState) {
          return Center(child: Text("No data!"));
        }

        if (state is ProducerLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        listSection.clear();
        if (state is SectionLoadedState) {
         List<Section> listSection1 = state.loadedSection;

          ModelsProvider modelsProvider = Provider.of<ModelsProvider>(context);
          List<ModelSet> modellist = modelsProvider.getlist;
          for (Section section in listSection1) {
            Iterable result = modellist.where((element) => element.section!.id == section.id);
            if(result.length != 0){
              listSection.add(section);
            }
          }

          return listform(context);
        }

        if (state is ProducerErorState) {
          return Center(
            child: Text("Сервер не работает!"),
          );
        }
        return SizedBox.shrink();
      },
      listener: (context, state) {},
    );
  }

  Widget listform(context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            Ui.catalogs[Provider.of<SimpleProvider>(context).getuzru]!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(child: getListView())
      ],
    );
  }

  Widget getListView() {
    return ListView.builder(
        itemCount: listSection.length,
        itemBuilder: (context, index) {
          Uz_ru uz_ru = Provider.of<SimpleProvider>(context).getuzru;

          return InkWell(
              onTap: () {
                context
                    .read<SectionProvider>()
                    .changeSection(listSection[index]);
                context.read<SimpleProvider>().changepage(1);
              },
              child: Container(
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border(),),
                padding: EdgeInsets.only(left: 10, right: 10),
                // margin: EdgeInsets.all(0),
                height: 100,
                child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.yellow[40]),
                        padding: EdgeInsets.all(5),
                        // color: Colors.red,
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(width: 10,),
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: Image.network(
                                "${Ui.url}download/section/${listSection[index].imagepath}",
                                height: 180,
                                width: 200,
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.black26,
                            ),
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                  (uz_ru == Uz_ru.UZ
                                          ? listSection[index].nameuz
                                          : listSection[index].name)
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: Ui.textstyle,
                                  )),
                            )),
                          ],
                        ))),
              ));
        });
  }
}
