import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/context/Tastydescendant.dart';
import 'package:niceoogling/context/descendants/recipe.dart';
import 'package:niceoogling/resource/math.dart';

class Lowhistory extends StatelessWidget {
  final Recipe recipe;

  Lowhistory({Key? key, required this.recipe}) : super(key: key);

  final height = coremeasure_8;
  final imgheight = coremeasure_7 - (coremeasure_0 / pow(1.1875, 9));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(left: coremeasure_0 / pow(1.1875, 10.75)),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: coremeasure_0 / pow(1.1875, 15),
                  color: Color(0xFFE4E4E3)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: height,
                width: height,
                margin:
                    EdgeInsets.only(right: coremeasure_0 / pow(1.1875, 10.75)),
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(Tastydescendant.imageURL(
                              from: recipe.thumbnail_url))),
                      shape: BoxShape.circle),
                  width: imgheight,
                  height: imgheight,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                              colors: [
                            Color.fromARGB(255, 17, 38, 35).withAlpha(200),
                            Color.fromARGB(255, 026, 022, 077).withAlpha(200)
                          ],
                              tileMode: TileMode.mirror,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          .createShader(bounds);
                    },
                    child: Container(
                      child: Text("Recently",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.black)),
                      height: coremeasure_0 + (coremeasure_0 / pow(1.1875, 29)),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Container(
                    width: coremeasure_14,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                        bottom: coremeasure_0 / pow(1.1875, 14)),
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                                colors: [
                              Color.fromARGB(255, 17, 38, 35).withAlpha(200),
                              Color.fromARGB(255, 026, 022, 077).withAlpha(200)
                            ],
                                tileMode: TileMode.mirror,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                            .createShader(bounds);
                      },
                      child: Text(recipe.name,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: coremeasure_0 / pow(1.1875, 1.5))),
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            height: height,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "X",
                style: TextStyle(fontSize: coremeasure_0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
