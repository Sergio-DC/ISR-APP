import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:mini_app_isr/providers/isr_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:money2/money2.dart';

class IsrPage extends StatelessWidget {
  final _controllerNetTF = new TextEditingController();
  final _controllerBruteTF = new TextEditingController();
  final _controllerISR = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculo de ISR"),
        backgroundColor: Color(0xff00bbd3),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(
            flex: 1,
          ),
          _createCustomTF(
              labelName: "Sueldo Bruto",
              controller: _controllerBruteTF,
              context: context),
          _createCustomTF(
              labelName: "ISR",
              readOnly: true,
              controller: _controllerISR,
              context: context),
          _createCustomTF(
              labelName: "Sueldo Neto",
              readOnly: true,
              controller: _controllerNetTF,
              context: context),
          SizedBox(
            width: 10.0,
            height: 10.0,
            child: null,
          ),
          _createButton(),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }

  Widget _createCustomTF(
      {String labelName,
      bool readOnly = false,
      TextEditingController controller,
      BuildContext context}) {
    return Padding(
        child: TextField(
          enableInteractiveSelection: false,
          keyboardType: TextInputType.number,
          controller: controller,
          autofocus: false,
          readOnly: readOnly,
          decoration: InputDecoration(
              labelText: labelName,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(15))),
          onTap: () {
            // FocusScope.of(context).requestFocus(new FocusNode());
          },
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15));
  }

  Widget _createButton() {
    return Padding(
      child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          color: Color(0xffc1185b),
          textColor: Colors.white,
          child: Text("Calcular ISR"),
          onPressed: () => calculateISR()),
      padding: EdgeInsets.symmetric(horizontal: 25),
    );
  }

  void calculateISR() {
    Map<String, dynamic> mapIsr;
    double netWage;
    double bruteWage;
    //Format the input Brute Wage
    bruteWage = formattingISRNumber(_controllerBruteTF.text);

    IsrProvider.calculateISR(bruteWage).then((http.Response value) {
      mapIsr = json.decode(value.body);
      print("Repuesta:  $mapIsr");
      double isr = formattingISRNumber(mapIsr['ISR']);
      netWage = bruteWage - isr;
      _controllerNetTF.text = "\$${netWage.toString()}";
      _controllerISR.text = mapIsr['ISR'];
    });
    // isr_provider.calculateISR(bruteWage).then((http.Response value) {
    //   mapIsr = json.decode(value.body);
    //   print("Repuesta:  $mapIsr");
    //   double isr = formattingISRNumber(mapIsr['ISR']);
    //   netWage = bruteWage - isr;
    //   _controllerNetTF.text = "\$${netWage.toString()}";
    //   _controllerISR.text = mapIsr['ISR'];
    // });
  }

  double formattingISRNumber(mapIsr) {
    var aux;
    String dollar = '\$';
    double isr;

    if (mapIsr[0].compareTo(dollar) == 0)
      aux = mapIsr.substring(1); //Se quita el signo de dolar del string
    else
      aux = mapIsr;

    try {
      isr = double.parse(aux.replaceAll(
          ',', '')); // Se eliminan las comas del string y se transforma
    } on Exception {
      print("Error de formato double");
      isr = 0;
    }

    return isr;
  }
}
