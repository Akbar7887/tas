import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/ui.dart';
import '../provider/section_provider.dart';
import '../provider/simle_provider.dart';

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
                height: 300,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.amberAccent[100],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.amber, width: 0.5)),
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
                            "${Ui.title[context.watch<SimpleProvider>().getuzru]}",
                            style: TextStyle(
                                fontFamily: Ui.textstyle,
                                fontWeight: FontWeight.w300,
                                fontSize: 15),
                          ),
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
                        Column(
                          children: [
                            Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Container(
                                    // alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {
                                        Ui.callNumber(Ui.phone);
                                      },
                                      icon: Icon(
                                        Icons.phone_android_outlined,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Ui.callNumber(Ui.phone);
                                    },
                                    child: Text(
                                      Ui.phone,
                                      style: TextStyle(
                                          fontFamily: Ui.textstyle,
                                          fontSize: 10,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Container(
                                    // alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {
                                        Ui.callNumber(Ui.phone1);
                                      },
                                      icon: Icon(
                                        Icons.phone_android_outlined,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // alignment: Alignment.topRight,
                                    child: TextButton(
                                      onPressed: () {
                                        Ui.callNumber(Ui.phone1);
                                      },
                                      child: Text(
                                        Ui.phone1,
                                        style: TextStyle(
                                            fontFamily: Ui.textstyle,
                                            fontSize: 10,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Container(
                                    // alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {
                                        Ui.callNumber(Ui.phone2);
                                      },
                                      icon: Icon(
                                        Icons.phone_android_outlined,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Ui.callNumber(Ui.phone2);
                                    },
                                    child: Text(
                                      Ui.phone2,
                                      style: TextStyle(
                                          fontFamily: Ui.textstyle,
                                          fontSize: 10,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
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
              child: Text(Ui.tab[context.watch<SimpleProvider>().getuzru]!,
                  style: TextStyle(
                      fontFamily: Ui.textstyle,
                      fontWeight: FontWeight.w500,
                      fontSize: 20)),
            )),
            Divider(color: Colors.amberAccent),
            ListTile(
              title: InkWell(
                onTap: () {
                  context.read<SectionProvider>().changeSection(null);
                  context.read<SimpleProvider>().changepage(1);
                  // setState(() {
                  //   textnext = Ui.h2[uz_ru]!;
                  // });
                  Navigator.pop(context);
                },
                child: Text(
                    Ui.catalogs[context.watch<SimpleProvider>().getuzru]!,
                    style: TextStyle(fontFamily: Ui.textstyle, fontSize: 20)),
              ),
            ),
            Divider(color: Colors.amberAccent,),
            ListTile(
              title: InkWell(
                onTap: () {
                  //context.read<SectionProvider>().changeSection(null);
                  context.read<SimpleProvider>().changepage(9);
                  // setState(() {
                  //   textnext = Ui.h2[uz_ru]!;
                  // });
                  Navigator.pop(context);
                },
                child: Text(
                    Ui.lising[context.watch<SimpleProvider>().getuzru]!,
                    style: TextStyle(fontFamily: Ui.textstyle, fontSize: 20)),
              ),
            ),
            Divider(
              color: Colors.amberAccent,
            ),
            ListTile(
              title: InkWell(
                onTap: () {
                  context.read<SimpleProvider>().changepage(7);
                  Navigator.pop(context);
                },
                child: Text(Ui.news[context.watch<SimpleProvider>().getuzru]!,
                    style: TextStyle(fontFamily: Ui.textstyle, fontSize: 20)),
              ),
            ),
            Divider(color: Colors.amberAccent),
            ListTile(
              title: InkWell(
                onTap: () {
                  context.read<SimpleProvider>().changepage(5);
                  Navigator.pop(context);
                },
                child: Text(
                    Ui.adressfix[context.watch<SimpleProvider>().getuzru]!,
                    style: TextStyle(fontFamily: Ui.textstyle, fontSize: 20)),
              ),
            )
          ],
        ));
  }
}
