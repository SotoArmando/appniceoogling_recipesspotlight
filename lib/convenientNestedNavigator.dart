import 'package:flutter/material.dart';

class ConvenientNestedNavigator extends StatelessWidget {
  const ConvenientNestedNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SignUpPage builds its own Navigator which ends up being a nested
    // Navigator in our app.
    return Navigator(
      initialRoute: 'signup/personal_info',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'signup/personal_info':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext context) => Container(
                  height: 100,
                  color: Colors.blue,
                  child: TextButton(
                    child: Text("say hi"),
                    onPressed: () {
                      // This moves from the personal info page to the credentials page,
                      // replacing this page with that one.
                      Navigator.of(context)
                          .pushReplacementNamed('signup/choose_credentials');
                    },
                  ),
                );
            break;
          case 'signup/choose_credentials':
            // Assume ChooseCredentialsPage collects new credentials and then
            // invokes 'onSignupComplete()'.
            builder = (BuildContext context) => Container(
                  height: 100,
                  color: Colors.red,
                  child: TextButton(
                    child: Text("say hi2"),
                    onPressed: () {
                      // This moves from the personal info page to the credentials page,
                      // replacing this page with that one.
                      Navigator.of(context)
                          .pushReplacementNamed('signup/personal_info');
                    },
                  ),
                );
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}
