import 'package:flutter/material.dart';
//import './main.dart';


class ResultPage extends StatefulWidget {
  final String orderIDnp;
  
  ResultPage({Key key, @required this.orderIDnp}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();

}




class _ResultPageState extends State<ResultPage> {
  //String orderID;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 50.0, 60.0),
        child: Text('This is your order ID:' + widget.orderIDnp),
      ),
      
    );

  }

  
}

