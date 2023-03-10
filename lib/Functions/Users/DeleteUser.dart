import 'package:http/http.dart' as http;

import 'package:teste/constants/app_constants.dart';

Future<void> deleteUser(int userId) async {
  final url = Uri.parse('${internal_link}users'); // Substitua pelo URL correto da sua API e o ID do usuário a ser excluído

  final response = await http.delete(
    url,
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 204) {
    // utilizador removido com sucesso
    print('Utilizador removido com sucesso!');
  } else {
    // Algo deu errado
    print('Erro ao remover utilizador: ${response.statusCode}');
  }
}
