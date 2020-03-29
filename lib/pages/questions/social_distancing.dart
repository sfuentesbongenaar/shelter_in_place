import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class SocialDistancing extends StatefulWidget {
  @override
  _SocialDistancingState createState() => _SocialDistancingState();
}

class _SocialDistancingState extends State<SocialDistancing> {
  @override
  Widget build(BuildContext context) {
    final dayModel = Provider.of<Day>(context);
    final String assetName = '-g-distanceGraphic.svg';

    return SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[],
            ),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100.0),
                SvgPicture.asset(assetName,
                    height: 180.0, semanticsLabel: 'Acme Logo'),
                SizedBox(height: 20.0),
                Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
                    child: Text(
                        AppLocalizations.of(context)
                            .translate('question social distancing'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ))),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  answerButton(context, 'yes', dayModel),
                  SizedBox(height: 20.0),
                  answerButton(context, 'no', dayModel)
                ]),
              ],
            ),
          ),
        ));
  }
}

SizedBox answerButton(BuildContext context, String keyname, Day dayModel) {
  return new SizedBox(
      width: 200.0,
      height: 60.0,
      child: RaisedButton(
        textColor: buttonBlue,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        color: buttonLightBlue,
        child: Text(AppLocalizations.of(context).translate(keyname),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
        onPressed: () {
          dayModel.socialDistance = false;
          Navigator.pushNamed(context, 'second-question');
        },
      ));
}
