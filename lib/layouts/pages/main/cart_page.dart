import 'dart:convert';

import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/items/texts/SettingText.dart';
import 'package:bsdealz/network/models/APIAppVariables.dart';
import 'package:bsdealz/network/models/APICart.dart';
import 'package:bsdealz/network/models/APICartItem.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../localization/language_constants.dart';
import '../../../main.dart';
import '../../../network/HttpAPI.dart';
import '../../../network/models/APIUser.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../../utils/sharedprefs.dart';
import '../../dialogs/web_dialog.dart';
import '../../items/buttons/BaseButton.dart';
import '../../items/buttons/MiniButton.dart';
import '../../items/icons/AppIcon.dart';
import '../../items/lists/campaign_item.dart';
import '../../items/lists/cart_item.dart';
import '../../items/lists/web/campaign_item_web.dart';
import '../../items/textboxes/CustomTextbox.dart';
import '../../items/texts/BaseText.dart';
import '../../items/texts/TitleText.dart';
import '../../items/tobars/back_bar.dart';
import 'CheckoutPage.dart';

class CartPage extends StatefulWidget {
  static bool donation = true;
  static bool usePoints = false;
  CartPage({
    Key? key,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ApiUser user = ApiUser(firstName: "", email: "");
  TitleText nametxt =
      TitleText(text: "Username", onPressed: () {}, clickable: false);

  bool donationOn = true;
  bool usePoints = false;
  bool FaceIdOn = false;
  bool emptyCart = false;
  void toggledonation(bool value) {
    if (donationOn == false) {
      CustomSharedPrefs().setV("donationOn", "true");
      setState(() {
        donationOn = true;
        CartPage.donation = true;
      });
      print('donationOn Button is ON');
    } else {
      CustomSharedPrefs().setV("donationOn", "false");
      setState(() {
        CartPage.donation = false;
        donationOn = false;
      });
      print('donationOn Button is OFF');
    }
  }

  void toggleUsePoints(bool value) {
    if (usePoints == false) {
      CustomSharedPrefs().setV("usePoints", "true");
      setState(() {
        CartPage.usePoints = true;
        usePoints = true;
      });
      print('usePoints Button is ON');
    } else {
      CustomSharedPrefs().setV("usePoints", "false");
      setState(() {
        CartPage.usePoints = false;
        usePoints = false;
      });
      print('usePoints Button is OFF');
    }
    EasyLoading.show();
    submitItems();

    //    EasyLoading.dismiss();

    //applyPromoCode();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CustomSharedPrefs().setV("donationOn", "true");
    CustomSharedPrefs().setV("usePoints", "false");
    CartPage.donation = true;
    RefreshApp.of(context)!.promoCode.controller.text = "";
    submitItems();
  }

  Widget promoCodeWidget = Container();
  Widget promoStatus = Container();
  applyPromoCode() {
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);
    return dio
        .get('showcart?promo_code=' +
            RefreshApp.of(context)!.promoCode.controller.text.toString() +
            '&use_points=${usePoints}')
        .then((value) {
      setState(() {
        ApiCart cart = ApiCart.fromJson(value.data['data']);
        RefreshApp.of(context)!.apiAppVariables.cart = cart;
      });
    });
  }

  checkPromoCode(BuildContext context) {
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);
    return dio.post('checkpromocode', data: {
      "promo_code": RefreshApp.of(context)!.promoCode.controller.text.toString()
    }).then((value) {
      setState(() {
        if (value.data['status'] == "success") {
          promoStatus = const Text(
            "valid",
            style: TextStyle(color: Colors.green),
          );
        } else {
          promoStatus = const Text(
            "Invalid",
            style: TextStyle(color: Colors.red),
          );
        }
      });
    });
  }

  submitItems() {
    print("hi all");
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);
    EasyLoading.show();
    // Object itemsJson=jsonEncode(RefreshApp.of(context)!.apiAppVariables.cart!.items!.map((ApiCartItemR) => ApiCartItemR.toJson()).toList());
    List<ApiCartItemR> m = [];
    // Object itemsJson=jsonEncode(RefreshApp.of(context)!.apiAppVariables.cart!.items!.map((ApiCartItemR) => ApiCartItemR.toJson()).toList());
    RefreshApp.of(context)!.apiAppVariables.cart?.items!.forEach((element) {
      ApiCartItemR c = ApiCartItemR(
          campaignId: element.campaignId, quantity: element.quantity);
      m.add(c);
      print('c:${c.toJson()}');
    });
    List<Map<String, dynamic>> itemsList =
        m.map((model) => model.toJson()).toList();
    Map<String, dynamic> data = {
      "use_points": usePoints,
      "promo_code":
          RefreshApp.of(context)!.promoCode.controller.text.toString(),
      "items": itemsList,
    };
    return dio.post('additemstocart', data: data).then((value) {
      if (value.data['status'] == 'success') {
        ApiCart cart = ApiCart.fromJson(value.data['data']);
        applyPromoCode();
        RefreshApp.of(context)!.apiAppVariables.cart = cart;
        MyApp.refreshApp(context);
      }

      EasyLoading.dismiss();
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget cartWidget = Container();
    List<Widget> cartItems = [Container()];

    // ApiCart cart=RefreshApp.of(context)!.apiAppVariables!.cart ?? ApiCart(items: []);
    print("---------------------------length=" +
        RefreshApp.of(context)!.apiAppVariables.cart!.items!.length.toString());
    if (RefreshApp.of(context)!.apiAppVariables.cart!.items!.length < 1) {
      cartWidget = ListView(
        children: [
          //TitleText(text: "My Cart", onPressed: (){}, clickable: false),
          Container(
            height: 200,
          ),
          AppIcon(
            icon: AppIcon.CART_PATH,
            size: 70,
            color: Colors.grey,
          ),
          Center(
            child: BaseText(
              color: Colors.grey,
              text: getTranslated(context, 'yourCart'),
              margin: 25,
              marginh: 25,
              fontSize: 20,
              onPressed: () {},
              fontWeight: FontWeight.normal,
              clickable: false,
            ),
          ),
          Container(
            height: 100,
          ),
          MainButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  RefreshApp.of(context)!.selectedIndex = 2;
                });
                MyApp.refreshApp(context);
              },
              text: getTranslated(context, 'startSh'),
              isActive: true),
        ],
      );
      return Scaffold(
          body: SafeArea(
              child: Container(
                  color: Colors.white,
                  child: Column(children: [
                    BackBar(
                        height: 50,
                        title: getTranslated(context, 'Mycart'),
                        notificationsNumber: 0),
                    Expanded(child: cartWidget),
                  ]))));
    } else {
      promoCodeWidget = Container(
        height: 25,
        margin: const EdgeInsets.only(left: 5, right: 5),
        alignment: Alignment.center,
        child: ListTile(
            tileColor: Colors.grey[100],
            title: Container(),
            trailing: SizedBox(
                height: 20,
                child: FooterText(
                    text:
                        "${RefreshApp.of(context)!.apiAppVariables.cart!.promoCodeDiscount}",
                    clickable: false,
                    onPressed: () {})),
            leading: Container(
                height: 20,
                child: FooterText(
                    text: getTranslated(context, 'promo'),
                    clickable: false,
                    onPressed: () {})),
            onTap: () {}),
      );
      cartItems.clear();
      RefreshApp.of(context)!.apiAppVariables.cart!.items!.forEach((element) {
        cartItems.add(
          CartItem(height: 140, width: 1, cartItem: element),
        );
      });
      cartWidget = ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,

        children: cartItems,
      );
    }

    ShapeBorder shapeBorder1 = RoundedRectangleBorder(
        // side: BorderSide(color: Colors.green, width: 0.5),
        borderRadius: BorderRadius.circular(22));
    Widget myWalletTile = Container();
    Widget pointsToSubtract = Container();
    if (usePoints) {
      myWalletTile = Container(
        height: 20,
        margin: EdgeInsets.only(left: 5, right: 5),
        alignment: Alignment.center,
        child: ListTile(
            tileColor: Colors.grey[100],
            title: Container(),
            trailing: Container(
                height: 20,
                child: FooterText(
                    text:
                        "${RefreshApp.of(context)!.apiAppVariables.cart!.pointsDiscount}",
                    clickable: false,
                    onPressed: () {})),
            leading: Container(
                height: 20,
                child: FooterText(
                    text: getTranslated(context, 'MyWallet'),
                    clickable: false,
                    onPressed: () {})),
            onTap: () {}),
      );

      String p = "...";
      if (RefreshApp.of(context)!.apiAppVariables.cart!.pointsToSubtract !=
          null) {
        p = RefreshApp.of(context)!
            .apiAppVariables
            .cart!
            .pointsToSubtract!
            .toString();
      }
      pointsToSubtract = Container(
        height: 20,
        margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
        alignment: Alignment.topLeft,
        child: Text(
          "*You will use ${p} points",
          style: const TextStyle(color: Colors.red, fontSize: 9),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              BackBar(height: 50, title: "My cart", notificationsNumber: 0),
              Expanded(
                child: ListView(
                  children: [
                    Wrap(
                      children: cartItems,
                    ),
                    SizedBox(
                      height: 550,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Card(
                              color: Color(0XFFF7F7F6),
                              shape: shapeBorder1,
                              elevation: 0,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                alignment: Alignment.center,
                                child: ListTile(
                                    title: SettingText(
                                        text: getTranslated(context, 'donate'),
                                        onPressed: () {},
                                        clickable: false),
                                    leading: Transform.scale(
                                        scale: 1.4,
                                        child: Switch(
                                          onChanged: toggledonation,
                                          value: donationOn,
                                          activeColor: Colors.white,
                                          activeTrackColor: Colors.lightGreen,
                                          inactiveThumbColor: Colors.white,
                                          inactiveTrackColor: Colors.black12,
                                        )),
                                    onTap: () {}),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Card(
                              elevation: 0,
                              color: Colors.grey[100],
                              shape: shapeBorder1,
                              child: Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                alignment: Alignment.center,
                                child: ListTile(
                                    title: SettingText(
                                        text: getTranslated(context, 'useMy'),
                                        onPressed: () {},
                                        clickable: false),
                                    leading: Transform.scale(
                                        scale: 1.4,
                                        child: Switch(
                                          onChanged: toggleUsePoints,
                                          value: usePoints,
                                          activeColor: Colors.white,
                                          activeTrackColor: Colors.lightGreen,
                                          inactiveThumbColor: Colors.white,
                                          inactiveTrackColor: Colors.black12,
                                        )),
                                    onTap: () {}),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Card(
                              elevation: 0,
                              color: Colors.grey[100],
                              shape: shapeBorder1,
                              child: Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(15),
                                        child: AppIcon(
                                            icon: AppIcon.PROMO_CODE_PATH,
                                            size: 25)),
                                    Expanded(
                                        child: Container(
                                            child: RefreshApp.of(context)!
                                                .promoCode)),
                                    Container(
                                      width: 100,
                                      margin:
                                          EdgeInsets.only(top: 0, bottom: 0),
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 90,
                                              height: 35,
                                              child: MiniButton(
                                                  text: getTranslated(
                                                      context, 'apply'),
                                                  onPressed: () {
                                                    checkPromoCode(context);
                                                    applyPromoCode();
                                                  },
                                                  isActive: true)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //       child:     ListTile(
                              //
                              //           title:  Container(width:260,child: RefreshApp.of(context)!.promoCode),
                              //           trailing:   Container(
                              //             width: 100,
                              //             margin: EdgeInsets.only(top: 0,bottom: 0),
                              //             alignment: Alignment.bottomCenter,
                              //                 child: Row(
                              //                   children: [
                              //
                              //                     Container(
                              //                       width: 100,
                              //                         child: MiniButton(text: "Apply",onPressed: (){
                              //                           checkPromoCode();
                              //                           applyPromoCode();
                              //
                              //                         },isActive: true)),
                              //                   ],
                              //                 ),),
                              //           leading:AppIcon(icon:AppIcon.PROMO_CODE_PATH,size: 25),
                              //       ),
                              //   ),
                            ),
                          ),
                          Container(
                            width: 200,
                            child: promoStatus,
                          ),
                          ExpansionTile(
                            // collapsedBackgroundColor: Theme.of(context).cardColor,
                            title: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 10, bottom: 5),
                                child: BaseText(
                                  color: Color(0Xff707070),
                                  text: getTranslated(context, 'summary'),
                                  margin: 25,
                                  marginh: 25,
                                  fontSize: 13,
                                  onPressed: () {},
                                  fontWeight: FontWeight.bold,
                                  clickable: false,
                                )),
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      top: 0, bottom: 5, right: 10, left: 10),
                                  height: 1,
                                  color: Color(0XFFD6D3D3)),
                              Container(
                                height: 20,
                                margin: EdgeInsets.only(left: 5, right: 5),
                                alignment: Alignment.center,
                                child: ListTile(
                                    tileColor: Colors.grey[100],
                                    title: Container(),
                                    trailing: Container(
                                        height: 20,
                                        child: FooterText(
                                            text:
                                                "${RefreshApp.of(context)!.apiAppVariables.cart!.total}",
                                            clickable: false,
                                            onPressed:
                                                () {})), //${RefreshApp.of(context)!.apiAppVariables.cart!.subtotal}
                                    leading: Container(
                                        height: 20,
                                        child: FooterText(
                                            text: getTranslated(context, 'sub'),
                                            clickable: false,
                                            onPressed: () {})),
                                    onTap: () {
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (BuildContext context) {
                                      //     //return ContactUsPage();
                                      //     return Container();
                                      //   },
                                      // );
                                    }),
                              ),

                              Container(
                                height: 20,
                                margin: EdgeInsets.only(left: 5, right: 5),
                                alignment: Alignment.center,
                                child: ListTile(
                                    tileColor: Colors.grey[100],
                                    title: Container(),
                                    trailing: Container(
                                        height: 20,
                                        child: FooterText(
                                            text: "-",
                                            clickable: false,
                                            onPressed: () {})),
                                    leading: Container(
                                        height: 20,
                                        child: FooterText(
                                            text: getTranslated(
                                                context, 'shopping'),
                                            clickable: false,
                                            onPressed: () {})),
                                    onTap: () {
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (BuildContext context) {
                                      //     //return ContactUsPage();
                                      //     return Container();
                                      //   },
                                      // );
                                    }),
                              ),
                              promoCodeWidget,
                              // Container(
                              //   height: 20,
                              //   margin: EdgeInsets.only(left: 5,right: 5),
                              //   alignment: Alignment.center,
                              //   child:     ListTile(
                              //       tileColor: Colors.grey[100],
                              //       title:  Container(),
                              //       trailing:  Container(  height: 20,child: FooterText(text: "${RefreshApp.of(context)!.apiAppVariables.cart!.tax}",clickable: false,onPressed: (){})),
                              //       leading:Container(  height: 20,child: FooterText(text: "VAT",clickable: false,onPressed: (){})),
                              //       onTap: () {
                              //
                              //       }),
                              // ),
                              myWalletTile,
                              Container(height: 40, child: pointsToSubtract),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 0, bottom: 1, right: 10, left: 10),
                                height: 1,
                                color: Color(0XFFD6D3D3),
                              ),
                              Container(
                                height: 20,
                                margin: EdgeInsets.only(
                                    left: 5, right: 5, bottom: 20),
                                alignment: Alignment.topCenter,
                                child: ListTile(
                                    tileColor: Colors.grey[100],
                                    title: Container(),
                                    trailing: Container(
                                        height: 20,
                                        child: FooterText(
                                            text:
                                                "${RefreshApp.of(context)!.apiAppVariables.cart!.total}",
                                            clickable: false,
                                            onPressed:
                                                () {})), // ${RefreshApp.of(context)!.apiHeaders.acceptCurrency}${RefreshApp.of(context)!.CartTotal} ${RefreshApp.of(context)!.apiAppVariables.cart!.total}
                                    leading: Container(
                                        height: 20,
                                        child: FooterText(
                                            text:
                                                getTranslated(context, 'total'),
                                            clickable: false,
                                            onPressed: () {})),
                                    onTap: () {}),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: BaseButton(
                              isfilled: true,
                              isActive: true,
                              iconColor: Colors.white,
                              color: Theme.of(context).primaryColor,
                              height: 55,
                              text: getTranslated(context, 'pay'),
                              icon: Icons.home,
                              textColor: HexColor(AppSettingTheme.getTheme(
                                context,
                                Config.MAIN_BUTTON_TEXT_COLOR_KEY,
                                Config.MAIN_BUTTON_TEXT_COLOR_VALUE,
                              )),
                              padding: 5,
                              iconpadding: 5,
                              margin: 0,
                              radius: 19,
                              fontSize: 16,
                              ovalpadding: 4,
                              onPressed: () {
                                if (kIsWeb) {
                                  WebDialog.showMyDialog(
                                      WebDialog(
                                        title: "",
                                        text: "Dismiss",
                                        descriptions: "",
                                        customWidget: CheckoutPage(),
                                      ),
                                      context);
                                } else {
                                  submitItems();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CheckoutPage()));
                                }
                              },
                              width: 350,
                              startColor: HexColor(AppSettingTheme.getTheme(
                                context,
                                Config.MAIN_BUTTON_START_COLOR_KEY,
                                Config.MAIN_BUTTON_START_COLOR_VALUE,
                              )),
                              endColor: HexColor(AppSettingTheme.getTheme(
                                context,
                                Config.MAIN_BUTTON_END_COLOR_KEY,
                                Config.MAIN_BUTTON_END_COLOR_VALUE,
                              )),
                              isGradient: true,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
