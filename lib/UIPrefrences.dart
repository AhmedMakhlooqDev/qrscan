import 'package:flutter/material.dart';
import 'package:qrscan/modals/API_data.dart';
import 'order_number_page.dart';
import 'qr_scan_page.dart';

//----------------------------------------------------------------------------------------
// text styling properties

final TextStyle stylu = TextStyle(
    fontSize: 13.0,
    fontFamily: 'RobotMono',
    fontWeight: FontWeight.bold,
    color: Colors.black);

final TextStyle stylee =
    TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: Colors.black);

final TextStyle styling =
    TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.black);

//-------------------------------------------------------------------------------------------
class PaymentStatues extends StatelessWidget {
  // payment succeccfull or not
  //green container ** changes to red if pending
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
      color: (value.contains('unpaid') || value.contains('pending'))
          ? Colors.red
          : Colors.lightGreen[500],
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

//--------------------------------------------------------------------------------------------------
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

//---------------------------------------------------------------------------------------------

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

//--------------------------------------------------------------------------------------------
// item row for details page

class ItemRow extends StatelessWidget {
  final String currency;
  final String nameEng;
  final String img;
  final String quantity;
  final String orgTotal;

  const ItemRow({
    @required this.currency,
    @required this.nameEng,
    @required this.img,
    @required this.quantity,
    @required this.orgTotal,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10.0),
      //   color: Colors.grey[200],
      //   boxShadow: [
      //     BoxShadow(color: Colors.grey[400], spreadRadius: 4, blurRadius: 25),
      //   ],
      // ),
      width: 600,

      child: Column(
        children: [
          Card(
            color: Colors.grey[100],
            child: Column(
              children: [
                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(9.0), //or 15.0
                    child: Container(
                      height: 70.0,
                      width: 60.0,
                      color: Colors.grey[300],
                      child: Image(
                        image: NetworkImage(this.img),
                      ),
                    ),
                  ),
                  title: Text(
                    '${this.nameEng}',
                    style: stylu,
                  ),
                  subtitle: Text(
                    'QTY: ${this.quantity}',
                    style: TextStyle(fontSize: 11),
                  ),
                  trailing: Text('${this.orgTotal}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//-------------------------------------------------------------------------------------------

//--- scan buttons Main.dart
class ScanButton extends StatelessWidget {
  final String name;

  const ScanButton({
    @required this.name,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      height: 75.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => MyApp()));
        },
        color: Colors.blue[900],
        textColor: Colors.white,
        child: Text(
          '${this.name}',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class OrderNumberButton extends StatelessWidget {
  final String name;

  const OrderNumberButton({
    @required this.name,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      height: 75.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => OrderNumberPage()));
        },
        color: Colors.blue[900],
        textColor: Colors.white,
        child: Text(
          '${this.name}',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
