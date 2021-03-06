import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:shelter_in_place/pages/util/round_checkbox.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  HashMap answers = new HashMap<String, bool>();

  @override
  Widget build(BuildContext context) {
    List<String> activitities = Constants.activitities;
    activitities
        .forEach((activity) => answers.putIfAbsent(activity, () => false));

    List<Widget> activitiesBoxes = activitities.map((String keyName) {
      return Padding(
          padding: const EdgeInsets.all(15.0),
          child: LabeledCheckbox(
            label: AppLocalizations.of(context).translate(keyName),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: answers[keyName],
            onChanged: (bool newValue) {
              setState(() {
                answers.update(keyName, (e) => newValue);
              });
            },
          ));
    }).toList();

    return Center(
      child: Column(children: <Widget>[
        SizedBox(height: 20.0),
        Padding(
            padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
            child: Column(
              children: <Widget>[
                Text(
                    AppLocalizations.of(context)
                        .translate('question activities'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                SizedBox(height: 20.0),
                Text(AppLocalizations.of(context).translate('check all'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                    ))
              ],
            )),
        Expanded(child: ListView(children: activitiesBoxes))
      ]),
    );
  }
}
