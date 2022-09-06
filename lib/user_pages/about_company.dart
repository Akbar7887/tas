import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ui.dart';
import '../provider/simle_provider.dart';

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
                      text: Ui.tab[context.watch<SimpleProvider>().getuzru],
                    ),
                    Tab(
                      text: Ui
                          .sertifikat[context.watch<SimpleProvider>().getuzru],
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
      scrollDirection: Axis.vertical,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
             "    " + Ui.description[context.watch<SimpleProvider>().getuzru]!),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            Ui.tema1[context.watch<SimpleProvider>().getuzru]!,
            style: TextStyle(
                fontFamily: Ui.textstyle,
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo, width: 0.2),
                ),
                padding: EdgeInsets.all(10),
                // margin: EdgeInsets.only(left: 10, right: 10),
                child: Image.asset(
                  "assets/images/xcmg.png",
                  width: 80,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 40,

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo, width: 0.2),
                ),
                padding: EdgeInsets.all(10),
                // margin: EdgeInsets.only(left: 10, right: 10),
                child: Image.asset(
                  "assets/images/shantui.png",
                  width: 80,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo, width: 0.2),
                ),
                padding: EdgeInsets.all(10),
                // margin: EdgeInsets.only(left: 10, right: 10),
                child: Image.asset(
                  "assets/images/weichan.png",
                  width: 80,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          width: 80,
          margin: EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 0.2),
          ),
          padding: EdgeInsets.all(5),
          // margin: EdgeInsets.only(left: 10, right: 260),
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
                          fontFamily: Ui.textstyle,
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
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
        SizedBox(
          height: 40,
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            Ui.tema2[context.watch<SimpleProvider>().getuzru]!,
            style: TextStyle(
                fontFamily: Ui.textstyle,
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w900,
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
                          fontWeight: FontWeight.w500,
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
        Image.asset("assets/images/ser1.jpg"),
        Image.asset("assets/images/ser2.jpg"),
        Image.asset("assets/images/ser3.jpg"),
        Image.asset("assets/images/ser4.jpg"),
      ],
    );
  }
}
