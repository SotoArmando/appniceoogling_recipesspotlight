import 'package:flutter/cupertino.dart';
import 'package:niceoogling/homepage.dart';
import 'package:niceoogling/libretepage.dart';
import 'package:niceoogling/settingspage.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Libretepage();
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Settingspage();
  }
}
