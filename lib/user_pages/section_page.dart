import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tas/bloc/producer_state.dart';
import 'package:tas/bloc/section_bloc.dart';
import 'package:tas/provider/section_provider.dart';
import 'package:tas/provider/simle_provider.dart';

import '../models/ui.dart';

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
        if (state is SectionLoadedState) {
          //
          return listform(context, state);
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

  Widget listform(context, state) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            Ui.catalogs[Provider.of<SimpleProvider>(context).getuzru]!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(child: getListView(state))
      ],
    );
  }

  Widget getListView(state) {
    return ListView.builder(
        itemCount: state.loadedSection.length,
        itemBuilder: (context, index) {
          Uz_ru uz_ru = Provider.of<SimpleProvider>(context).getuzru;

          return InkWell(
              onTap: () {
                context
                    .read<SectionProvider>()
                    .changeSection(state.loadedSection[index]);
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
                                "${Ui.url}download/section/${state.loadedSection[index].imagepath}",
                                height: 180,
                                width: 200,
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.black26,
                            ),
                            Expanded(
                                child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                    (uz_ru == Uz_ru.UZ
                                            ? state.loadedSection[index].name
                                            : state.loadedSection[index].nameuz)
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Oswald",
                                    )),
                              ],
                            )),
                          ],
                        ))),
              ));
        });
  }
}
