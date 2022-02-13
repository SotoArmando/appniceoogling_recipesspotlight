import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niceoogling/Tastydescendant.dart';
import 'package:niceoogling/math.dart';

class Searchscreen extends StatefulWidget {
  Searchscreen({Key? key}) : super(key: key);

  @override
  SearchscreenState createState() => SearchscreenState();
}

class SearchscreenState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: coremeasure_0, right: coremeasure_0),
        child: Column(
          children: [
            Container(
              height: coremeasure_17 - coremeasure_11,
              width: double.infinity,
              child: OverflowBox(
                alignment: Alignment.center,
                child: Image(
                  height: coremeasure_18,
                  fit: BoxFit.cover,
                  image: NetworkImage(Tastydescendant.imageURL(
                      from: "http://localhost:3000/pic0.png",
                      width: coremeasure_18 * 3,
                      height: coremeasure_18 * 3)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: (coremeasure_10 - coremeasure_5) / 2),
              padding: EdgeInsets.only(left: coremeasure_0),
              // color: Colors.red,
              // height: coremeasure_10,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xFFE4E4E3),
                      width: coremeasure_0 / pow(1.1875, 15)),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              height: coremeasure_5,
              alignment: Alignment.center,
              child: TextFormField(
                minLines: 1,
                maxLines: 1,
                decoration: const InputDecoration.collapsed(
                    hintText: "Search any parameters"),
              ),
            ),
            Flex(
              direction: Axis.vertical,
            )
          ],
        ));
  }
}
