import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niceoogling/resource/math.dart';

class Lowtag extends StatefulWidget {
  const Lowtag({ Key? key }) : super(key: key);

  @override
  _LowtagState createState() => _LowtagState();
}

class _LowtagState extends State<Lowtag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 1)
      ),
      width: coremeasure_13,
      height: coremeasure_10,
      alignment: Alignment.center,
      child: Text("Nice floppy"),
    );
  }
}