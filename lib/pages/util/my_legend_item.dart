import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';

class LegendElement extends StatelessWidget {
  LegendElement({@required this.keyName});

  final String keyName;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: <Widget>[
      Container(
        height: 15,
        width: 15,
        margin: EdgeInsets.fromLTRB(30,0,0,0),
        decoration: BoxDecoration(
            color: Constants().colorsFeelings()[keyName],
            shape: BoxShape.circle),
      ),
      Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(AppLocalizations.of(context).translate(keyName),
              style: new TextStyle(
                fontSize: 11.0,
              )))
    ]));
  }
}
