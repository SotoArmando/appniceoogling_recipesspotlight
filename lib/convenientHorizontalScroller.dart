import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/Tastydescendant.dart';
import 'package:niceoogling/descendants/recipe.dart';
import 'package:niceoogling/gradienttext.dart';
import 'package:niceoogling/math.dart';

class convenientHorizontalScroller extends StatefulWidget {
  double height;
  double width;
  bool bottomspace;
  List<Recipe>? datalist;
  convenientHorizontalScroller({
    Key? key,
    this.height = coremeasure_1,
    this.width = coremeasure_1,
    this.bottomspace = true,
    this.datalist,
  }) : super(key: key);

  @override
  _convenientHorizontalScrollerState createState() =>
      _convenientHorizontalScrollerState();
}

class _convenientHorizontalScrollerState
    extends State<convenientHorizontalScroller> {
  final double labelsize = coremeasure_6;

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
      margin: EdgeInsets.only(bottom: widget.bottomspace ? coremeasure_0 : 0),
      height: widget.height + labelsize,
      child: ListView.builder(
        cacheExtent: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, item) => Container(
          margin: EdgeInsets.only(
              left: item == 0 ? coremeasure_0 * 0.54 : coremeasure_0 * 0.945),
          child: Column(
            children: [
              Image(
                height: widget.height,
                width: widget.width,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: CachedNetworkImageProvider(
                  Tastydescendant.imageURL(
                      from: widget.datalist![item].thumbnail_url,
                      width: widget.width * 3,
                      height: widget.height * 3),
                  maxWidth: widget.height.toInt(),
                  maxHeight: widget.width.toInt(),
                ),
              ),
              Container(
                height: labelsize,
                width: widget.width,
                alignment: Alignment.topLeft,
                color: Color(0xFFf4f4f4),
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                            colors: [Color(0xFF000511), Colors.black],
                            tileMode: TileMode.mirror,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                        .createShader(bounds);
                  },
                  child: Text("${widget.datalist![item].name}",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
            ],
          ),
        ),
        itemCount: widget.datalist!.length,
      ),
    );
  }
}
