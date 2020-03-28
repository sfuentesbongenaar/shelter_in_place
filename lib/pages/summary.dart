import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('summary bar title')),
      ),
      body: Center(
        
      )
    )
  }
}
