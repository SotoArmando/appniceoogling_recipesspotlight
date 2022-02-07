import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeportAscendant extends StatelessWidget {
  const RecipeportAscendant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFFf4f4f4),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextButton(
                child: Text("say hi2"),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              Text("data")
            ]),
      ),
    );
  }
}
