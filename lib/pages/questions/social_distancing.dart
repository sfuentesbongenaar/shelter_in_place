import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

class SocialDistancing extends StatefulWidget {
  @override
  _SocialDistancingState createState() => _SocialDistancingState();
}

class _SocialDistancingState extends State<SocialDistancing> {

  @override
  Widget build(BuildContext context) {
    final dayModel = Provider.of<Day>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context).translate('question bar title')),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              AppLocalizations.of(context).translate(
                  'question social distancing'),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              child: Text(AppLocalizations.of(context).translate('yes')),
              onPressed: () {
                dayModel.socialDistance = true;
                Navigator.pushNamed(context, 'second-question');
              },
            ),
            RaisedButton(
              child: Text(AppLocalizations.of(context).translate('no')),
              onPressed: () {
                dayModel.socialDistance = false;
                Navigator.pushNamed(context, 'second-question');
              },
            )
          ],
        ),
      ),
    );
  }
}