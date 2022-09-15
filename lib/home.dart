import 'package:TAS/provider/models_provider.dart';
import 'package:TAS/provider/news_provider.dart';
import 'package:TAS/provider/section_provider.dart';
import 'package:TAS/provider/simle_provider.dart';
import 'package:TAS/user_pages/about_company.dart';
import 'package:TAS/user_pages/adress.dart';
import 'package:TAS/user_pages/customer_form.dart';
import 'package:TAS/user_pages/description_page.dart';
import 'package:TAS/user_pages/first_page.dart';
import 'package:TAS/user_pages/lising_page.dart';
import 'package:TAS/user_pages/news_page.dart';
import 'package:TAS/user_pages/news_page1.dart';
import 'package:TAS/user_pages/section_page.dart';
import 'package:TAS/widgets/drawer_home.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'models/ui.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex = 1;
  Uz_ru uz_ru = Uz_ru.RU;

  Widget? getTitle() {
    if (context.read<SimpleProvider>().getpage == 1 ||
        context.read<SimpleProvider>().getpage > 3) {
      return InkWell(
          onTap: () {
            context.read<SimpleProvider>().changepage(1);
          },
          child: Image.asset(
            'assets/images/logo.png',
            width: 90,
          ));
    } else if (context.read<SimpleProvider>().getpage == 2) {
      return SizedBox(
          width: 100,
          height: 50,
          child: InkWell(
            onTap: () {
              context.read<SimpleProvider>().changepage(1);
            },
            child: Text(
              Ui.choose[context.watch<SimpleProvider>().getuzru]!,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: Ui.textstyle,
                  fontSize: 22),
            ),
          ));
    } else if (context.read<SimpleProvider>().getpage == 3) {
      return InkWell(
        onTap: () {
          context.read<SimpleProvider>().changepage(1);
        },
        child: Text(
          Ui.applyphone[context.watch<SimpleProvider>().getuzru]!,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: Ui.textstyle,
              fontSize: 15),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent[100],
          elevation: 1,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 65, left: 65),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTitle()!,
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Text(
                    "${Ui.title[context.watch<SimpleProvider>().getuzru]}",
                    style: TextStyle(
                        fontFamily: Ui.textstyle,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),

          shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.5, color: Colors.amber),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30.0),
              )),
          // centerTitle: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Ui.callInstagram();
                  },
                  icon: Image.asset(
                    'assets/images/Instagram_icon.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Ui.callFacebook();
                  },
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Ui.callTelegram();
                  },
                  icon: Icon(
                    Icons.telegram,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        // alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            Ui.callNumber(Ui.phone);
                          },
                          icon: Icon(
                            Icons.phone_android_outlined,
                            size: 20,
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
                              fontSize: 12,
                              color: Colors.black),
                        ),
                      ),
                    ],
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
                    } else if (uz_ru == Uz_ru.RU) {
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
                        fontFamily: Ui.textstyle,
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
                title: Ui.lising[uz_ru]),
            TabItem(
                icon: Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.black,
                ),
                title: Ui.h3[uz_ru]),
          ],
          onTap: (int index) {
            if (index == 0) {
              context.read<SectionProvider>().changeSection(null);
              context.read<SimpleProvider>().changepage(1);
            } else if (index == 1) {
              context.read<SimpleProvider>().changepage(6);
            } else if (index == 2) {
              context.read<SimpleProvider>().changepage(9);
            } else if (index == 3) {
              context.read<SimpleProvider>().changepage(5);
            }

            currentindex = index;
          },
        ));
  }

  selectPage(int page) {
    switch (page) {
      case 1:
        return FirstPage();

      case 2:
        return DescriptionPage();
      case 3:
        return CustomerForm(modelSet: context.watch<ModelsProvider>().getmodel);
      case 4:
        return AboutCompany();
      case 5:
        return Adress();
      case 6:
        return SectionPage();
      case 7:
        return NewsPage();
      case 8:
        return NewsPage1(
            newsCompany: context.watch<NewsProvider>().getnewsCompany);
      case 9:
        return LisingPage();
    }
  }
}
