import 'package:bsdealz/layouts/items/tobars/back_bar.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:flutter/material.dart';

class LevelsPage extends StatefulWidget {
  @override
  _LevelsPageState createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      //    fetchCampaigns();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: SafeArea(
            child: Container(
                color: Colors.white,
                child: Container(
                  child: Column(
                    children: [
                      BackBar(
                        height: 60,
                        title: getTranslated(context, 'Membership'),
                        notificationsNumber: 0,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Wrap(
                                children:
                                    RefreshApp.of(context)!.levelsWidgets),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
