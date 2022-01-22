import 'package:flutter/cupertino.dart';

class Settingspage extends StatefulWidget {
  Settingspage({Key? key}) : super(key: key);

  @override
  _SettingspageState createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text("Hello world: says Settingspage")],
      ),
    );
  }
}
