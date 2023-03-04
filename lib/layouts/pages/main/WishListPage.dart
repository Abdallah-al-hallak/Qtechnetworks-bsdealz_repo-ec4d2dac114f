import 'package:bsdealz/localization/language_constants.dart';
import 'package:flutter/material.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../items/tobars/back_bar.dart';

class WishListPage extends StatefulWidget {
  WishListPage({
    Key? key,
  }) : super(key: key);

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              BackBar(
                  height: 60,
                  title: getTranslated(context, 'Wish'),
                  notificationsNumber: 0),
              Expanded(
                child: SizedBox(
                  child: ListView(
                    children: [
                      //  Container(height: 200,child: ListView( children: [Wrap(children:activeCampaginsWidgets!)])),
                      Wrap(children: RefreshApp.of(context)!.wishListWidgets),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
