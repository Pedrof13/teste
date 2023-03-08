import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/Components/sideBar.dart';
import 'package:teste/responsive_builder.dart';


class AppCustomScaffold extends StatefulWidget {
  const AppCustomScaffold(
      {Key? key,
        required this.body,
        required this.sideBarBody,
        required this.logoColor})
      : super(key: key);

  final Widget body;
  final Widget sideBarBody;
  final Color logoColor;

  @override
  State<AppCustomScaffold> createState() => _AppCustomScaffoldState();
}

class _AppCustomScaffoldState extends State<AppCustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (ResponsiveBuilder.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(right: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xfff9f8fd),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3fadadad),
                    spreadRadius: 5,
                    blurRadius: 4,
                    offset: Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.height / 8,
                child: Drawer(
                  child: SideBar(
                      body: widget.sideBarBody, logoColor: widget.logoColor),
                ),
              ),
            ),
          ),
        Expanded(
          child: Scaffold(
            backgroundColor: Color(0xfff9f8fd),
            body: ResponsiveBuilder(
              mobileBuilder:
                  (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.body,
                    ],
                  ),
                );
              },
              tabletBuilder:
                  (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: (constraints.maxWidth < 950) ? 6 : 9,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              widget.body,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              desktopBuilder:
                  (BuildContext context, BoxConstraints constraints) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.08,
                        height: MediaQuery.of(context).size.height,
                        color: Color(0xfff9f8fd),
                        child: Column(
                          children: [
                            widget.body,
                          ],
                        ),
                      ),
                    ),
                    // This is you lateral flexible itens
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
