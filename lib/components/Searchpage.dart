import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niceoogling/components/Low/Lowtag.dart';
import 'package:niceoogling/context/Tastydescendant.dart';
import 'package:niceoogling/resource/math.dart';
const List<String> categories = [
  "Breakfast",
  "Lunch",
  "Beverages",
  "Appetizers",
  'Soups',
  "Salads",
  "Beef",
  "Poultry",
  "Pork",
  "Seafood",
  "Vegetarian",
  "Vegetables",
  "Other",
  "Desserts",
  "Canning / Freezing",
  "Breads",
  "Holidays",
  "Entertaining"
];
class Searchpage extends StatefulWidget {
  Searchpage({Key? key}) : super(key: key);

  @override
  SearchpageState createState() => SearchpageState();
}

class SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: coremeasure_0, right: coremeasure_0),
        child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => [
          ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                        colors: [Colors.black, Color(0xFF000511)],
                        tileMode: TileMode.mirror,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    .createShader(bounds);
              },
              child: Container(
                height: coremeasure_3,
                child: Text("Search for recipes",
                    style: Theme.of(context).textTheme.headline2),
                alignment: Alignment.center,
              ),
            ),
            Container(
              
              margin:
                  EdgeInsets.only(bottom: (coremeasure_10 - coremeasure_4) / 2),
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
                style: Theme.of(context)
                      .textTheme
                      .bodyText1,
                decoration: const InputDecoration.collapsed(
                  
                    hintText: "Search any parameters"),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              direction: Axis.horizontal,
              runSpacing: coremeasure_0 / 2,
              children: [
              for (var i in categories)
                    Lowtag(label: i)
            ],)
        ][index]),
          
         
        );
  }
}
