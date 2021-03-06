import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tas/provider/simle_provider.dart';

import '../models/ui.dart';

class AboutCompany extends StatelessWidget {
  const AboutCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              child: TabBar(
                  labelStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                  tabs: [
                    Tab(
                      text: "О Компании",
                    ),
                    Tab(
                      text: "Сертификаты",
                    ),
                  ]),
            ),
            Expanded(
                child: TabBarView(children: [about(context), sertificete()]))
          ],
        ));
  }

  Widget about(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Wrap(
              children: [
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                      text: Ui.description[context.watch<SimpleProvider>().getuzru]),
                )
              ],
            )),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
           Ui.tema1[context.watch<SimpleProvider>().getuzru]!,
            style: TextStyle(
                fontFamily: Ui.textstyle,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 50,

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo, width: 0.2),
                ),
                padding: EdgeInsets.all(10),
                // margin: EdgeInsets.only(left: 10, right: 10),
                child: Image.asset(
                  "assets/images/xcmg.png",
                  width: 100,
                ),
              ),
              Container(
                height: 50,

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo, width: 0.2),
                ),
                padding: EdgeInsets.all(10),
                // margin: EdgeInsets.only(left: 10, right: 10),
                child: Image.asset(
                  "assets/images/shantui.png",
                  width: 100,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo, width: 0.2),
                ),
                padding: EdgeInsets.all(10),
                // margin: EdgeInsets.only(left: 10, right: 10),
                child: Image.asset(
                  "assets/images/weichan.png",
                  width: 100,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 0.2),
          ),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(left: 10, right: 260),
          child: Image.asset(
            "assets/images/shacman.png",
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Wrap(
              children: [
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                      text: Ui.descriptionf[
                          context.watch<SimpleProvider>().getuzru]),
                )
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 0.2),
          ),
          child: Image.asset("assets/images/f.png"),
          // width: 150,height: 150,
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            Ui.tema2[context.watch<SimpleProvider>().getuzru]!,
            style: TextStyle(
                fontFamily: Ui.textstyle,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Wrap(
              children: [
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                      text: Ui.descriptionservice[
                          context.watch<SimpleProvider>().getuzru]),
                )
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 0.2),
          ),
          child: Image.asset("assets/images/imageservice.jpeg"),
          // width: 150,height: 150,
        ),
        Divider(),
      ],
    );

    //ListBody(
    //   children: [
    //     Text(
    //         " ")
    //   ],
    // )
  }

  Widget sertificete() {
    return ListView(
      children: [
        Image.asset("assets/images/ser1.jpeg"),
        Image.asset("assets/images/ser2.jpeg"),
        Image.asset("assets/images/ser3.jpeg"),
        Image.asset("assets/images/ser4.jpeg"),
      ],
    );
  }
}
