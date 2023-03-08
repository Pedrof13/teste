import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DoubleTextLine extends StatefulWidget {
  final String clientName;
  final String clientNumber;

  const DoubleTextLine(
      {Key? key, required this.clientName, required this.clientNumber})
      : super(key: key);

  @override
  State<DoubleTextLine> createState() => _DoubleTextLineState();
}

class _DoubleTextLineState extends State<DoubleTextLine> {
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
            widget.clientName,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(widget.clientNumber)
        ],
      ),
    );
  }
}

class TrackBar extends StatefulWidget {
  final int totalSteps;
  final int currentStep;
  final Color colorProgress;

  const TrackBar(
      {Key? key,
        required this.totalSteps,
        required this.currentStep,
        required this.colorProgress})
      : super(key: key);

  @override
  State<TrackBar> createState() => _TrackBarState();
}

class _TrackBarState extends State<TrackBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 20,
      child: StepProgressIndicator(
        currentStep: widget.currentStep,
        totalSteps: widget.totalSteps,
        size: 5,
        roundedEdges: const Radius.circular(10),
        selectedColor: widget.colorProgress,
        unselectedColor: Colors.grey,
      ),
    );
  }
}

class StatusWidget extends StatefulWidget {
  final Color primaryColor;
  final String statusValue;

  const StatusWidget(
      {Key? key, required this.primaryColor, required this.statusValue})
      : super(key: key);

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        //primary: widget.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {},
      child: Text(
        widget.statusValue,
      ),
    );
  }
}



class RoundAvatar extends StatefulWidget {
  final NetworkImage imageProvider;

  const RoundAvatar({Key? key, required this.imageProvider}) : super(key: key);

  @override
  State<RoundAvatar> createState() => _RoundAvatarState();
}

class _RoundAvatarState extends State<RoundAvatar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3, top: 5, bottom: 8),
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircleAvatar(
          backgroundImage: widget.imageProvider,
          backgroundColor: Colors.grey.withOpacity(0.2),
          radius: 15,
        ),
      ),
    );
  }
}

class RoundNetworkAvatar extends StatefulWidget {
  final String imageProvider;

  const RoundNetworkAvatar({Key? key, required this.imageProvider}) : super(key: key);

  @override
  State<RoundNetworkAvatar> createState() => _RoundNetworkAvatarState();
}

class _RoundNetworkAvatarState extends State<RoundNetworkAvatar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3, top: 5, bottom: 8),
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircleAvatar(
          backgroundImage: NetworkImage(widget.imageProvider),
          backgroundColor: Colors.grey.withOpacity(0.2),
          radius: 15,
        ),
      ),
    );
  }
}

class LabeledImage extends StatefulWidget {
  final String image;
  final String title;

  const LabeledImage({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  State<LabeledImage> createState() => _LabeledImageState();
}

class _LabeledImageState extends State<LabeledImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.image,
                width: 80,
                height: 90,
                fit: BoxFit.fill,
              )),
          SizedBox(height: 8),
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ]),
      ),
    );
  }
}

class ColorReference extends StatefulWidget {
  final String reference;
  final Color color;

  const ColorReference({Key? key, required this.reference, required this.color})
      : super(key: key);

  @override
  State<ColorReference> createState() => _ColorReferenceState();
}

class _ColorReferenceState extends State<ColorReference> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: widget.color,
              border: Border.all(
                color: widget.color,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        SizedBox(width: 10),
        Text(widget.reference),
      ],
    );
  }
}

class ImageResized extends StatefulWidget {
  final String imagePath;

  const ImageResized({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<ImageResized> createState() => _ImageResizedState();
}

class _ImageResizedState extends State<ImageResized> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(widget.imagePath,
                width: 80, height: 90, fit: BoxFit.fill)));
  }
}

class EditTextGrid extends StatefulWidget {
  const EditTextGrid({Key? key}) : super(key: key);

  @override
  State<EditTextGrid> createState() => _EditTextGridState();
}

class _EditTextGridState extends State<EditTextGrid> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          cursorColor: Colors.grey.withOpacity(0.5),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: "0",
            hintStyle: TextStyle(fontSize: 12.0, color: Colors.black),
            isDense: true,
            fillColor: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

