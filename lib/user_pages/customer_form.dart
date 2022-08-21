import 'package:TAS/services/producer_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../bloc/customer_bloc.dart';
import '../models/Customer.dart';
import '../models/CustomerOrder.dart';
import '../models/ModelSet.dart';
import '../models/ui.dart';
import '../provider/simle_provider.dart';

class CustomerForm extends StatefulWidget {
  final ModelSet? modelSet;

  const CustomerForm({required this.modelSet}) : super();

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  TextEditingController _controllerfio = TextEditingController();
  TextEditingController _controllerphone = TextEditingController();
  TextEditingController _controlleremail = TextEditingController();
  final _formkeyfio = GlobalKey<FormState>();
  final _formkeyphone = GlobalKey<FormState>();
  final _formkeyemail = GlobalKey<FormState>();
  late ModelSet modelSet;
  late CustomerBloc customerBloc;
  late final Repository repository;

  @override
  void initState() {
    super.initState();
    modelSet = widget.modelSet!;
    customerBloc = BlocProvider.of<CustomerBloc>(context);
    repository = Repository();
  } // bool validate = false;

  @override
  Widget build(BuildContext context) {
    String answerphone = Ui.c6[context.watch<SimpleProvider>().getuzru]!;
    String answerfio = Ui.c2[context.watch<SimpleProvider>().getuzru]!;
    String answerget = Ui.c7[context.watch<SimpleProvider>().getuzru]!;
    String answerunget = Ui.c8[context.watch<SimpleProvider>().getuzru]!;

    // ModelSet modelSet = context.watch<ModelsProvider>().getmodel;

    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            "${modelSet.section!.name}:",
            style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20,
                fontFamily: Ui.textstyle),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  "модель:",
                  style: TextStyle(
                      fontWeight: FontWeight.w200, fontFamily: "Oswald"),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "${modelSet.name}",
                  style: TextStyle(fontFamily: "OpenSans", fontSize: 20),
                ),
              ],
            )),
        Container(
          height: 200,
          // width: 150,
          // alignment: Alignment.topRight,
          padding: EdgeInsets.all(10),
          child: Image.network(
            "${Ui.url}download/model/${modelSet.imagepath}",
          ),
        ),
        Form(
          key: _formkeyfio,
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: TextFormField(
              controller: _controllerfio,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              cursorColor: Colors.indigo,
              decoration: InputDecoration(
                  labelText: Ui.c1[context.watch<SimpleProvider>().getuzru],
                  labelStyle: TextStyle(
                    color: Colors.indigo,
                    fontFamily: "Oswald",
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.indigo,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.indigo)),
                  prefixIcon: Container(
                    child: Icon(
                      Icons.man_sharp,
                      size: 30,
                      color: Colors.orange,
                    ),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return answerfio;
                }
                // return "";
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Form(
          key: _formkeyphone,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              controller: _controllerphone,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              cursorColor: Colors.indigo,
              inputFormatters: [MaskTextInputFormatter(mask: "## ###-##-##")],
              decoration: InputDecoration(
                  labelText: Ui.c3[context.watch<SimpleProvider>().getuzru],
                  labelStyle:
                      TextStyle(color: Colors.indigo, fontFamily: "Oswald"),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.indigo,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.indigo)),
                  prefixIcon: Container(
                    child: Icon(
                      Icons.phone_android,
                      color: Colors.orange,
                    ),
                  ),
                  prefixText: "+998 ",
                  prefixStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return answerphone; //Ui.c4[context.watch<SimpleProvider>().getuzru].toString();
                }
                // return "";
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Form(
          key: _formkeyemail,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              controller: _controlleremail,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              cursorColor: Colors.indigo,
              decoration: InputDecoration(
                labelText: Ui.c5[context.watch<SimpleProvider>().getuzru],
                labelStyle:
                    TextStyle(color: Colors.indigo, fontFamily: "Oswald"),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.indigo,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1, color: Colors.indigo)),
                prefixIcon: Container(
                  child: Icon(
                    Icons.email,
                    color: Colors.orange,
                  ),
                ),
              ),
              validator: (value) {
                if (value!.contains("@")) {
                  return "eknrkner"; //Ui.c6[context.watch<SimpleProvider>().getuzru];
                }
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            height: 60,
            // decoration: BoxDecoration(
            //     border: Border.all(color: Colors.indigo,width: 0.5),
            //     borderRadius: BorderRadius.circular(10)),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amberAccent[100]),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.indigo))),
              ),
              onPressed: () {
                // _formkeyfio.currentState!.validate();
                // _formkeyphone.currentState!.validate();

                if (_formkeyfio.currentState!.validate()) {
                  // validate = true;
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     content: Text(
                  //         Ui.c2[context.watch<SimpleProvider>().getuzru]!)));
                }
                if (_formkeyphone.currentState!.validate()) {
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     content: Text(
                  //         Ui.c4[context.watch<SimpleProvider>().getuzru]!)));
                }

                CustomerOrder customerOrder =
                    CustomerOrder(modelset: modelSet, currentdate: "");

                Customer customer = Customer(
                    email: _controlleremail.text,
                    name: _controllerfio.text,
                    phone: _controllerphone.text);

                if (_controllerfio.text.isEmpty ||
                    _controllerphone.text.isEmpty) {
                  return;
                }
                customerBloc.post(customer).then((value) {
                  repository
                      .postCustomerOrder(customerOrder, value.id.toString())
                      .then((value) {
                    _controllerphone.text = "";
                    _controllerfio.text = "";
                    _controlleremail.text = "";

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(answerget)));
                  }).catchError((onError) {
                    print("Custom Order error");

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(answerunget)));
                  });
                }).catchError((onError) {
                  print("Custom error");
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(answerunget)));
                });
              },
              child: Text(
                Ui.d3[context.watch<SimpleProvider>().getuzru]!,
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 30,
                    color: Colors.indigo,
                    fontFamily: "Oswald"),
              ),
            )),
      ],
    );
  }
}
