import 'package:flutter/material.dart';

import 'package:teste/Components/Icon.dart';
import '../../../constants/app_constants.dart';

class SideBar extends StatefulWidget {
  final Widget body;
  final Color logoColor;
  const SideBar({Key? key, required this.body, required this.logoColor}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            const SizedBox(height: kSpacing * 2),
            ittekLogo(color: widget.logoColor),
            IconsResponsive(body: widget.body),
            const SizedBox(height: kSpacing * 2),
            profilePicture(),
          ],
        ),
      ),
    );
  }
}

class IconsResponsive extends StatefulWidget {
  final Widget body;
  const IconsResponsive({Key? key, required this.body}) : super(key: key);

  @override
  State<IconsResponsive> createState() => _IconsResponsiveState();
}

class _IconsResponsiveState extends State<IconsResponsive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.body,
    );
  }
}


