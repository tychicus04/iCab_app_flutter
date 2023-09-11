import 'package:flutter/material.dart';

class MsgDialog {
  MsgDialog(BuildContext context, String title, String msg);

  static void showMsgDialog(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () {  
              Navigator.of(context).pop(MsgDialog);
            },
            child: const Text(
              'OK'
            ),
          )
        ]
      )
    );
  }
}