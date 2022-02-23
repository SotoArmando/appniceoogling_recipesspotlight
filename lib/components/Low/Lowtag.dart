import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niceoogling/resource/math.dart';

class Lowtag extends StatefulWidget {
  final String label;
  const Lowtag({ Key? key, required this.label }) : super(key: key);

  @override
  _LowtagState createState() => _LowtagState();
}

class _LowtagState extends State<Lowtag> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
      
      
      width: coremeasure_13,
      height: coremeasure_10,
      alignment: Alignment.center,
      child: Text(widget.label, style: Theme.of(context)
                      .textTheme
                      .bodyText1,),
    ),);
  }
}