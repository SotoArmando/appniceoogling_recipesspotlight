import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/components/Low/Lowrecipe.dart';
import 'package:niceoogling/context/Tastydescendant.dart';
import 'package:niceoogling/context/descendants/recipe.dart';
import 'package:niceoogling/resource/math.dart';


class convenientHorizontalScroller extends StatefulWidget {
  final double height;
  final double width;
  final bool bottomspace;
  final List<Recipe>? datalist;
  final bool yellow;

  const convenientHorizontalScroller({
    Key? key,
    this.height = coremeasure_1,
    this.width = coremeasure_1,
    this.bottomspace = true,
    this.yellow = true,
    this.datalist,
  }) : super(key: key);

  @override
  _convenientHorizontalScrollerState createState() =>
      _convenientHorizontalScrollerState();
}

class _convenientHorizontalScrollerState
    extends State<convenientHorizontalScroller> {
  final double labelsize = coremeasure_7;

  @override
  void initState() {
    // TODO: implement initState

    for (Recipe i in widget.datalist!) {
      try {
        precacheImage(
          CachedNetworkImageProvider(
            i.thumbnail_url,
          ),
          context,
          onError: (exception, stackTrace) => {},
        );
      } catch (e) {
        break;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.bottomspace ? coremeasure_3 : 0),
      height: widget.height + labelsize,
      child: ListView.builder(
        cacheExtent: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, item) => Container(
            margin: EdgeInsets.only(
                left: item == 0
                    ? coremeasure_0 / pow(1.1875, 4)
                    : coremeasure_0 / pow(1.1875, 4)),
            child: Lowrecipe(
                recipe: widget.datalist![item],
                height: widget.height,
                width: widget.width,
                labelsize: labelsize)),
        itemCount: widget.datalist!.length,
      ),
    );
  }
}
