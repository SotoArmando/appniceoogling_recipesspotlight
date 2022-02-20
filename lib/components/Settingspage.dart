import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:niceoogling/components/Low/Lowhistory.dart';
import 'package:niceoogling/context/Tastydescendant.dart';
import 'package:niceoogling/context/descendants/recipe.dart';
import 'package:niceoogling/resource/math.dart';
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
                      Lowhistory(recipe: i),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: coremeasure_1,
            width: double.infinity,
          ),
          for (String i in [
            "Settings",
            "About us",
            "License",
            "History",
            "Close Session"
          ])
            Container(
              height: coremeasure_6 +
                  (coremeasure_0 / pow(1.1875, i == "Settings" ? 9 : 1)),
              padding: EdgeInsets.only(left: coremeasure_0),
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                          colors: [
                        Color.fromARGB(255, 038, 038, 017),
                        Color.fromARGB(255, 026, 022, 077)
                      ],
                          tileMode: TileMode.mirror,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)
                      .createShader(bounds);
                },
                child: Text(
                  i,
                  style: GoogleFonts.publicSans(
                    textStyle: TextStyle(
                      height: 1,
                      fontWeight: FontWeight.w400,
                      fontSize: coremeasure_0 * pow(1.1875, 0.33 + 1 / 3),
                      color: Colors.black.withOpacity(0.99705),
                      letterSpacing: coremeasure_0 / (pow(1.1875, 14)),
                    ),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              alignment: Alignment.centerLeft,
            )
        ],
      ),
    );
  }
}
