import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tas/bloc/customer_bloc.dart';
import 'package:tas/models/Customer.dart';
import 'package:tas/models/CustomerOrder.dart';
import 'package:tas/models/ModelSet.dart';
import 'package:tas/provider/models_provider.dart';

import '../models/ui.dart';
import '../provider/simle_provider.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({Key? key}) : super(key: key);

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

  // bool validate = false;

  @override
  Widget build(BuildContext context) {
    String answerphone =
        Ui.c6[context.watch<SimpleProvider>().getuzru].toString();
    String answerfio =
        Ui.c2[context.watch<SimpleProvider>().getuzru].toString();
    String answerget =
    Ui.c7[context.watch<SimpleProvider>().getuzru].toString();
    String answerunget =
    Ui.c8[context.watch<SimpleProvider>().getuzru].toString();

    ModelSet modelSet = context.watch<ModelsProvider>().getmodel;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            "${modelSet.section!.name}:",
            style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20,
                fontFamily: "Oswald"),
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
                  labelStyle:
                      TextStyle(color: Colors.indigo, fontFamily: "Oswald",),
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
          height: 20,
        ),
        Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.indigo),
                borderRadius: BorderRadius.circular(10)),
            child: TextButton(
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

                List<CustomerOrder> custmersorder = [
                  CustomerOrder(modelset: modelSet, currentdate: "")
                ];

                Customer customer = Customer(
                    customerOrders: custmersorder,
                    email: _controlleremail.text,
                    name: _controllerfio.text,
                    phone: _controllerphone.text);

                if (_controllerfio.text.isEmpty ||
                    _controllerphone.text.isEmpty) {
                  return;
                }
                context
                    .read<CustomerBloc>()
                    .repository
                    .postCustomer(customer)
                    .then((value) {
                  _controllerphone.text = "";
                  _controllerfio.text = "";
                  _controllerphone.text = "";

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(answerget)));
                }).catchError((onError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(answerunget)));
                });
              },
              child: Text(
                "Заказать ",
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
