import 'package:bsdealz/layouts/dialogs/main_dialog.dart';
import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/items/texts/SettingText.dart';
import 'package:bsdealz/layouts/items/texts/SubTitleText.dart';
import 'package:bsdealz/layouts/pages/main/cart_page.dart';
import 'package:bsdealz/layouts/pages/main/home_page.dart';
import 'package:bsdealz/network/models/APIAppVariables.dart';
import 'package:bsdealz/network/models/APICart.dart';
import 'package:bsdealz/network/models/APICartItem.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../main.dart';
import '../../../network/HttpAPI.dart';
import '../../../network/models/APIUser.dart';
import '../../../network/models/ApiAddress.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../../utils/sharedprefs.dart';
import '../../items/buttons/MiniButton.dart';
import '../../items/icons/AppIcon.dart';
import '../../items/lists/address_item.dart';
import '../../items/lists/cart_item.dart';
import '../../items/textboxes/CustomTextbox.dart';
import '../../items/texts/BaseText.dart';
import '../../items/texts/TitleText.dart';
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
              BackBar(height: 60,title: "Wish List",notificationsNumber: 0),
              Expanded(
                child:    Container(

                  child: ListView(
                    children: [
                      //  Container(height: 200,child: ListView( children: [Wrap(children:activeCampaginsWidgets!)])),
                      Wrap(children:  RefreshApp.of(context)!.wishListWidgets),
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
