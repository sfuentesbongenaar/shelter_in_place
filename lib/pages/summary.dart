import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

final List<Object> dates = <Object>[
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
    {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
    {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 22',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 24',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
    {
    'date': 'Sunday, March 24',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 24',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 24',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 24',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
  {
    'date': 'Sunday, March 24',
    'activities': ['read a book', 'took a nap', 'cooked'],
    'emotions': ['calm', 'anxious', 'distracted'],
    'note': 'Today was kinda hard but I made it!'
  },
];

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text(AppLocalizations.of(context).translate('summary bar title')),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            Text(AppLocalizations.of(context).translate('summary header'),
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 50.0),
            ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: const EdgeInsets.all(8),
                      height: 100,
                      color: Colors.blue[100],
                      child: Center(child: Text(index.toString())));
                },
                )
          ],
        )));
  }
}
