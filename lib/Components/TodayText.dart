import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/assets_path.dart';

class TodayText extends StatelessWidget {
  const TodayText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Icon(EvaIcons.calendar, color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.only(top:2, right: 10),
            child: Text(
              DateFormat.yMMMEd().format(DateTime.now()),
              style: const TextStyle(fontFamily: Font.poppins, color: Colors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
