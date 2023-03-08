// Here we want to receive a GET of API
// We take the body formatted in JSON and transform to a List of GetDrawings
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:teste/constants/app_constants.dart';
import 'package:teste/classes/Cdrawings.dart';

Future<List<GetDrawings>> fetchGetDrawings() async {
  print('RESPONSE BODY');

  final response =
  await http.get(Uri.parse('${internal_link}GetDrawings')); // GetToProductionFrames para Frames OP
  print(response.statusCode);

  if (response.statusCode >= 200 && response.statusCode < 300) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('positive response');

    List<dynamic> body = jsonDecode(response.body);
    List<GetDrawings> _GetDrawings = body
        .map(
          (dynamic item) => GetDrawings.fromJson(item),
    )
        .toList();

    print(body);

    return _GetDrawings;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print('Failed to load GetDrawings');
    throw Exception('Failed to load GetDrawings');
  }
}
