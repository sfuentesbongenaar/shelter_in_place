import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  HashMap answers = new HashMap<String, bool>();

  @override
  Widget build(BuildContext context) {
    final dayModel = Provider.of<Day>(context);

    List<String> activitities = ["tv", "read", "cook"];
    activitities
        .forEach((activity) => answers.putIfAbsent(activity, () => false));

    List<Widget> temp = activitities.map((String keyName) {
      return CheckboxListTile(
          title: Text(AppLocalizations.of(context).translate(keyName)),
          value: answers[keyName],
          onChanged: (value) {
            setState(() {
              answers.update(keyName, (e) => value);
            });
          },
          controlAffinity: ListTileControlAffinity.leading);
    }).toList();

    RaisedButton continueB = RaisedButton(
      child:
          Text(AppLocalizations.of(context).translate('continue button text')),
      onPressed: () {
        HashMap chosenActivities = answers;
        // Filter out all not chosen answers
        chosenActivities.removeWhere((k, v) => !v);
        // Save the answers of user in Day model
        dayModel.activities = chosenActivities.keys.toList();
        Navigator.pushNamed(context, 'third-question');
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
              AppLocalizations.of(context).translate('question activities'),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            new Flexible(child: Column(children: temp)),
            continueB
          ]),
        ));
  }
}
