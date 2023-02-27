import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:teste/constants/app_constants.dart';



Future<void> editUser(int id, int roleId, String name, String password, bool active) async {

  final url = Uri.parse(('${internal_link}users'));

  final response = await http.put(
    url,
    body: jsonEncode({
      'id':id,
      'role_id':roleId,
      'name': name,
      'password': password,
      'active':active,

    }),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 201) {
    print('Utilizador atualizado com sucesso!');
  } else {
    print('Erro ao atualizar utilizador: ${response.statusCode}');
  }
}