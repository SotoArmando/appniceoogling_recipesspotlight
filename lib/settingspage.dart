import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:niceoogling/Tastydescendant.dart';
import 'package:niceoogling/descendants/recipe.dart';
import 'package:niceoogling/math.dart';
import 'package:niceoogling/modelascendants/Historyascendant.dart';
import 'package:provider/provider.dart';

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
          Consumer<Tastydescendant>(
            builder: (context, tastydescendant, child) => Stack(
              children: [
                if (child != null) child,
                Column(
                  children: [
                    for (Recipe i in tastydescendant.homepagefeature0.take(2))
                      HistoryAscendant(recipe: i),
                  ],
                )
              ],
            ),
          ),
          for (String i in ["Settings", "About us", "License"])
            Container(
              height: coremeasure_6 + (coremeasure_0 / pow(1.1875, 1)),
              padding: EdgeInsets.only(left: coremeasure_0),
              child: Text(
                i,
                style: GoogleFonts.publicSans(
                  textStyle: TextStyle(
                    height: 1,
                    fontWeight: FontWeight.w300,
                    fontSize: coremeasure_1,
                    color: Colors.black.withOpacity(0.99705),
                    letterSpacing: coremeasure_0 / (pow(1.1875, 15)),
                  ),
                ),
                textAlign: TextAlign.start,
              ),
              alignment: Alignment.centerLeft,
            )
        ],
      ),
    );
  }
}
