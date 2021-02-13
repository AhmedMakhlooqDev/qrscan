import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qrscan/qr_scan.dart';
import './modals/qrdata.dart';

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
  QrData qr = QrData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "QR scanner",
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.grey[900]),
        child: Container(
          child: FutureBuilder(
            future: fetchJSON(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Order Details',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100),
                            ),
                            Container(
                              height: 10,
                            ),
                            CustomerProperty(
                                propertyName: 'Name:',
                                value: snapshot.data.nameAr),
                            CustomerProperty(
                                propertyName: 'email:',
                                value: snapshot.data.email),
                            CustomerProperty(
                                propertyName: 'phone:',
                                value: snapshot.data.phone),
                            CustomerProperty(
                                propertyName: 'Company ID:',
                                value: snapshot.data.companyId),
                            CustomerProperty(
                                propertyName: 'Order date:',
                                value: snapshot.data.orderDate),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Container(
                                width: double.infinity,
                                height: 0.5,
                                color: Colors.white,
                              ),
                            ),
                            CustomerProperty(
                                propertyName: 'code:',
                                value: snapshot.data.code),
                            CustomerProperty(
                                propertyName: 'Payement status:',
                                value: snapshot.data.paymentStatues),
                            CustomerProperty(
                                propertyName: 'Invoice ID',
                                value: snapshot.data.invoiceID),
                            CustomerProperty(
                                propertyName: 'Subtotal:',
                                value: snapshot.data.subTotal),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
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
      ),
    );
  }
}

final TextStyle stylu = TextStyle(
    fontSize: 20.0,
    fontFamily: 'RobotMono',
    fontWeight: FontWeight.w100,
    color: Colors.white);

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${this.propertyName}', style: stylu),
          Text(
            '${this.value}',
            style: stylu,
          )
        ],
      ),
    );
  }
}
