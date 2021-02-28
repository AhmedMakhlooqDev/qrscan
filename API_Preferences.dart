import 'package:http/http.dart' as http;
import 'dart:convert';
import 'modals/API_data.dart';

fetchJSON(String qrCode) async {
  String url =
      'https://api.esplatforms.com/v02/api.php?app_version=1.0.2&action=list&source=orders&cn_order_code=$qrCode&locale=en';
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return QrData.fromJson(jsonDecode(response.body)[0]);
  } else {
    print('error, \nresponse code : ${response.statusCode}');
    throw Exception('Failed to load data');
  }
}

fetchJSONItems(String qrCode) async {
  String urlItems =
      'https://api.esplatforms.com/v02/api.php?app_version=1.0.2&action=list&source=ordersitem&cn_order_code=$qrCode&locale=en';
  var response = await http.get(urlItems);
  if (response.statusCode == 200) {
    List<dynamic> items = jsonDecode(response.body);
    List<ItemData> convertedItems = [];
    for (var item in items) {
      convertedItems.add(ItemData.fromJson(item));
    }
    return convertedItems;
  } else {
    print('error, \nresponse code : ${response.statusCode}');
    //throw Exception('Failed to load data');
  }
}
