import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants/app_constants.dart';

class MenuOptions extends StatefulWidget {
  final String title;
  final String svgPicture;
  const MenuOptions(
      {Key? key,
        required this.title,
        required this.svgPicture,})
      : super(key: key);

  @override
  State<MenuOptions> createState() => _MenuOptionsState();
}

class _MenuOptionsState extends State<MenuOptions> {
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
            await _navigateTo(context);
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
                  child: info(title: widget.title),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    widget.svgPicture,
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width / 24,
                    height: MediaQuery.of(context).size.width / 24,
                    fit: BoxFit.fitHeight,
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

class info extends StatefulWidget {
  final String title;
  const info({Key? key, required this.title}) : super(key: key);

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}


Future<void> _navigateTo(BuildContext context) async {
  //await Navigator.pushNamed(context);
}
