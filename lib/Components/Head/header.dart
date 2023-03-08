import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants/app_constants.dart';
import '../../../../constants/assets_path.dart';
import 'package:teste/Components/Head/hour_minute.dart';
import 'package:teste/Components/TodayText.dart';
import 'package:teste/Components/Head/notification_dialog.dart';

class Header extends StatefulWidget {
  final Color color;
  final String title;
  final Widget body;
  const Header({Key? key, required this.body, required this.color, required this.title}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        NavigationHeader(color: widget.color, title: widget.title),
        Padding(
          padding: const EdgeInsets.only(top: kSpacing * 4),
          child: _buildMenuOptions(body: widget.body),
        ),
      ],
    );
  }
}

class _buildMenuOptions extends StatefulWidget {
  final Widget body;
  const _buildMenuOptions({Key? key, required this.body}) : super(key: key);

  @override
  State<_buildMenuOptions> createState() => _buildMenuOptionsState();
}

class _buildMenuOptionsState extends State<_buildMenuOptions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: widget.body,
    );
  }
}


class NavigationHeader extends StatefulWidget {
  final Color color;
  final String title;
  const NavigationHeader({Key? key, required this.color, required this.title}) : super(key: key);

  @override
  State<NavigationHeader> createState() => _NavigationHeaderState();
}

class _NavigationHeaderState extends State<NavigationHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.color),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 60),
        child: Row(
          children: [
            SizedBox(width: kSpacing),
            Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontFamily: Font.poppins, fontSize: 40, color: Colors.white),
                )),
            Padding(
              padding: EdgeInsets.only(left: kSpacing),
              child: TodayText(),
            ),
            HourMinute(),
            createIconNotification(stringPath: ImageVectorPath.notification, NumberOfNotifications: 1)
          ],
        ),
      ),
    );
  }
}

class createIconNotification extends StatefulWidget {
  final String stringPath;
  final int NumberOfNotifications;

  const createIconNotification(
      {Key? key, required this.stringPath, required this.NumberOfNotifications})
      : super(key: key);

  @override
  _createIconNotificationState createState() => _createIconNotificationState();
}

class _createIconNotificationState extends State<createIconNotification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSpacing),
      child: Stack(
        children: <Widget>[
          Container(
            constraints: const BoxConstraints(
                maxWidth: 50, maxHeight: 50, minHeight: 50, minWidth: 50),
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(
              color: iconUnSelected,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: IconButton(
                icon: SvgPicture.asset(
                  widget.stringPath,
                  width: MediaQuery.of(context).size.height / 15,
                  height: MediaQuery.of(context).size.height / 15,
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return NotificationDialog();
                      });
                  //CustomDropDown(values, orderColor)
                  //Navigator.pop(context);
                },
              ),
            ),
          ),
          Positioned(
            right: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 5),
                child: Text(
                  widget.NumberOfNotifications.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
