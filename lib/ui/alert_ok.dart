import 'package:flutter/material.dart';

void alert_box(String title, String content, context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                  child: Text("Ok"), onPressed: () => Navigator.pop(context))
            ],
          ));
}
