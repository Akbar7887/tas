import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:tas/provider/simle_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/ui.dart';
import '../provider/section_provider.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);

  _callNumber() async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(Ui.phone);
  }

  _callTelegram() async {
    String url = "https://${Ui.telegram}";
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // elevation: 0,
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            SizedBox(
                height: 220,
                child: DrawerHeader(
              decoration: BoxDecoration(
                      color: Colors.amberAccent[100],
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Container(
                          child: Text(
                            "Компания ${Ui.name}",
                            style: TextStyle(
                                fontFamily: Ui.textstyle,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        Spacer(
                            // height: 10,
                            ),
                        Image.asset(
                          "assets/images/logo.png",
                          width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${Ui.fullname}",
                        style: TextStyle(
                            fontFamily: Ui.textstyle,
                            fontWeight: FontWeight.w300,
                            fontSize: 15),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.phone_android_outlined,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            _callNumber();
                          },
                          child: Text(
                            Ui.phone,
                            style: TextStyle(
                                fontFamily: Ui.textstyle, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            _callTelegram();
                          },
                          icon: Icon(
                            Icons.telegram,
                            color: Colors.blue,
                          ),
                        ),
                        Text(Ui.telegram)
                      ],
                    )
                  ],
                ),
              ),
            )// decoration: BoxDecoration(color: Colors.yellow),
            ),
            ListTile(
                title: InkWell(
              onTap: () {
                context.read<SimpleProvider>().changepage(4);
                Navigator.pop(context);
              },
              child: Text("О компании",
                  style: TextStyle(
                      fontFamily: Ui.textstyle,
                      fontWeight: FontWeight.w300,
                      fontSize: 20)),
            )),
            Divider(),
            ListTile(
              title: InkWell(
                onTap: () {
                  context.read<SectionProvider>().changeSection(null);
                  context.read<SimpleProvider>().changepage(1);
                  context.read<SimpleProvider>().changetitle(Ui.name);
                  // setState(() {
                  //   textnext = Ui.h2[uz_ru]!;
                  // });
                  Navigator.pop(context);
                },
                child: Text("Каталог",
                    style: TextStyle(fontFamily: Ui.textstyle, fontSize: 20)),
              ),
            ),
            Divider(),
            ListTile(
              title: InkWell(
                onTap: () {
                  context.read<SimpleProvider>().changepage(7);
                  Navigator.pop(context);
                },
                child: Text("Новости",
                    style: TextStyle(fontFamily: Ui.textstyle, fontSize: 20)),
              ),
            ),
            Divider(),
            ListTile(
              title: InkWell(
                onTap: () {
                  context.read<SimpleProvider>().changepage(5);
                  Navigator.pop(context);
                },
                child: Text("Адреса",
                    style: TextStyle(fontFamily: Ui.textstyle, fontSize: 20)),
              ),
            )
          ],
        ));
  }
}
