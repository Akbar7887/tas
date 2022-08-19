import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/customer_bloc.dart';
import '../bloc/newscompany_bloc.dart';
import '../bloc/producer_bloc.dart';
import '../bloc/producer_event.dart';
import '../bloc/section_bloc.dart';
import '../home.dart';
import '../services/producer_repository.dart';

double opacityLevel = 1.0;

class ZeroPage extends StatefulWidget {
  const ZeroPage({Key? key}) : super(key: key);

  @override
  State<ZeroPage> createState() => _ZeroPageState();
}

class _ZeroPageState extends State<ZeroPage> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => Repository(),
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    ProducerBloc(producerRepository: context.read<Repository>())
                      ..add(ProducerLoadEvent()),
              ),
              BlocProvider(
                create: (context) =>
                    CustomerBloc(repository: context.read<Repository>()),
              ),
              BlocProvider(
                create: (context) =>
                    SectionBloc(repository: context.read<Repository>())
                      ..add(ProducerLoadEvent()),
              ),
              BlocProvider(
                create: (context) =>
                    NewsCompanyBloc(repository: context.read<Repository>())
                      ..add(ProducerLoadEvent()),
              ),
            ],
            child: FutureBuilder(
                future: getHomePage(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data as Widget;
                  } else {
                    return Scaffold(
                        backgroundColor: Colors.amberAccent[100],
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: 200,
                                height: 200,
                              ),
                              Divider(),
                              Image.asset(
                                "assets/images/xcmg.png",
                                width: 200,
                                height: 100,
                              ),
                              Divider(),
                              Image.asset("assets/images/shacman.png",
                                  width: 200, height: 100),
                              Divider(),
                              Image.asset("assets/images/shantui.png",
                                  width: 200, height: 100),
                              Divider(),
                              Image.asset("assets/images/weichan.png",
                                  width: 200, height: 100),
                              Divider(),
                            ],
                          ),
                        ));
                  }
                })));
  }

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
    });
  }

  Future<Widget> getHomePage() async {
    _changeOpacity();
    return await Future.delayed(Duration(seconds: 2), () {})
        .then((value) => Home());
  }
}
