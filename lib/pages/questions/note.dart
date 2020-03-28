import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/services/days_service.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

class NoteForDay extends StatefulWidget {
  @override
  _NoteForDayState createState() => _NoteForDayState();
}

class _NoteForDayState extends State<NoteForDay> {
  @override
  Widget build(BuildContext context) {
    final dayModel = Provider.of<Day>(context);
    final dayService = Provider.of<DaysService>(context);

    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context).translate('question bar title')),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              AppLocalizations.of(context)
                  .translate('note today'),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: AppLocalizations.of(context)
                  .translate('note today hint')),
              onChanged: (text) {
                dayModel.note = text;
              },
            ),
            RaisedButton(
              child: Text(AppLocalizations.of(context)
                  .translate('continue button text')),
              onPressed: () async {
                dayModel.date = DateTime.now();
                print(dayModel.date);
                print(dayModel.date.toUtc());
                print(dayModel.date.toLocal());
                print(dayModel.date.toUtc().toLocal());
                await dayService.addDocument(dayModel.toJson());
                Navigator.pushNamed(context, 'overview');
              },
            )
          ],
        ),
      ),
    );
  }
}
