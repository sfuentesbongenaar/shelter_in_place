import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/my_bottom_bar.dart';
import 'package:shelter_in_place/pages/questions/my_continue_button.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:shelter_in_place/pages/summary/single_day_summary.dart';

final List<dynamic> dates = <dynamic>[
  'Sunday, March 22',
  'Saturday, March 21',
  'Friday, March 20',
  'Thursday, March 19',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
];

class NewSummary extends StatefulWidget {
  @override
  _NewSummaryState createState() => _NewSummaryState();
}

class _NewSummaryState extends State<NewSummary> {
  CustomContinueButton continueButton = CustomContinueButton(
    onPressed: () {
      print('oh');
    },
  );

  @override
  Widget build(BuildContext context) {
    Day day1 = Day(
        id: "first",
        date: DateTime.now(),
        socialDistance: true,
        feelings: Constants().feelings.take(3).toList(),
        activities: Constants().activitities.take(3).toList(),
        note: 'Blabla');

    Day day2 = Day(
        id: "second",
        date: DateTime.now(),
        socialDistance: true,
        feelings: Constants().feelings.take(6).toList(),
        activities: Constants().activitities.take(2).toList(),
        note: 'This is the second day');

    return Scaffold(
        bottomNavigationBar: CustomBottomBar(
          continueButton: continueButton,
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[SingleDaySummary(day: day1), SingleDaySummary(day: day2)],
          ),
        ));
  }
}
