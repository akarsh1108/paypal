import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paypal'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Pay'),
          onPressed: () async {
            var request = BraintreeDropInRequest(
                tokenizationKey: 'sandbox_rztkztvk_qfv7q4ss9qwhsghq',
                collectDeviceData: true,
                paypalRequest: BraintreePayPalRequest(
                    amount: '10', displayName: 'Akarsh Priyadarshan'),
                cardEnabled: true);
            dynamic result = await BraintreeDropIn.start(request);
            if (result != null) {
              print(result.paymentMethodNonce.description);
              print(result.paymentMethodNonce.nonce);

              // final http.Response response = await http.post(
              //   Uri.tryParse(
              //       '$url?payment_method_nonce=${result.paymentMethodNonce.nonce}&device_data=${result.paymentMethodNonce.nonce}&device_data=${result.deviceData}'),
              // );
              // final payResult = jsonDecode(response.body);
              // if(payResult['result']=='success')
              //   print('payment done');
            }
          },
        ),
      ),
    );
  }
}
