import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

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

    RaisedButton continueB = RaisedButton(
      child:
          Text(AppLocalizations.of(context).translate('continue button text')),
      onPressed: () {
        HashMap chosenActivities = answers;
        chosenActivities.removeWhere((k, v) => !v);
        dayModel.feelings = chosenActivities.keys.toList();
        Navigator.pushNamed(context, 'fourth-question');
      },
    );

    return new Scaffold(
        appBar: AppBar(
          title: Text(
              AppLocalizations.of(context).translate('question bar title')),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Text(
              AppLocalizations.of(context).translate('question feelings'),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            new Flexible(child: temp),
            continueB
          ]),
        ));
  }
}
