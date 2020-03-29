import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

import 'my_bottom_bar.dart';
import 'my_continue_button.dart';

class Feelings extends StatefulWidget {
  @override
  _FeelingsState createState() => _FeelingsState();
}

class _FeelingsState extends State<Feelings> {
  HashMap answers = new HashMap<String, bool>();

  @override
  Widget build(BuildContext context) {
    final dayModel = Provider.of<Day>(context);

    List<String> feelings = [
      "Happy",
      "Angry",
      "Depressed",
      "Sad",
      "Silly",
      "Anxious"
    ];
    feelings.forEach((feeling) => answers.putIfAbsent(feeling, () => false));

    GridView temp = GridView.count(
        // Create a grid with 2 columns
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: feelings.map((String keyName) {
          return GridTile(
              child: CheckboxListTile(
            title: Text(AppLocalizations.of(context).translate(keyName)),
            value: answers[keyName],
            onChanged: (value) {
              setState(() {
                answers.update(keyName, (e) => value);
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ));
        }).toList());

    CustomContinueButton continueButton = CustomContinueButton(
      onPressed: () {
        HashMap chosenActivities = answers;
        chosenActivities.removeWhere((k, v) => !v);
        dayModel.feelings = chosenActivities.keys.toList();
        Navigator.pushNamed(context, 'fourth-question');
      },
    );

    return SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
            bottomNavigationBar: CustomBottomBar(
              continueButton: continueButton,
            ),
            body: Center(
              child: Column(children: <Widget>[
                SizedBox(height: 20.0),
                Text(
                    AppLocalizations.of(context).translate('question feelings'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                new Flexible(child: temp)
              ]),
            )));
  }
}
