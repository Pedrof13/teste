import 'package:flutter/material.dart';

import 'package:teste/classes/Cusers.dart';

import 'package:teste/Functions/GetUsers.dart';
import 'package:teste/Functions/EditUser.dart';
import 'package:teste/Functions/DeleteUser.dart';
import 'package:teste/Functions/CreateUser.dart';




class InfUsers extends StatefulWidget {
  const InfUsers({super.key});

  @override
  State<StatefulWidget> createState() => _InfUsersState();
}


class _InfUsersState extends State<InfUsers> {

  late Future<List<Users>> futureUsers;

  int _currentSortColumn = 0;
  bool _isSortAsc = true;


  
  void _showEditForm(Users user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit User'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("ID: "+user.id.toString()),

                TextFormField(
                  initialValue: user.name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  onChanged: (String value) {
                    user.name = value;
                  },
                ),
                TextFormField(
                  initialValue: user.password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  onChanged: (String value) {
                    user.password = value;
                  },
                ),

              ],
            ),
          ),
          actions: <Widget>[

            ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                deleteUser(user.id);
                Navigator.of(context).pop();
              },
            ),

            ElevatedButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            ElevatedButton(
              child: Text('Salvar'),
              onPressed: () {
                editUser(user.id,user.roleId,user.name, user.password,user.active);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void _showNewUser(){

    int ID=1;
    String name="";
    String password="";
    bool active=true;


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create User'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                TextFormField(
                  initialValue: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  onChanged: (String value) {
                    name = value;
                  },
                ),
                TextFormField(
                  initialValue: password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  onChanged: (String value) {
                    password = value;
                  },
                ),

              ],
            ),
          ),
          actions: <Widget>[


            ElevatedButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            ElevatedButton(
              child: Text('Criar'),
              onPressed: () {
                createOrValidateUser(ID, 1, name, password, active);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );



  }


  @override
  Widget build(BuildContext context) {
    futureUsers = fetchGetAllUsers();

    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Inf. dos utilizadores", style: TextStyle(color: Colors.white),),

        actions: [
          IconButton(onPressed: (){
            _showNewUser();
          }, icon: Icon(Icons.add),),


        ],
        centerTitle: true,

      ),
      body: Center(


        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(

              height: 520, //define a altura do container
              width: 1200, //define largura do container

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
                              .width / 15,
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


          ],
        ),
      ),
    );
  }

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
        onSelectChanged: (val) {
          setState(() {
            _showEditForm(Users(id: id, roleId: roleId, name: name, password: password, active: active));

          });
        },



        




      );
    });
  }

}