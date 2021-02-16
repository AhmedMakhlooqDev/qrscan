import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qrscan/qr_scan.dart';
import './modals/qrdata.dart';
import 'main.dart';

//List<QrData> qrDataList = [];

fetchJSON() async {
  var response = await http.get(qrText);
  if (response.statusCode == 200) {
    //String responseBody = response.body;
    //List<dynamic> data = json.decode(responseBody);

    // for (Map i in data) {
    //   qrDataList.add(QrData.fromJson(i));
    // }
    return QrData.fromJson(jsonDecode(response.body)[0]);
  } else {
    print('error, \nresponse code : ${response.statusCode}');
    throw Exception('Failed to load data');
  }
}

class QRDataJSON extends StatefulWidget {
  final String qrLink;
  QRDataJSON({Key key, @required this.qrLink}) : super(key: key);
  @override
  _QRDataJSONState createState() => _QRDataJSONState();
}

class _QRDataJSONState extends State<QRDataJSON> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "QR scanner",
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              color: Colors.grey[100]),
          child: Column(
            children: [
              Container(
                child: FutureBuilder(
                  future: fetchJSON(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 1.0),
                                  child: Text(
                                    'Order Details',
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomerProperty(
                                        propertyName: 'Order date',
                                        value: snapshot.data.orderDate),
                                    CustomerProperty(
                                        propertyName: 'Invoice ID',
                                        value: snapshot.data.invoiceID),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                CustomerProperty(
                                    propertyName: 'Name',
                                    value: snapshot.data.nameAr),
                                CustomerProperty(
                                    propertyName: 'email',
                                    value: snapshot.data.email),
                                CustomerProperty(
                                    propertyName: 'phone',
                                    value: snapshot.data.phone),
                                CustomerProperty(
                                    propertyName: 'code',
                                    value: snapshot.data.code),
                                PaymentStatues(
                                  propertyName: 'Payement Statues',
                                  value: snapshot.data.paymentStatues,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: CurrencyProperty(
                                    propertyName: 'Subtotal',
                                    value: snapshot.data.subTotal,
                                    curValue: snapshot.data.currency,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, bottom: 20),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Wrap(
                                      direction: Axis.vertical,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      spacing: 70,
                                      runSpacing: 5,
                                      children: [
                                        Text(
                                            'Dark Souls: Remastered    BHD 21   1',
                                            style: styling),
                                        Text(
                                            'Dark Souls: Remastered    BHD 21   1',
                                            style: styling),
                                        Text(
                                            'Dark Souls: Remastered    BHD 21   1',
                                            style: styling),
                                        Text(
                                            'Dark Souls: Remastered    BHD 21   1',
                                            style: styling),
                                        Text(
                                            'Dark Souls: Remastered    BHD 21   1',
                                            style: styling),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 200, bottom: 289),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
                // child: new ListView.builder(
                //     itemCount: qrDataList.length,
                //     itemBuilder: (context, i) {
                //       final jsonDataList = qrDataList[i];
                //       return Container(
                //         child: Text(
                //             'Company ID: ${jsonDataList.companyId}\n name: ${jsonDataList.email}'),
                //       );
                //     }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 20.0),
                child: SizedBox(
                  width: 350.0,
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => AppQR()));
                    },
                    color: Colors.blue[900],
                    textColor: Colors.white,
                    child: const Text(
                      'Confirm Delivery',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class Currency extends StatelessWidget {
//   final String label;
//   final String subTotalValue;
//   final String currencyValue;
//   const Currency({
//     @required this.label,
//     @required this.subTotalValue,
//     @required this.currencyValue,
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text('${this.label}: ${this.subTotalValue} ${this.currencyValue}');
//   }
// }

class PaymentStatues extends StatelessWidget {
  //green container
  final String propertyName;
  final String value;
  final String currency;

  const PaymentStatues({
    @required this.propertyName,
    @required this.value,
    this.currency,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      color: Colors.lightGreen[500],

      // child: CustomerProperty(
      //     propertyName: 'Payement status:',
      //     value: snapshot.data.paymentStatues),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${this.propertyName}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              '${this.value.replaceAll(new RegExp(r'[|]+'), '')}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

final TextStyle stylu = TextStyle(
    fontSize: 13.0,
    fontFamily: 'RobotMono',
    fontWeight: FontWeight.bold,
    color: Colors.black);

final TextStyle stylee =
    TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: Colors.black);

final TextStyle styling =
    TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.black);

class CustomerProperty extends StatelessWidget {
  final String propertyName;
  final String value;

  const CustomerProperty({
    @required this.propertyName,
    @required this.value,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 5,
          runSpacing: 5,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${this.propertyName}', style: stylee),
            Text(
              '${this.value.replaceAll(new RegExp(r'[|]+'), '')}',
              style: stylu,
            )
          ],
        ),
      ),
    );
  }
}

class CurrencyProperty extends StatelessWidget {
  final String propertyName;
  final String value;
  final String curValue;

  const CurrencyProperty({
    @required this.propertyName,
    @required this.value,
    @required this.curValue,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 5,
          runSpacing: 5,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${this.propertyName}', style: stylee),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${this.value.replaceAll(new RegExp(r'[|]+'), '')}',
                  style: styling,
                ),
                Container(
                  width: 2.0,
                ),
                Text('${this.curValue}', style: styling),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
