import 'package:flutter/cupertino.dart';
import 'package:niceoogling/components/Homepage.dart';
import 'package:niceoogling/components/Libretepage.dart';
import 'package:niceoogling/components/Settingspage.dart';

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
