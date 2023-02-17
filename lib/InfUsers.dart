import 'package:flutter/material.dart';
import 'package:teste/classes/users.dart';
import 'package:teste/Getusers.dart';
import 'package:teste/constants/app_constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';



class InfUsers extends StatefulWidget {
  const InfUsers({super.key});

  @override
  State<StatefulWidget> createState() => _InfUsersState();
}


class _InfUsersState extends State<InfUsers> {

  late Future<List<Users>> futureUsers;

  int _currentSortColumn = 0;
  bool _isSortAsc = true;




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



  @override
  Widget build(BuildContext context) {
    futureUsers = fetchGetAllUsers();

    return Scaffold(
      appBar: AppBar(

        title: Text("Inf. dos utilizadores"),
        centerTitle: true,

      ),
      body: Center(


        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(

              height: 500, //define a altura do container
              width: 1100, //define largura do container
              decoration: BoxDecoration(
                color: Colors.white,


              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: FutureBuilder<List<Users>>(
                    future: futureUsers,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DataTable(

                          columnSpacing: MediaQuery
                              .of(context)
                              .size
                              .width / 10,
                          dataRowHeight: 35,
                          horizontalMargin: 30,
                          headingTextStyle: const TextStyle(
                              fontWeight: FontWeight.w400),
                          columns: _createColumns(),
                          rows: _createRows(snapshot),
                          sortColumnIndex: _currentSortColumn,
                          sortAscending: _isSortAsc,
                        );
                      } else if (snapshot.hasError) {
                        print('${snapshot.error}');
                        return Text('${snapshot.error}');
                      }
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }),
              ),
            ),

            SizedBox(height: 20,),


            ElevatedButton(onPressed: () {
              editUser(42,1,'João','1234',true);

            }, child: Text("Editar"),)




          ],
        ),
      ),
    );
  }
/*
  DataTable _createDataTable(dynamic snapshot) {
    return DataTable(
      columnSpacing: MediaQuery
          .of(context)
          .size
          .width / 15,
      dataRowHeight: 60,
      horizontalMargin: 30,
      headingTextStyle: const TextStyle(


          fontWeight: FontWeight.w400),
      columns: _createColumns(),
      rows: _createRows(snapshot),


    );
  }

 */

  // Here u can create ur columns
  // Be careful u need to have the same quantity of widgets in ur row
  List<DataColumn> _createColumns() {
    return [

      DataColumn(
        label: const Text('id'),
        onSort: (columnIndex, _) {},
      ),
      DataColumn(
        label: const Text('Role ID'),
        onSort: (columnIndex, _) {},
      ),
      DataColumn(
        label: const Text('Name'),
        onSort: (columnIndex, _) {},
      ),
      DataColumn(
        label: const Text('Password'),
        onSort: (columnIndex, _) {},
      ),
      DataColumn(
        label: const Text('Active'),
        onSort: (columnIndex, _) {},
      ),


    ];
  }

  // Here u create ur rows
  // Because of API, we need a List generate, this component create a List with tha widgets u want with the snapshot data u receive the API proprieties
  List<DataRow> _createRows(dynamic snapshot) {
    return List.generate(snapshot.data!.length, (index) {


      var roleId = snapshot.data![index].roleId;
      var name = snapshot.data![index].name;
      var password = snapshot.data![index].password;
      var active = snapshot.data![index].active;
      var id = snapshot.data![index].id;
      int selectedIndex = -1;

      return DataRow(cells: [

        DataCell(Text(id.toString())),
        DataCell(Text(roleId.toString())),
        DataCell(Text(name.toString())),
        DataCell(Text(password.toString())),
        DataCell(Text(active.toString())),



      ],
        selected: 0 == selectedIndex,



        




      );
    });
  }

}