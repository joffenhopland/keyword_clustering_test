import 'dart:convert';
import 'package:http/http.dart' as http;


class Api {
  String api = 'https://keyword-clustering-func-htphw67dca-uc.a.run.app/';
  String api2 = 'keyword-clustering-func-htphw67dca-uc.a.run.app';
  String api3 = '10.0.0.12:8080';
  String api4 = 'kw-clustering-common-links-google-api-htphw67dca-uc.a.run.app';



  Future clusterKeywords(reqBody, String language, String country) async {
    // print(api3+'?language=$language&country=$country');
    final response = await http.post(Uri.https(api4, '', {'language':language, 'country':country}),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(reqBody));


    if (response.statusCode == 200) {
      print('response body: ${response.body}');
      print('Status code post request: ${response.statusCode}');
      return response.body;
    } else {
      throw Exception('Api post request failed');
    }
  }

// Future<CustomerModel> addCustomer(
//     String email,
//     String firstName,
//     String lastName,
//     String address,
//     String phone,
//     ) async {
//   final response =
//   await http.post(Uri.parse('$api/addcustomer'), headers: {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//   },
//     body: jsonEncode({
//       'username': email,
//       'password': '',
//       'email': email,
//       'first_name': firstName,
//       'last_name': lastName,
//       'address': address,
//       'phone': phone,
//       'num_orders': 0,
//     }),
//   );
//   print('added customer: ${response.body}');
//   print('Status code addCustomer: ${response.statusCode}');
//
//   if (response.statusCode == 200) {
//     return CustomerModel.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to add customer');
//   }
// }
}
