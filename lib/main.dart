import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/pages/questions/note.dart';
import 'package:shelter_in_place/pages/questions/social_distancing.dart';
import 'package:shelter_in_place/services/days_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'models/day_model.dart';
import 'pages/home.dart';
import 'pages/localization/localizations.dart';
import 'pages/login.dart';
import 'pages/questions/activities.dart';
import 'pages/questions/feelings.dart';

void main() => runApp(
    ChangeNotifierProvider<AuthService>(
          child: MyApp(), create: (context) => AuthService()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Day>(
            builder: (context) => Day(),
          ),
          Provider<DaysService>(
            builder: (context) => DaysService(),
          )
        ],
        child: MaterialApp(
            title: 'Flutter Shelter in Place Demo',
            theme: ThemeData(primarySwatch: Colors.blue),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('en'), // English
              const Locale('es'), // Spanish
              const Locale('nl') // Dutch
            ],
            home: FutureBuilder(
              future: Provider.of<AuthService>(context).getUser(),
              builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // log error to console
                  if (snapshot.error != null) {
                    return Text(snapshot.error.toString());
                  }
                  // redirect to the `HomePage` and pass in the user to 
                  // display the user's email in welcome msg
                  return snapshot.hasData ? HomePage(snapshot.data) : LoginPage();
                } else {
                  // show loading indicator
                  return Container(color: Colors.white);
                  // return LoadingCircle();
                }
              },
            ),
            onGenerateRoute: (routeSettings) {
              // Use names routes to prevent duplicate code
              if (routeSettings.name == 'first-question') {
                return MaterialPageRoute(
                  builder: (context) => SocialDistancing(),
                );
              } else if (routeSettings.name == 'second-question') {
                return MaterialPageRoute(
                  builder: (context) => Activities(),
                );
              } else if (routeSettings.name == 'third-question') {
                return MaterialPageRoute(
                  builder: (context) => Feelings(),
                );
              } else if (routeSettings.name == 'fourth-question') {
                return MaterialPageRoute(
                  builder: (context) => NoteForDay(),
                );
              }else if (routeSettings.name == 'overview') {

                // FirebaseUser user = getCurrentUser(context);
                // final Future<FirebaseUser> result = Provider.of<AuthService>(context).getUser();
                
                FirebaseUser user = Provider.of<AuthService>(context).currentUser;

                return MaterialPageRoute(
                  builder: (context) => HomePage(user),
                );
              }

              return null;
            }));
  }
}

// FirebaseUser getCurrentUser(context) async {
//   FirebaseUser user = await Provider.of<AuthService>(context).getUser();
//   return user;
// }

// Not being used yet, but nice for when Firebase implementation is in place
class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}
