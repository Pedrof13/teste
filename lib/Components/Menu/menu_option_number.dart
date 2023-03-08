import 'package:flutter/material.dart';

import '../../../../constants/app_constants.dart';
import '../../../../constants/assets_path.dart';

class menuOptionNumber extends StatefulWidget {
  final String title;
  String? number;

  menuOptionNumber(
      {Key? key, required this.title, required this.number})
      : super(key: key);

  @override
  State<menuOptionNumber> createState() => _menuOptionNumberState();
}

class _menuOptionNumberState extends State<menuOptionNumber> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSpacing),
      child: InkWell(
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: InkWell(
          onHover: (value) {
            setState(() => isHovering = value);
          },
          onTap: () async {
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 10,
            height: MediaQuery.of(context).size.width / 10,
            constraints: const BoxConstraints(
              minWidth: 165,
              minHeight: 165,
            ),
            decoration: BoxDecoration(
              color: isHovering ? const Color(0xfff5f5f5) : Colors.white,
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
            padding:
            const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(widget.title),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.number.toString(),
                    style: const TextStyle(
                        fontFamily: Font.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

