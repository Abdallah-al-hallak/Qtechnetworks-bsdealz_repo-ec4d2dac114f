import 'package:bsdealz/layouts/dialogs/main_dialog.dart';
import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/items/texts/SettingText.dart';
import 'package:bsdealz/layouts/items/texts/SubTitleText.dart';
import 'package:bsdealz/layouts/items/tobars/close_bar.dart';
import 'package:bsdealz/layouts/pages/fragments/MainFragment.dart';
import 'package:bsdealz/layouts/pages/main/cart_page.dart';
import 'package:bsdealz/layouts/pages/main/home_page.dart';
import 'package:bsdealz/network/models/APIAppVariables.dart';
import 'package:bsdealz/network/models/APICart.dart';
import 'package:bsdealz/network/models/APICartItem.dart';
import 'package:bsdealz/network/models/APIOrder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../localization/language_constants.dart';
import '../../../main.dart';
import '../../../network/HttpAPI.dart';
import '../../../network/models/APIUser.dart';
import '../../../network/models/ApiAddress.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../../utils/sharedprefs.dart';
import '../../dialogs/web_dialog.dart';
import '../../items/buttons/BaseButton.dart';
import '../../items/buttons/MiniButton.dart';
import '../../items/icons/AppIcon.dart';
import '../../items/lists/address_item.dart';
import '../../items/lists/cart_item.dart';
import '../../items/textboxes/CustomTextbox.dart';
import '../../items/texts/BaseText.dart';
import '../../items/texts/TitleText.dart';
import '../../items/tobars/back_bar.dart';
import 'AddAddress.dart';

class InvoicePage extends StatefulWidget {
  static ApiAddress selectedAddress = new ApiAddress();
  static int? selectedId = -1;
  InvoicePage({
    Key? key,
  }) : super(key: key);

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  bool donationOn = false;
  bool usePoints = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CustomSharedPrefs().getV("donationOn").then((value) {
      setState(() {
        if (value == "true") {
          donationOn = true;
        } else {
          donationOn = false;
        }
      });
    });
    CustomSharedPrefs().getV("usePoints").then((value) {
      setState(() {
        if (value == "true") {
          usePoints = true;
        } else {
          usePoints = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget promoCodeWidget = Container(
      height: 25,
      margin: EdgeInsets.only(left: 5, right: 5),
      alignment: Alignment.center,
      child: ListTile(
          tileColor: Colors.grey[100],
          title: Container(),
          trailing: Container(
              height: 20,
              child: FooterText(
                  text:
                      "${RefreshApp.of(context)!.OrderDetails!.promoCodeDiscount}",
                  clickable: false,
                  onPressed: () {})),
          leading: Container(
              height: 20,
              child: FooterText(
                  text: "Promo code Discount",
                  clickable: false,
                  onPressed: () {})),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                //return ContactUsPage();
                return Container();
              },
            );
          }),
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              CloseBar(
                height: 60,
              ),
              TitleText(text: "Thank You", onPressed: () {}, clickable: false),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 450,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              BaseText(
                                color: Color(0Xff707070),
                                text:
                                    "Order number:${RefreshApp.of(context)!.OrderDetails.id}",
                                margin: 25,
                                marginh: 25,
                                fontSize: 11,
                                onPressed: () {},
                                fontWeight: FontWeight.bold,
                                clickable: false,
                              ),
                              BaseText(
                                color: Color(0Xff707070),
                                text:
                                    "   purchased on:${RefreshApp.of(context)!.OrderDetails.createdAt}",
                                margin: 25,
                                marginh: 10,
                                fontSize: 11,
                                onPressed: () {},
                                fontWeight: FontWeight.bold,
                                clickable: false,
                              ),
                            ],
                          ),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10, bottom: 5),
                              child: BaseText(
                                color: Color(0Xff707070),
                                text: getTranslated(context, 'invoice'),
                                margin: 25,
                                marginh: 25,
                                fontSize: 13,
                                onPressed: () {},
                                fontWeight: FontWeight.bold,
                                clickable: false,
                              )),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: 0, bottom: 5, right: 10, left: 10),
                            height: 1,
                            color: Colors.grey[300],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: RefreshApp.of(context)!
                                  .OrderDetails
                                  .orderItems!
                                  .length,
                              itemBuilder: (context, index) {
                                return Container(
                                    height: 30,
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                              height: 30,
                                              child: BaseText(
                                                text:
                                                    "${RefreshApp.of(context)!.OrderDetails.orderItems!.elementAt(index).campaign!.products!.first.productName}",
                                                margin: 0,
                                                marginh: 0,
                                                fontSize: 9,
                                                onPressed: () {},
                                                fontWeight: FontWeight.bold,
                                                clickable: false,
                                                color: Colors.black,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                              height: 30,
                                              child: BaseText(
                                                text:
                                                    "${RefreshApp.of(context)!.apiHeaders.acceptCurrency}${RefreshApp.of(context)!.OrderDetails.orderItems!.elementAt(index).campaign!.price}X${RefreshApp.of(context)!.OrderDetails.orderItems!.elementAt(index).quantity}",
                                                margin: 0,
                                                marginh: 0,
                                                fontSize: 9,
                                                onPressed: () {},
                                                fontWeight: FontWeight.bold,
                                                clickable: false,
                                                color: Colors.black,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                              height: 30,
                                              child: BaseText(
                                                text:
                                                    "${RefreshApp.of(context)!.apiHeaders.acceptCurrency}${RefreshApp.of(context)!.OrderDetails.orderItems!.elementAt(index).total}",
                                                margin: 0,
                                                marginh: 0,
                                                fontSize: 9,
                                                onPressed: () {},
                                                fontWeight: FontWeight.bold,
                                                clickable: false,
                                                color: Colors.black,
                                              )),
                                        ),
                                      ],
                                    ));
                              },
                            ),
                          ),
                          Container(
                            height: 30,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            alignment: Alignment.center,
                            child: ListTile(
                                tileColor: Colors.grey[100],
                                title: Container(),
                                trailing: Container(
                                    height: 30,
                                    child: FooterText(
                                        text:
                                            "${RefreshApp.of(context)!.OrderDetails!.subtotal}",
                                        clickable: false,
                                        onPressed: () {})),
                                leading: Container(
                                    height: 30,
                                    child: FooterText(
                                        text: "SubTotal",
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
                                        text: "Shipping fees",
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
                          //   height: 30,
                          //   margin: EdgeInsets.only(left: 5,right: 5),
                          //   alignment: Alignment.center,
                          //   child:     ListTile(
                          //       tileColor: Colors.grey[100],
                          //       title:  Container(),
                          //       trailing:  Container(  height: 20,child: FooterText(text: "${RefreshApp.of(context)!.apiAppVariables.cart!.tax}",clickable: false,onPressed: (){})),
                          //       leading:Container(  height: 20,child: FooterText(text: "Tax",clickable: false,onPressed: (){})),
                          //       onTap: () {
                          //
                          //       }),
                          //  ),

                          Column(
                            children: [
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
                                                "${RefreshApp.of(context)!.OrderDetails!.total}",
                                            clickable: false,
                                            onPressed: () {})),
                                    leading: Container(
                                        height: 20,
                                        child: FooterText(
                                            text: "Total Amount",
                                            clickable: false,
                                            onPressed: () {})),
                                    onTap: () {}),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: BaseButton(
                                  isfilled: true,
                                  isActive: true,
                                  iconColor: Colors.white,
                                  color: Theme.of(context).primaryColor,
                                  height: 40,
                                  text: getTranslated(context, 'Con'),
                                  icon: Icons.home,
                                  textColor: HexColor(AppSettingTheme.getTheme(
                                    context,
                                    Config.MAIN_BUTTON_TEXT_COLOR_KEY,
                                    Config.MAIN_BUTTON_TEXT_COLOR_VALUE,
                                  )),
                                  padding: 5,
                                  iconpadding: 5,
                                  margin: 5,
                                  radius: 19,
                                  fontSize: 14,
                                  ovalpadding: 4,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      RefreshApp.of(context)!.scrollDown();
                                      RefreshApp.of(context)!.selectedIndex = 2;
                                    });
                                    MyApp.refreshApp(context);
                                  },
                                  width: 150,
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
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: BaseButton(
                                  isfilled: true,
                                  isActive: true,
                                  iconColor: Colors.white,
                                  color: Theme.of(context).primaryColor,
                                  height: 40,
                                  text: getTranslated(context, 'view'),
                                  icon: Icons.home,
                                  textColor: HexColor(AppSettingTheme.getTheme(
                                    context,
                                    Config.MAIN_BUTTON_TEXT_COLOR_KEY,
                                    Config.MAIN_BUTTON_TEXT_COLOR_VALUE,
                                  )),
                                  padding: 5,
                                  iconpadding: 5,
                                  margin: 5,
                                  radius: 19,
                                  fontSize: 14,
                                  ovalpadding: 4,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      RefreshApp.of(context)!.scrollDown();
                                      RefreshApp.of(context)!.selectedIndex = 3;
                                    });
                                    MyApp.refreshApp(context);
                                  },
                                  width: 150,
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
                              ),
                            ],
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
