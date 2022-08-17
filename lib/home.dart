import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';
import 'package:tas/provider/section_provider.dart';
import 'package:tas/provider/simle_provider.dart';
import 'package:tas/user_pages/about_company.dart';
import 'package:tas/user_pages/adress.dart';
import 'package:tas/user_pages/customer_form.dart';
import 'package:tas/user_pages/description_page.dart';
import 'package:tas/user_pages/first_page.dart';
import 'package:tas/user_pages/news_page.dart';
import 'package:tas/user_pages/section_page.dart';
import 'package:tas/widgets/drawer_home.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/ui.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

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

_callInstagram() async {
  String url = "https://${Ui.inhstagram}";
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
  } else {
    throw 'Could not url';
  }
}

_callFacebook() async {
  String url = "https://${Ui.facebook}";
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
  } else {
    throw 'Could not url';
  }
}

class _HomeState extends State<Home> {
  int currentindex = 1;
  Uz_ru uz_ru = Uz_ru.UZ;
  String textnext = Ui.h3[Uz_ru.UZ]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.amberAccent[100],
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.5, color: Colors.amber),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30.0),
                      )),
                  // centerTitle: true,
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<SimpleProvider>().changepage(1);
                        },
                        child: Text(
                          context.watch<SimpleProvider>().gettitle,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: "Times New Roman",
                              fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            _callInstagram();
                          },
                          icon: Image.asset(
                            'assets/images/Instagram_icon.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _callFacebook();
                          },
                          icon: Icon(
                            Icons.facebook,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _callTelegram();
                          },
                          icon: Icon(
                            Icons.telegram,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            _callNumber();
                          },
                          child: Icon(
                            Icons.phone_android_outlined,
                            size: 30,
                          ),
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
                                fontFamily: Ui.textstyle,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            if (uz_ru == Uz_ru.UZ) {
                              uz_ru = Uz_ru.RU;
                            } else {
                              uz_ru = Uz_ru.UZ;
                            }
                            context.read<SimpleProvider>().changuzru(uz_ru);
                          });
                        },
                        child: Container(
                          child: Text(
                            uz_ru.name,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
                body: selectPage(context.watch<SimpleProvider>().getpage),
                drawer: DrawerHome(),
                bottomNavigationBar: ConvexAppBar(
                  initialActiveIndex: currentindex,
                  color: Colors.black,
                  backgroundColor: Colors.amberAccent[100],
                  items: [
                    TabItem(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 15,
                        ),
                        title: Ui.h1[uz_ru]),
                    TabItem(icon: Icon(Icons.menu), title: Ui.catalogs[uz_ru]),
                    TabItem(
                        icon: Icon(
                          Icons.navigate_next_sharp,
                          color: Colors.black,
                        ),
                        title: textnext)
                  ],
                  onTap: (int index) {
                    if (index == 0) {
                      context.read<SectionProvider>().changeSection(null);
                      context.read<SimpleProvider>().changepage(1);
                      context.read<SimpleProvider>().changetitle(Ui.name);
                      // setState(() {
                      //   textnext = Ui.h2[uz_ru]!;
                      // });
                    } else if (index == 1) {
                      context.read<SimpleProvider>().changepage(6);
                      // setState(() {
                      //   textnext = Ui.h3[uz_ru]!;
                      // });
                    } else if (context.read<SimpleProvider>().getpage == 1) {
                      if (context.read<SimpleProvider>().getindexSelected !=
                          -1) {
                        context.read<SimpleProvider>().changepage(2);
                      }
                      // setState(() {
                      //   textnext = Ui.h2[uz_ru]!;
                      // });
                    } else if (context.read<SimpleProvider>().getpage == 2) {
                      context.read<SimpleProvider>().changepage(3);
                      context.read<SimpleProvider>().changetitle(Ui.d3[uz_ru]!);
                      // setState(() {
                      //   textnext = "Далее";
                      // });
                    } else if (context.read<SimpleProvider>().getpage == 6) {
                      // setState(() {
                      //   textnext = Ui.h3[uz_ru]!;
                      // });
                      context.read<SimpleProvider>().changepage(5);
                    } else if (context.read<SimpleProvider>().getpage == 3) {
                      context.read<SimpleProvider>().changepage(5);
                      // exit(0);
                    }

                    currentindex = index;
                  },
                ));
  }

  selectPage(int page) {
    switch (page) {
      case 1:
        return FirstPage();
        break;
      case 2:
        return DescriptionPage();
        break;
      case 3:
        return CustomerForm();
        break;
      case 4:
        return AboutCompany();
        break;
      case 5:
        return Adress();
        break;
      case 6:
        return SectionPage();
        break;
      case 7:
        return NewsPage();
        break;
    }
  }
}
