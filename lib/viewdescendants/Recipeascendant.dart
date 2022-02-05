import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/Tastydescendant.dart';
import 'package:niceoogling/descendants/recipe.dart';
import 'package:niceoogling/math.dart';

class Recipeascendant extends StatelessWidget {
  const Recipeascendant(
      {Key? key,
      required this.recipe,
      required this.height,
      required this.width,
      required this.labelsize})
      : super(key: key);
  final Recipe recipe;
  final double height;
  final double width;
  final double labelsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          height: height,
          width: width,
          fit: BoxFit.cover,
          alignment: Alignment.center,
          image: CachedNetworkImageProvider(
            Tastydescendant.imageURL(
                from: recipe.thumbnail_url,
                width: width * 3,
                height: height * 3),
            maxWidth: height.toInt(),
            maxHeight: width.toInt(),
          ),
        ),
        Container(
          height: labelsize,
          padding: EdgeInsets.only(top: coremeasure_0 / pow(1.1875, 11)),
          width: width,
          alignment: Alignment.topLeft,
          color: Color(0xFFf4f4f4),
          child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                        colors: [Color(0xFF000814), Color(0xFF000808)],
                        tileMode: TileMode.mirror,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    .createShader(bounds);
              },
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                          colors: [Color(0xFF111100), Color(0xFF7E7AB1)],
                          tileMode: TileMode.mirror,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)
                      .createShader(bounds);
                },
                child: Text("${recipe.name}",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black)),
              )),
        ),
      ],
    );
  }
}
