import 'package:flutter/material.dart';

import 'package:teste/constants/assets_path.dart';
import 'package:teste/constants/app_constants.dart';
import 'package:teste/constants/strings.dart';

import 'package:teste/Components/AppScafold.dart';
import 'package:teste/Components/Icon.dart';
import 'package:teste/Components/Head/header.dart';
import 'package:teste/Components/Menu/menu_option_number.dart';
import 'package:teste/Components/Quantidade.dart';
import 'package:teste/Components/Menu/Menu_options.dart';
import 'package:teste/Components/TableDarwing.dart';



class DrawingsScreenView extends StatefulWidget {
  const DrawingsScreenView({Key? key}) : super(key: key);

  @override
  State<DrawingsScreenView> createState() => _DrawingsScreenViewState();
}

class _DrawingsScreenViewState extends State<DrawingsScreenView> {
  @override
  Widget build(BuildContext context) {
    return AppCustomScaffold(
      sideBarBody: Column(
        children: const [
          OnClickButtonSideBar(
              colorPrimary: drawingsColor, stringPath: ImageVectorPath.draw),
          createIcon(stringPath: ImageVectorPath.paint),
          createIcon(
              stringPath: ImageVectorPath.ticketStar),
          createIcon(
              stringPath: ImageVectorPath.package),
          createIcon(
              stringPath: ImageVectorPath.work),
          createIcon(
              stringPath: ImageVectorPath.storage),
          createIcon(
              stringPath: ImageVectorPath.manifest)
        ],
      ),
      body: Column(
        children: [
          const BuildHeader(),
          const SizedBox(height: kSpacing),
          const buildTitle(
              title: "Drawings List",
              color: drawingsColor,
              ),
          _buildTable(),
        ],
      ),
      logoColor: drawingsColor,
    );
  }
}

class BuildHeader extends StatefulWidget {
  const BuildHeader({Key? key}) : super(key: key);

  @override
  State<BuildHeader> createState() => _BuildHeaderState();
}

class _BuildHeaderState extends State<BuildHeader> {

  // variables
  String countProductionFrames = "0", countAllFrames = "0", countWaitingDrawings = "0";
  bool countProductionFramesLoaded = false, countAllFramesLoaded = false, countWaitingDrawingsLoaded = false;

  // This is to load data before the page load
  @override
  void initState() {
    super.initState();

    // fetch data from API
    getCountProductionFrames();
    getCountAllFrames();
    getCountWaitingDrawings();

  }

  getCountProductionFrames() async {
    List<Counter>? count = await RemoteCounterService().getCounter("CountToProductionFrames");
    setState(() {
      countProductionFrames = count.last.quantity.toString();
      countProductionFramesLoaded = true;
    });
  }

  getCountAllFrames() async {
    List<Counter>? count = await RemoteCounterService().getCounter("CountAllFrames");
    setState(() {
      countAllFrames = count.last.quantity.toString();
      countAllFramesLoaded = true;
    });
  }

  getCountWaitingDrawings() async {
    List<Counter>? count = await RemoteCounterService().getCounter("CountWaitingDrawings");
    setState(() {
      countWaitingDrawings = count.last.quantity.toString();
      countWaitingDrawingsLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      color: drawingsColor,
      title: "Drawings",
      body: Row(
        children: [
          const MenuOptions(
            svgPicture: ImageVectorPath.draw,
            title: Strings.new_drawing,

          ),
          Visibility(
            visible: countProductionFramesLoaded,
            replacement: const CircularProgressIndicator(),
            child: menuOptionNumber(
                title: Strings.frames_to_production,
                number: countProductionFrames
                ),
          ),
          Visibility(
            visible: countAllFramesLoaded,
            replacement: const CircularProgressIndicator(),
            child: menuOptionNumber(
                title: Strings.all_frames,
                number: countAllFrames
                ),
          ),
          Visibility(
            visible: countWaitingDrawingsLoaded,
            replacement: const CircularProgressIndicator(),
            child: menuOptionNumber(
                title: Strings.submitted_drawing,
                number: countWaitingDrawings,

            ),
          ),
        ],
      ),
    );
  }
}


Widget _buildTable() {
  return Padding(
    padding: const EdgeInsets.only(
        left: kSpacing * 1,
        top: kSpacing,
        right: kSpacing * 1,
        bottom: kSpacing * 0),
    child: Container(
      alignment: Alignment.centerLeft,
      child: const DrawingsListGrid(),
    ),
  );
}
