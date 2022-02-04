import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/math.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({Key? key}) : super(key: key);

  @override
  _SettingspageState createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: coremeasure_9,
            decoration: BoxDecoration(
                color: Colors.red,
                border:
                    Border(bottom: BorderSide(color: Colors.blue, width: 1))),
          ),
          Container(
            height: coremeasure_9,
            decoration: BoxDecoration(
                color: Colors.red,
                border:
                    Border(bottom: BorderSide(color: Colors.blue, width: 1))),
          ),
          for (String i in ["Settings", "About us", "License"])
            Container(
              height: coremeasure_6,
              padding: EdgeInsets.only(left: coremeasure_0),
              child: Text(
                i,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.start,
              ),
              alignment: Alignment.centerLeft,
            )
        ],
      ),
    );
  }
}
