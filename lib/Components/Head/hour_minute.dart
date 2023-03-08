import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/assets_path.dart';

class HourMinute extends StatefulWidget {
  const HourMinute({Key? key}) : super(key: key);

  @override
  State<HourMinute> createState() => _HourMinuteState();
}

class _HourMinuteState extends State<HourMinute> {
  String? _dateFormatted;
  @override
  Widget build(BuildContext context) {
    setState(() {
      _dateFormatted = DateFormat.Hm().format(DateTime.now());
    });
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Padding(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: Icon(EvaIcons.clock, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top:2, right: 10),
          child: Text(_dateFormatted as String,
            style: TextStyle(fontFamily: Font.poppins, color: Colors.white, fontSize: 14),
          ),
        )
      ],
    );
  }
}

