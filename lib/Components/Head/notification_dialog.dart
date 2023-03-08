import 'package:flutter/material.dart';

import '../../../../constants/assets_path.dart';


class RowNotification extends StatefulWidget {
  final String notificationText;
  final String notificationImage;

  RowNotification(
      @required this.notificationText, @required this.notificationImage);

  @override
  State<RowNotification> createState() => _RowNotificationState();
}

class _RowNotificationState extends State<RowNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Image.asset(widget.notificationImage, height: 60, width: 60),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.notificationText,
              style: TextStyle(
                color: Color(0xff959595),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class NotificationDialog extends StatefulWidget {
  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(top: 80, right: 40),
      alignment: Alignment.topRight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20)),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20),
        height: 400,
        width: 700,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Notification Center",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              RowNotification("O texto numero #1408 foi apagado pelo Vitor.",
                  ImageRasterPath.avatar1),
              RowNotification("O vitor é muito fixe.",
                  ImageRasterPath.avatar1),
              RowNotification("Edição feita, o Vitor é MUITO fixe.",
                  ImageRasterPath.avatar1),
              RowNotification("Edição feita, o Vitor é MUITO fixe.",
                  ImageRasterPath.avatar1),
              RowNotification("Edição feita, o Vitor é MUITO fixe.",
                  ImageRasterPath.avatar1),
              RowNotification("Edição feita, o Vitor é MUITO fixe.",
                  ImageRasterPath.avatar1),
            ],
          ),
        ),
      ),
    );
  }
}
