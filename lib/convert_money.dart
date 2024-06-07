import 'package:flutter/material.dart';

class ConvertMoney extends StatefulWidget {
  const ConvertMoney({Key? key}) : super(key: key);

  @override
  State<ConvertMoney> createState() => _ConvertMoneyState();
}

class _ConvertMoneyState extends State<ConvertMoney> {
  final inputcontroller = TextEditingController();

  double dollar = 0, yen = 0, ringgit = 0;

  void calculate() {
    String inputText = inputcontroller.text;
    if (inputText.isEmpty) {
      _showErrorDialog('Please enter a value');
      return;
    }

    double inputMoney;
    try {
      inputMoney = double.parse(inputText);
    } catch (e) {
      _showErrorDialog('Invalid input. Please enter a numeric value');
      return;
    }

    if (inputMoney < 0) {
      _showErrorDialog('Negative values are not allowed');
      return;
    }

    setState(() {
      dollar = inputMoney * 0.000062;
      yen = inputMoney * 0.0097;
      ringgit = inputMoney * 0.00029;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konversi Mata Uang Rupiah"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: inputcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Input rupiah',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: calculate, child: Text('Konversi')),
            SizedBox(height: 15),
            Text('Dollar : ${dollar.toStringAsFixed(2)}'),
            SizedBox(height: 15),
            Text('yen : ${yen.toStringAsFixed(2)}'),
            SizedBox(height: 15),
            Text('Ringgit : ${ringgit.toStringAsFixed(2)}')
          ],
        ),
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';

class ConvertMoney extends StatefulWidget {
  const ConvertMoney({Key? key}) : super(key: key);

  @override
  State<ConvertMoney> createState() => _ConvertMoneyState();
}

class _ConvertMoneyState extends State<ConvertMoney> {
  final inputcontroller = TextEditingController();

  double dollar = 0, yen = 0, ringgit = 0;

  void calculate() {
    double inputMoney = double.tryParse(inputcontroller.text) ?? 0;
    setState(() {
      dollar = inputMoney * 0.000062;
      yen = inputMoney * 0.0097;
      ringgit = inputMoney * 0.00029;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konversi Mata Uang Rupiah"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: inputcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Input rupiah',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: calculate, child: Text('Konversi')),
            SizedBox(height: 15),
            Text('Dollar : $dollar'),
            SizedBox(height: 15),
            Text('yen : $yen'),
            SizedBox(height: 15),
            Text('Ringgit : $ringgit')
          ],
        ),
      ),
    );
  }
}
*/