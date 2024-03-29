import 'package:TAS/provider/models_provider.dart';
import 'package:TAS/provider/simle_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

import '../models/ModelSet.dart';
import '../models/credit.dart';
import '../models/ui.dart';

class LisingPage extends StatefulWidget {
  const LisingPage({Key? key}) : super(key: key);

  @override
  State<LisingPage> createState() => _LisingPageState();
}

class _LisingPageState extends State<LisingPage> {
  Uz_ru uz_ru = Uz_ru.RU;
  TextEditingController amount = TextEditingController();
  TextEditingController advancepoc = TextEditingController(text: '0.00');
  TextEditingController advance = TextEditingController(text: '0.00');
  TextEditingController komissiya = TextEditingController(text: '0.00');
  final numberFormat = NumberFormat('###,###.00', 'en_US');

  //final numberFormat = NumberFormat.compactSimpleCurrency();

  // TextEditingController srokgod = TextEditingController();
  List<int> listadvance = [];
  int? i = 30;
  List<int> listmarga = [];
  int? marja = 18;
  int srok = 3;
  List<int> listsrok = [];
  int kom = 3;
  List<int> listkom = [];
  double kreditamount = 0;
  List<Credit> listgrafik = [];
  List<ModelSet> listModelSet = [];
  ModelSet? modelSet;
  double advanceN = 0;

  void getlistadvance() {
    for (int k = 10; k <= 100; k = k + 10) {
      listadvance.add(k);
    }
  }

  void getlistmarga() {
    for (int j = 5; j <= 100; j++) {
      listmarga.add(j);
    }
  }

  void getlistsrok() {
    for (int j = 1; j <= 20; j++) {
      listsrok.add(j);
    }
  }

  void getlistkom() {
    for (int j = 1; j <= 10; j++) {
      listkom.add(j);
    }
  }

  List<Credit> getGrafik() {
    if (kreditamount == 0) {
      return [];
    }

    double remainder = 0;

    listgrafik.clear();
    for (int p = 1; p <= (srok * 12); p++) {
      double maindebt = kreditamount / (srok * 12);
      double procertamount =
          (kreditamount * ((marja! / 100) / (srok * 12) * srok));
      if (listgrafik.length == 0) {
        remainder = kreditamount - maindebt;
      } else {
        remainder = listgrafik.last.remainder! - maindebt;
      }
      listgrafik.add(Credit(
          mec: p,
          maindebt: maindebt,
          procertamount: procertamount,
          total: maindebt + procertamount,
          remainder: remainder));
    }
    listgrafik.add(Credit(
        mec: 0,
        maindebt: listgrafik.fold(0.0, (previousValue, element) {
          return (previousValue! + element.maindebt!);
        }),
        procertamount: listgrafik.fold(0.0, (previousValue, element) {
          return (previousValue! + element.procertamount!);
        }),
        total: listgrafik.fold(0.0, (previousValue, element) {
          return (previousValue! + element.total!);
        }),
        remainder: 0.00));

    return listgrafik;
  }

  @override
  void initState() {
    super.initState();
    getlistadvance();
    getlistmarga();
    getlistsrok();
    getlistkom();

    // modelBloc = BlocProvider.of<ModelBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    uz_ru = context.watch<SimpleProvider>().getuzru;
    listModelSet = context.watch<ModelsProvider>().getlist;
    return ListView(
      children: [
        Container(
          // decoration:
          // BoxDecoration(borderRadius: BorderRadius.circular(20)),
          // margin: EdgeInsets.all(20 ),
          child: Card(
              elevation: 5,
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.all(10),
                // color: Colors.white24,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        Ui.kalkulyat[uz_ru]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: Ui.textstyle,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: DropdownButton<ModelSet>(
                        hint: Text(
                          Ui.model[uz_ru]!,
                          style: TextStyle(
                            fontFamily: Ui.textstyle,
                          ),
                        ),
                        isExpanded: true,
                        value: modelSet,
                        items: listModelSet.map((e) {
                          return DropdownMenuItem(
                            child: Text(
                              '${e.producername} - ${e.section!.name} - ${e.name} ',
                              style: TextStyle(fontFamily: Ui.textstyle),
                            ),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (newModelSet) {
                          setState(() {
                            modelSet = newModelSet;
                            amount.text =
                                numberFormat.format(modelSet!.priceuzs!);

                            if (modelSet!.priceuzs != 0) {
                              advance.text = numberFormat
                                  .format((modelSet!.priceuzs! * (i! / 100)));
                              advanceN = (modelSet!.priceuzs! * (i! / 100));
                              komissiya.text = numberFormat
                                  .format((modelSet!.priceuzs! * (kom / 100)));
                              kreditamount = modelSet!.priceuzs! -
                                  advanceN; // double.parse(advance.text);
                              listgrafik = getGrafik();
                            } else {
                              advance.text = "";
                              komissiya.text = "";
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: TextFormField(
                        style: TextStyle(
                          fontFamily: Ui.textstyle,
                        ),
                        controller: amount,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(19),
                          ThousandsFormatter(),
                          // FilteringTextInputFormatter.allow(
                          //     RegExp(r'^\d+\.?\d{0,2}')),
                          // FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: Ui.summatexniki[uz_ru],
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.indigo,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.indigo)),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            if (double.parse(newValue.replaceAll(",", "")) !=
                                0) {
                              advance.text =
                                  (double.parse(newValue.replaceAll(",", "")) *
                                          (i! / 100))
                                      .toString();
                              advanceN =
                                  (double.parse(newValue.replaceAll(",", "")) *
                                      (i! / 100));
                              komissiya.text =
                                  (double.parse(newValue.replaceAll(",", "")) *
                                          (kom / 100))
                                      .toString();
                              kreditamount =
                                  double.parse(newValue.replaceAll(",", "")) -
                                      advanceN;
                              listgrafik = getGrafik();
                            } else {
                              advance.text = "";
                              komissiya.text = "";
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        Ui.advonceproc[uz_ru]!,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                            fontFamily: Ui.textstyle),
                      ),
                    ),
                    Container(
                        // alignment: Alignment.topLeft,
                        child: Row(
                      children: [
                        Expanded(
                          child: DropdownButton<int>(
                            // hint: Text(Ui.advonceproc[uz_ru]!),
                            // isExpanded: false,
                            value: i,
                            items: listadvance.map((e) {
                              return DropdownMenuItem<int>(
                                child: Text(
                                  '${e.toString()} %',
                                  style: TextStyle(
                                    fontFamily: Ui.textstyle,
                                  ),
                                ),
                                value: e,
                              );
                            }).toList(),
                            onChanged: (newvalue) {
                              setState(() {
                                i = newvalue!;
                                if (amount.text.isNotEmpty) {
                                  advance.text = (double.parse(
                                              amount.text.replaceAll(",", "")) *
                                          (newvalue / 100))
                                      .toString();
                                  advanceN = (double.parse(
                                          amount.text.replaceAll(",", "")) *
                                      (newvalue / 100));
                                  kreditamount = double.parse(
                                          amount.text.replaceAll(",", "")) -
                                      advanceN;
                                  listgrafik = getGrafik();
                                }
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              style: TextStyle(
                                fontFamily: Ui.textstyle,
                              ),
                              enabled: false,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              controller: advance,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(19),
                                ThousandsFormatter(),
                                // FilteringTextInputFormatter.allow(
                                //     RegExp(r'[0-9]')),
                                // FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                // labelText: Ui.advonceproc[uz_ru],
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.5,
                                      color: Colors.indigo,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.indigo)),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              Ui.marga[uz_ru]!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Ui.textstyle,
                                  color: Colors.blue),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: DropdownButton<int>(
                              // hint: Text(Ui.advonceproc[uz_ru]!),
                              // isExpanded: false,
                              value: marja,
                              items: listmarga.map((e) {
                                return DropdownMenuItem<int>(
                                  child: Text(
                                    '${e.toString()} %',
                                    style: TextStyle(
                                      fontFamily: Ui.textstyle,
                                    ),
                                  ),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (newvalu1) {
                                setState(() {
                                  marja = newvalu1!;
                                  listgrafik = getGrafik();
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              Ui.srok[uz_ru]!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Ui.textstyle,
                                  color: Colors.blue),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: DropdownButton<int>(
                              // hint: Text(Ui.advonceproc[uz_ru]!),
                              // isExpanded: false,
                              value: srok,
                              items: listsrok.map((e) {
                                return DropdownMenuItem<int>(
                                  child: Text(
                                    '${e.toString()}',
                                    style: TextStyle(
                                      fontFamily: Ui.textstyle,
                                    ),
                                  ),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (newvalu1) {
                                setState(() {
                                  srok = newvalu1!;
                                  listgrafik = getGrafik();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        Ui.komissiya[uz_ru]!,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                          fontFamily: Ui.textstyle,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: DropdownButton<int>(
                              // hint: Text(Ui.advonceproc[uz_ru]!),
                              // isExpanded: false,
                              value: kom,
                              items: listkom.map((e) {
                                return DropdownMenuItem<int>(
                                  child: Text(
                                    '${e.toString()} %',
                                    style: TextStyle(
                                      fontFamily: Ui.textstyle,
                                    ),
                                  ),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (newvalu1) {
                                setState(() {
                                  kom = newvalu1!;
                                  if (amount.text.isNotEmpty) {
                                    komissiya.text = (double.parse(amount.text
                                                .replaceAll(",", "")) *
                                            (newvalu1 / 100))
                                        .toString();
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 40,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontFamily: Ui.textstyle,
                                ),
                                enabled: false,
                                controller: komissiya,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(19),
                                  ThousandsFormatter(),
                                ],
                                decoration: InputDecoration(
                                  // labelText: Ui.advonceproc[uz_ru],
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.indigo,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.indigo)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Divider(),
                  ],
                ),
              )),
        ),
        listgrafik.length != 0 ? getDataTable() : Container(),
      ],
    );
  }

  Widget getDataTable() {
    return Container(
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Container(
              child: Text(
                Ui.kredittable[uz_ru]!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(Ui.kreditsum[uz_ru]!),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${numberFormat.format(kreditamount)} ${Ui.excchange[context.watch<SimpleProvider>().getuzru]}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: DataTable(
                headingRowHeight: 40,
                headingTextStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                headingRowColor:
                    MaterialStateProperty.all(Colors.amberAccent[100]),
                dataRowHeight: 17,
                columnSpacing: 0.5,
                border: TableBorder.all(width: 0.1),
                columns: [
                  DataColumn(
                      label: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(Ui.mes[uz_ru]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10)))),
                  DataColumn(
                      label: Text(Ui.osndolg[uz_ru]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10))),
                  DataColumn(
                      label: Text(
                    Ui.procpog[uz_ru]!,
                    textAlign: TextAlign.center,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10),
                  )),
                  DataColumn(
                      label: Text(
                    Ui.remainder[uz_ru]!,
                    textAlign: TextAlign.center,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10),
                  )),
                  DataColumn(
                      label: Text(Ui.summaplateja[uz_ru]!,
                          textAlign: TextAlign.center,
                          // overflow: TextOverflow.,
                          style: TextStyle(fontSize: 10))),
                ],
                rows: listgrafik.map((e) {
                  return DataRow(
                      color: listgrafik.last == e
                          ? MaterialStateProperty.all(Colors.amberAccent[100])
                          : MaterialStateProperty.all(Colors.white),
                      cells: [
                        DataCell(Text(
                          textAlign: TextAlign.center,
                          listgrafik.last == e ? "Итого:" : e.mec.toString(),
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: listgrafik.last == e
                                  ? FontWeight.bold
                                  : FontWeight.w400),
                        )),
                        DataCell(
                          Text(
                            textAlign: TextAlign.end,
                            numberFormat.format(e.maindebt!),
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: listgrafik.last == e
                                    ? FontWeight.bold
                                    : FontWeight.w400),
                          ),
                        ),
                        DataCell(
                          Text(
                            textAlign: TextAlign.end,
                            numberFormat.format(e.procertamount!),
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: listgrafik.last == e
                                    ? FontWeight.bold
                                    : FontWeight.w400),
                          ),
                        ),
                        DataCell(
                          Container(
                              child: Text(
                                  listgrafik.last == e
                                      ? ""
                                      : numberFormat.format(e.remainder!),
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontSize: 9)),
                              alignment: Alignment.centerRight),
                        ),
                        DataCell(
                          Text(numberFormat.format(e.total!),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 9, fontWeight: FontWeight.bold)),
                        ),
                      ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
