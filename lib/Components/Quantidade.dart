import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teste/constants/app_constants.dart';

List<Counter> CounterFromJson(String str) =>
    List<Counter>.from(json.decode(str).map((x) => Counter.fromJson(x)));

String CounterToJson(List<Counter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Counter {
  Counter({
    required this.quantity,
  });

  int quantity;

  factory Counter.fromJson(Map<String, dynamic> json) => Counter(
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
  };
}


class RemoteCounterService {
  Future<List<Counter>> getCounter(String url) async {
    // variables
    var client = http.Client();
    var uri = Uri.parse('${internal_link}${url}');
    var response = await client.get(uri);

    // check if response is ok
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = response.body;

      return CounterFromJson(json);
    } else {
      throw Exception('Failed to load CountAllOrders');
    }
  }
}