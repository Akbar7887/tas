import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tas/provider/simle_provider.dart';

import '../models/ui.dart';
import '../provider/section_provider.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);

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
                    borderRadius: BorderRadius.circular(20),
                    border:  Border.all(color: Colors.amber, width: 0.5)
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 100,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${Ui.fullname}",
                            style: TextStyle(
                                fontFamily: Ui.textstyle,
                                fontWeight: FontWeight.w300,
                                fontSize: 15),
                          ),
                        ),
                        // Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                Ui.callNumber();
                              },
                              child: Text(
                                Ui.phone,
                                style: TextStyle(
                                    fontFamily: Ui.textstyle,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Ui.callInstagram();
                              },
                              icon: Image.asset(
                                'assets/images/Instagram_icon.png',
                                width: 30,
                                height: 30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Ui.callFacebook();
                              },
                              icon: Icon(
                                Icons.facebook,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Ui.callTelegram();
                              },
                              icon: Icon(
                                Icons.telegram,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                            // Text(Ui.telegram)
                          ],
                        )
                      ],
                    ),
                  ),
                ) // decoration: BoxDecoration(color: Colors.yellow),
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
                      fontWeight: FontWeight.w500,
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
