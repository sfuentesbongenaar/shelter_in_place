import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/util/blue_button.dart';
import 'package:shelter_in_place/pages/util/white_forward_button.dart';

class SettingsOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 50, 15, 0),
        child: Column(children: [
      Row(
        children: <Widget>[
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: WhiteForwardButton(
                    titleKeyName: 'User settings',
                    onPressed: null,
                  )))
        ],
      ),
      Row(children: <Widget>[
        Expanded(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: WhiteForwardButton(
                  titleKeyName: 'Notification settings',
                  onPressed: null,
                )))
      ]),
          Row(children: <Widget>[
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: BlueButton(
                      titleKeyName: 'Logout',
                      onPressed: null,
                    )))
          ])
    ]));
  }
}
