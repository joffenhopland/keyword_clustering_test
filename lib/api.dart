import 'dart:convert';
import 'package:http/http.dart' as http;


class Api {
  String api = 'https://keyword-clustering-func-htphw67dca-uc.a.run.app/';
  String api2 = 'keyword-clustering-func-htphw67dca-uc.a.run.app';


  Future clusterKeywords(reqBody) async {
    final response = await http.post(Uri.https(api2, '/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(reqBody));
    print('req body: ${response.body}');
    print('Status code post request: ${response.statusCode}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
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
