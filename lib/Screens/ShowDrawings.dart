import 'package:flutter/material.dart';

import 'package:teste/classes/Cdrawings.dart';
import 'package:teste/Functions/Drawings/GetDrawings.dart';




class ShowDrawings extends StatefulWidget {
  const ShowDrawings({super.key});

  @override
  State<StatefulWidget> createState() => _ShowDrawingsState();
}


class _ShowDrawingsState extends State<ShowDrawings> {

  late Future<List<GetDrawings>> futureGetDrawings;

  int _currentSortColumn = 0;
  bool _isSortAsc = true;



  @override
  Widget build(BuildContext context) {
    futureGetDrawings = fetchGetDrawings();

    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Lista de desenhos", style: TextStyle(color: Colors.white),),

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
                child: FutureBuilder<List<GetDrawings>>(
                    future: futureGetDrawings,
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
        label: const Text('Client'),
        onSort: (columnIndex, _) {},
      ),
      DataColumn(
        label: const Text('Drawing Nunber'),
        onSort: (columnIndex, _) {},
      ),
      DataColumn(
        label: const Text('Description'),
        onSort: (columnIndex, _) {},
      ),
      DataColumn(
        label: const Text('Drawing'),
        onSort: (columnIndex, _) {},
      ),



    ];
  }

  // Here u create ur rows
  // Because of API, we need a List generate, this component create a List with tha widgets u want with the snapshot data u receive the API proprieties
  List<DataRow> _createRows(dynamic snapshot) {
    return List.generate(snapshot.data!.length, (index) {

      var clientName = snapshot.data![index].clientName;
      var clientNumber = snapshot.data![index].clientNumber;
      var drawingNumber = snapshot.data![index].drawingNumber;
      var description = snapshot.data![index].description;
      var image = snapshot.data![index].image;
      int selectedIndex = -1;

      return DataRow(cells: [

        DataCell(Text(clientName.toString()+" | "+clientNumber.toString())),
        DataCell(Text(drawingNumber.toString())),
        DataCell(Text(description.toString())),
        DataCell(Text(image.toString())),

      ],
        selected: 0 == selectedIndex,
        onSelectChanged: (val) {
          setState(() {

          });
        },








      );
    });
  }

}