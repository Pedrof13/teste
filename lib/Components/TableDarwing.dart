import 'package:flutter/material.dart';

import 'package:teste/Constants/app_constants.dart';
import '../../../../../constants/assets_path.dart';
import 'package:teste/classes/Cdrawings.dart';
import 'package:teste/Functions/Drawings/GetDrawings.dart';
import 'package:teste/Components/gridEcoWidget.dart';


class DrawingsListGrid extends StatefulWidget {
  const DrawingsListGrid({Key? key}) : super(key: key);

  @override
  State<DrawingsListGrid> createState() => _DrawingsListGridState();
}

class _DrawingsListGridState extends State<DrawingsListGrid> {
  late Future<List<GetDrawings>> futureGetDrawingsService;
  int _currentSortColumn = 0;
  bool _isSortAsc = true;

  @override
  Widget build(BuildContext context) {
    futureGetDrawingsService = fetchGetDrawings();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: orderColorShadow,
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      child: Flexible(
        flex: 10,
        child: FutureBuilder<List<GetDrawings>>(
            future: futureGetDrawingsService,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DataTable(
                  showCheckboxColumn: false,
                  columnSpacing: MediaQuery.of(context).size.width / 15,
                  dataRowHeight: 120,
                  horizontalMargin: 30,
                  headingTextStyle: const TextStyle(
                      color: drawingsColor,
                      fontFamily: Font.poppins,
                      fontWeight: FontWeight.w500),
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
                  child: CircularProgressIndicator(
                      color: samplesColor, strokeWidth: 2),
                ),
              );
            }),
      ),
    );
  }

  // Here u can create ur columns
  // Be careful u need to have the same quantity of widgets in ur row
  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: const Text('Client'),
        onSort: (columnIndex, _) {},			),
      DataColumn(
        label: const Text('Drawing Number'),
        onSort: (columnIndex, _) {},			),
      DataColumn(
        label: const Text('Description'),
        onSort: (columnIndex, _) {},			),
      DataColumn(
        label: const Text('Drawing'),
        onSort: (columnIndex, _) {},			),
    ];
  }

  // Here u create ur rows
  // Because of API, we need a List generate, this component create a List with tha widgets u want with the snapshot data u receive the API proprieties
  List<DataRow> _createRows(dynamic snapshot) {
    return List.generate(snapshot.data!.length, (index) {
      var id = snapshot.data![index].clientNumber;
      var client = snapshot.data![index].clientName;
      var drawing_number = snapshot.data![index].drawingNumber;
      var description = snapshot.data![index].description;
      int selectedIndex = -1;

      return DataRow(cells: [
        DataCell(DoubleTextLine(
          clientName: client.toString(),
          clientNumber: id.toString(),
        )),
        DataCell(Text(drawing_number.toString())),
        DataCell(Text(description.toString())),
        DataCell(Text(snapshot.data![index].image)),
      ],
        selected: id == selectedIndex,
        onSelectChanged: (val) {
          setState(() {


          });
        },
      );
    });
  }
}
