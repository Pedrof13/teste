import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/assets_path.dart';

import 'package:teste/Components/Head/hour_minute.dart';
import 'package:teste/Components/TodayText.dart';
import 'package:teste/Components/Head/header.dart';

class createIcon extends StatefulWidget {
  final String stringPath;

  const createIcon({Key? key, required this.stringPath})
      : super(key: key);

  @override
  State<createIcon> createState() => _createIconState();
}

class _createIconState extends State<createIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSpacing / 1.5),
      child: Container(
        constraints: const BoxConstraints(
            maxWidth: 70, maxHeight: 70, minHeight: 50, minWidth: 50),
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.height / 15,
        decoration: BoxDecoration(
          color: iconUnSelected,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Color(0xBFBFBFBF),
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
              color: iconUnSelectedInterior,
            ),
            onPressed: () async {
              Navigator.pop(context);
              // here
              //locator<NavigationService>().navigateTo(AppPages.drawings);
              //Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

}

class ittekLogo extends StatefulWidget {
  final Color color;

  const ittekLogo({Key? key, required this.color}) : super(key: key);

  @override
  State<ittekLogo> createState() => _ittekLogoState();
}

class _ittekLogoState extends State<ittekLogo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      constraints: const BoxConstraints(
          maxWidth: 150, maxHeight: 70, minHeight: 50, minWidth: 50),
      child: SvgPicture.asset(
        ImageVectorPath.logo,
        width: MediaQuery.of(context).size.height / 20,
        height: MediaQuery.of(context).size.height / 20,
        color: widget.color,
        fit: BoxFit.contain,
      ),
    );
  }
}

class profilePicture extends StatefulWidget {
  const profilePicture({Key? key}) : super(key: key);

  @override
  State<profilePicture> createState() => _profilePictureState();
}

class _profilePictureState extends State<profilePicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x3f87ceeb),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 150, maxHeight: 150),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  ImageRasterPath.avatar5,
                  width: MediaQuery.of(context).size.height / 20,
                  height: MediaQuery.of(context).size.height / 20,
                  fit: BoxFit.contain,
                )),
          ),
        ),
      ),
    );
  }
}

class buildTitle extends StatefulWidget {
  final Color color;
  final String title;

  const buildTitle({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  State<buildTitle> createState() => _buildTitleState();
}

class _buildTitleState extends State<buildTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSpacing * 2),
      child:
      Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(widget.title,
                style: TextStyle(
                    color: widget.color,
                    fontWeight: FontWeight.w600,
                    fontSize: 24)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: kSpacing / 3),
              child: Container(
                  alignment: Alignment.centerRight,
                  child: _seeAllButton(onPressed: () {},color: widget.color)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: kSpacing * 2),
            child: Icon(Icons.arrow_forward_ios, color: widget.color),
          )
        ],
      ),
    );
  }
}

class _seeAllButton extends StatefulWidget {
  final Color color;
  final  Function() onPressed;
  const _seeAllButton({Key? key, required this.color, required this.onPressed}) : super(key: key);

  @override
  State<_seeAllButton> createState() => _seeAllButtonState();
}

class _seeAllButtonState extends State<_seeAllButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text("See All",
          style: TextStyle(
              color: widget.color, fontFamily: Font.poppins, fontSize: 16)),
    );
  }
}

class OnClickButtonSideBar extends StatefulWidget {
  final String stringPath;
  final Color colorPrimary;

  const OnClickButtonSideBar(
      {Key? key, required this.stringPath, required this.colorPrimary})
      : super(key: key);

  @override
  State<OnClickButtonSideBar> createState() => _OnClickButtonSideBarState();
}

class _OnClickButtonSideBarState extends State<OnClickButtonSideBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSpacing / 1.5),
      child: Container(
        constraints: const BoxConstraints(
            maxWidth: 70, maxHeight: 70, minHeight: 50, minWidth: 50),
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.height / 15,
        decoration: BoxDecoration(
          color: widget.colorPrimary,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: widget.colorPrimary.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
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
            onPressed: () async {},
          ),
        ),
      ),
    );
  }
}


class SecondaryHeader extends StatefulWidget {
  final Color color;
  final String title;

  const SecondaryHeader({Key? key, required this.color, required this.title})
      : super(key: key);

  @override
  State<SecondaryHeader> createState() => _SecondaryHeaderState();
}

class _SecondaryHeaderState extends State<SecondaryHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.color),
      child: Padding(
        padding: const EdgeInsets.only(top: kSpacing, bottom: kSpacing),
        child: Row(
          children: [
            SizedBox(width: kSpacing),
            InkWell(
                child: SvgPicture.asset(ImageVectorPath.arrowLeft,
                    height: 30, width: 30, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                }),
            SizedBox(width: kSpacing),
            Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontFamily: Font.poppins, fontSize: 30, color: Colors.white),
                )),
            Padding(
              padding: EdgeInsets.only(left: kSpacing),
              child: TodayText(),
            ),
            HourMinute(),
            createIconNotification(
                stringPath: ImageVectorPath.notification,
                NumberOfNotifications: 5)
          ],
        ),
      ),
    );
  }
}

class InfoHeader extends StatefulWidget {
  final Color color;
  final String title;
  final String number;

  const InfoHeader({Key? key, required this.color, required this.title, required this.number})
      : super(key: key);

  @override
  State<InfoHeader> createState() => _InfoHeaderState();
}

class _InfoHeaderState extends State<InfoHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.color),
      child: Padding(
        padding: const EdgeInsets.only(top: kSpacing, bottom: kSpacing),
        child: Row(
          children: [
            SizedBox(width: kSpacing),
            InkWell(
                child: SvgPicture.asset(ImageVectorPath.arrowLeft,
                    height: 30, width: 30, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                }),
            SizedBox(width: kSpacing),
            Expanded(
                child: Row(
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontFamily: Font.poppins, fontSize: 30, color: Colors.white),
                    ),Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 2.0),
                      child: Text(
                        widget.number,
                        style: const TextStyle(
                            fontFamily: Font.poppins, fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(left: kSpacing),
              child: TodayText(),
            ),
            HourMinute(),
            createIconNotification(
                stringPath: ImageVectorPath.notification,
                NumberOfNotifications: 5)
          ],
        ),
      ),
    );
  }
}





class ColorDoubleLine extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color color;

  const ColorDoubleLine(
      {Key? key,
        required this.title,
        required this.subtitle,
        required this.color})
      : super(key: key);

  @override
  State<ColorDoubleLine> createState() => _ColorDoubleLineState();
}

class _ColorDoubleLineState extends State<ColorDoubleLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w600, color: widget.color),
          ),
          Text(widget.subtitle)
        ],
      ),
    );
  }
}

class ImagePreview extends StatefulWidget {
  final String image;
  final String tittle;
  final String subtitle;
  final List<String> links;

  const ImagePreview(
      {Key? key,
        required this.image,
        required this.tittle,
        required this.subtitle,
        required this.links})
      : super(key: key);

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSpacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Image Preview",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          SizedBox(height: kSpacing / 2),
          GestureDetector(
            onTap: () {
              _showDialog(context, widget.links, widget.image);
            },
            child: SizedBox(
              width: 380,
              height: 320,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(widget.image, fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(height: kSpacing / 2),
          Text(widget.tittle,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: timeManagementColor)),
          Text(widget.subtitle,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        ],
      ),
    );
  }
}

class ImagesArrayRow extends StatelessWidget {
  const ImagesArrayRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List a = [
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
      "https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg",
    ];
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Image.network(a[index], width: 50, height: 50);
        },
      ),
    );
  }
}

void _showDialog(BuildContext context, List<String> links, String url) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final controller = StoryController();
      return AlertDialog(
        title: const Text("Image Visualisation"),
        content: StoryView(
            progressPosition: ProgressPosition.top,
            repeat: true,
            controller: controller,
            storyItems: [
              StoryItem.pageImage(
                  url: url, controller: controller, imageFit: BoxFit.contain),
              for (var link in links)
                StoryItem.pageImage(
                    url: link,
                    controller: controller,
                    imageFit: BoxFit.contain),
            ]),
        actions: <Widget>[SizedBox(height: kSpacing)],
      );
    },
  );
}




