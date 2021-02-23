import 'package:flutter/material.dart';
import 'package:qrscan/modals/API_data.dart';
import 'package:qrscan/qr_scan_page.dart';
import 'DetailsPage.dart';
//import 'package:pin_code_fields/pin_code_fields.dart';

void main() => runApp(MaterialApp(
      home: OrderNumberPage(),
    ));

class OrderNumberPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<OrderNumberPage> {
  TextEditingController orderID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(qrText);
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   title: Text(' Pin code wedget test')
        // ),
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 30.0),
              SizedBox(height: 30.0),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9.0), //or 15.0
                  child: Container(
                    height: 70.0,
                    width: 70.0,
                    color: Color(0xffFF0E58),
                    // child: Image(
                    //   image: AssetImage(''),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Enter order ID ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Please Enter your order ID inside the Text Field',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 10.0),
              //From here i write textfield widget
              TextField(
                controller: orderID,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[900])),
                  hintText: 'Enter the ID here',
                  //labelText: 'Order ID'
                ),
              ), //end of the textfield code
              //start widget of Pincode
              // PinCodeTextField(
              //   appContext: context,
              //   length: 6,
              //   onChanged: (value){
              //     print(value);
              //   },
              //   pinTheme: PinTheme(
              //     shape: PinCodeFieldShape.underline,
              //     borderRadius: BorderRadius.circular(5),
              //     fieldHeight: 50,
              //     fieldWidth: 30,
              //     inactiveColor: Colors.green,
              //     activeColor: Colors.red,
              //     activeFillColor: Colors.green
              //   )
              // ), //end of widget pincode
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: SizedBox(
                  width: 250.0,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      //here the code to navigate to the page of entering the orderID
                      qrText = orderID.text;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              QRDataJSON(qrLink: qrText)));
                    },
                    color: Colors.blue[900],
                    textColor: Colors.white,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2.0,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
