import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teste/classes/Cusers.dart';

import 'package:teste/constants/app_constants.dart';

Future<List<Users>> fetchGetAllUsers() async {
  print('RESPONSE BODY');

  // Internal LINK = http://10.0.10.139:5000/api/GetAllFrames
  // External LINK = https://api.neivacor.pt/api/GetAllFrames


  final response = await http.get(Uri.parse('${internal_link}users'));
  print(response.statusCode);

  if (response.statusCode >= 200 && response.statusCode < 300) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('positive response');

    List<dynamic> body = jsonDecode(response.body);
    List<Users> _Users = body
        .map(
          (dynamic item) => Users.fromJson(item),
    )
        .toList();

    print(body);

    return _Users;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print('Failed to load users');
    throw Exception('Failed to load users');
  }
}
