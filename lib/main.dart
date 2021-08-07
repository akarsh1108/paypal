import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

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
            }
          },
        ),
      ),
    );
  }
}
