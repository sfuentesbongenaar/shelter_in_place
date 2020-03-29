import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';

import 'my_overview_chart.dart';

class MyOverviewChart extends StatefulWidget {
  @override
  _MyOverviewChartState createState() => _MyOverviewChartState();
}

class _MyOverviewChartState extends State<MyOverviewChart> {
  @override
  Widget build(BuildContext context) {
    final dayModel = Provider.of<Day>(context);

    return SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
            bottomNavigationBar: BottomAppBar(
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            body: Container(
                margin: const EdgeInsets.all(4),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
                        child: Text(
                            AppLocalizations.of(context)
                                .translate('streak text'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ))),
                    Text('22 days',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        )),
                    Card(
                        margin: EdgeInsets.fromLTRB(30, 20, 30, 40),
                        child: Column(
                          children: <Widget>[
                            SingleOverviewChart(
                              titleKeyname: 'Your feelings',
                              colors: Constants().colorsFeelings(),
                            ),
                            SingleOverviewChart(
                                titleKeyname: 'Your activities',
                                colors: Constants().colorsActivitities())
                          ],
                        )),
                  ],
                ))));
  }
}
