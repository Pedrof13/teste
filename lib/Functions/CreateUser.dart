import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:teste/constants/app_constants.dart';

/*
Future<void> createUser(int id, int roleId, String name, String password, bool active) async {
  final url = Uri.parse(('${internal_link}users'));

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': id,
      'roleId': roleId,
      'name': name,
      'password': password,
      'active': active,
    }),
  );

  if (response.statusCode == 201) {
    // Usuário criado com sucesso
    print('Usuário criado com sucesso!');
  } else {
    // Falha ao criar usuário
    print('Erro ao criar usuário: ${response.body}');
  }
}

 */

Future<void> createOrValidateUser(int id, int roleId, String name, String password, bool active) async {


  final response = await http.get(Uri.parse('${internal_link}users/$id'));
  if (response.statusCode == 200) {
    //Utilizador existente, passar para o próximo...
    id++;
    print(id);

    createOrValidateUser(id, roleId, name, password, active);

  }
  else {
    print("Utilizador não exixtente, criar um novo...");
    final newUser = {
      'id': id,
      'roleId': roleId,
      'name': name,
      'password': password,
      'active': active,
    };
    final createResponse = await http.post(Uri.parse('${internal_link}users'),
        body: jsonEncode(newUser),
        headers: {'Content-Type': 'application/json'});

    if (createResponse.statusCode == 201) {

      print('Utilizador criado com sucesso');

    }
    else {

      print('Erro ao criar utilizador: ${createResponse.statusCode}');
    }
  }
}
