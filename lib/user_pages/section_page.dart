import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return listform(state);
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

  Widget listform(state) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            "Каталоги",
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
          return InkWell(
              onTap: () {
                context.read<SectionProvider>().changeSection(state.loadedSection[index]);
                context.read<SimpleProvider>().changepage(1);

              },
              child: Container(
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border(),),
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 100,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.yellow[50]),
                        padding: EdgeInsets.all(10),
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              "${Ui.url}download/section/${state.loadedSection[index].imagepath}",
                            ),
                            // VerticalDivider(color: Colors.black45,),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                                child: Text(
                              state.loadedSection[index].name,
                              style: TextStyle(
                                fontSize: 30,
                                // sfontFamily: "Oswald",
                              ),
                            ))
                          ],
                        ))),
              ));
        });
  }
}
