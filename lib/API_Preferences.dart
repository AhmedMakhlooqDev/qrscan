import 'package:qrscan/qr_scan_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'modals/API_data.dart';

String url =
    'https://api.esplatforms.com/v02/api.php?app_version=1.0.2&action=list&source=orders&cn_order_code=$qrText&locale=en';

String urlItems =
    'https://api.esplatforms.com/v02/api.php?app_version=1.0.2&action=list&source=ordersitem&cn_order_code=$qrText&locale=en';

fetchJSON() async {
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return QrData.fromJson(jsonDecode(response.body)[0]);
  } else {
    print('error, \nresponse code : ${response.statusCode}');
    throw Exception('Failed to load data');
  }
}

fetchJSONItems() async {
  var response = await http.get(urlItems);
  if (response.statusCode == 200) {
    //String responseBody = response.body;
    //List<dynamic> data = json.decode(responseBody);

    // for (Map i in data) {
    //   qrDataList.add(QrData.fromJson(i));
    // }
    return ItemData.fromJson(jsonDecode(response.body)[0]);
  } else {
    print('error, \nresponse code : ${response.statusCode}');
    throw Exception('Failed to load data');
  }
}
