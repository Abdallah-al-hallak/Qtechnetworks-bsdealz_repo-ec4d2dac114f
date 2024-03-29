import 'package:bsdealz/layouts/dialogs/main_dialog.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/pages/main/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../localization/language_constants.dart';
import '../../../network/HttpAPI.dart';
import '../../../network/models/APIOrder.dart';
import '../../../network/models/ApiAddress.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../../utils/sharedprefs.dart';
import '../../dialogs/web_dialog.dart';
import '../../items/buttons/BaseButton.dart';
import '../../items/lists/address_item.dart';
import '../../items/texts/BaseText.dart';
import '../../items/tobars/back_bar.dart';
import 'AddAddress.dart';
import 'Invoice.dart';

class CheckoutPage extends StatefulWidget {
  static ApiAddress selectedAddress = ApiAddress(
      address: "",
      apartmentNumber: "",
      state: "",
      country: "",
      city: "",
      building: "",
      street: "");
  static int? selectedId = -1;
  CheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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

  checkout() {
    EasyLoading.show();
    String orderType = "O";
    if (donationOn) {
      orderType = "D";
    }
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);
    return dio.post('placeorder', data: {
      "payment_method": "cash",
      "address":
          "${CheckoutPage.selectedAddress.state} | ${CheckoutPage.selectedAddress.city} | ${CheckoutPage.selectedAddress.street} | ${CheckoutPage.selectedAddress.building} - ${CheckoutPage.selectedAddress.address}",
      "promo_code":
          RefreshApp.of(context)!.promoCode.controller.text.toString(),
      "order_type": orderType,
      "address_id": CheckoutPage.selectedId
    }).then((value) {
      if (value.data['status'] == 'success') {
        //    List<ApiAddress> addresses= List<ApiAddress>.from(value.data['data'].map((model)=> ApiAddress.fromJson(model)));
        RefreshApp.of(context)!.OrderDetails =
            ApiOrder.fromJson(value.data["data"]);

        setState(() {
          RefreshApp.of(context)!.localCart.items!.clear();
          RefreshApp.of(context)!
              .fetchServerData("app-customer", context)!
              .then((value2) {
            EasyLoading.dismiss();
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InvoicePage()));
            MainDialog.showMyDialog(
                MainDialog(
                    title: getTranslated(context, 'order'),
                    descriptions: getTranslated(context, 'startSh'),
                    text: "",
                    type: DialogType.SUCCESS,
                    customWidget: Container()),
                context);
          });
        });
      } else {
        EasyLoading.dismiss();
        MainDialog.showMyDialog(
            MainDialog(
                title: getTranslated(context, 'check'),
                descriptions: getTranslated(context, 'retry'),
                text: "",
                type: DialogType.ERROR,
                customWidget: Container()),
            context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RefreshApp.of(context)!.addressesWidgets.clear();
    int i = 0;
    RefreshApp.of(context)!.apiAppVariables.addresses!.forEach((element) {
      if (i == 0 && CheckoutPage.selectedId == -1) {
        CheckoutPage.selectedAddress = element;
        CheckoutPage.selectedId = element.id;
        RefreshApp.of(context)!.addressesWidgets.add(AddressItem(
              addressItem: element,
              height: 120,
              width: 1,
              groupValue: CheckoutPage.selectedId,
              value: element.id,
              onChanged: (int? newValue) {
                setState(() {
                  CheckoutPage.selectedId = newValue;
                  print("selected Address=" + element.id.toString());
                });
              },
            ));
      } else {
        RefreshApp.of(context)!.addressesWidgets.add(AddressItem(
              addressItem: element,
              height: 120,
              width: 1,
              groupValue: CheckoutPage.selectedId,
              value: element.id,
              onChanged: (int? newValue) {
                setState(() {
                  CheckoutPage.selectedAddress = element;
                  print("selected Address=" + element.id.toString());
                  CheckoutPage.selectedId = newValue;
                });
              },
            ));
      }
      i++;
    });
    Widget promoCodeWidget = Container(
      height: 25,
      margin: const EdgeInsets.only(left: 5, right: 5),
      alignment: Alignment.center,
      child: ListTile(
          tileColor: Colors.grey[100],
          title: Container(),
          trailing: Container(
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
    ShapeBorder shapeBorder1 = RoundedRectangleBorder(
        // side: BorderSide(color: Colors.green, width: 0.5),
        borderRadius: BorderRadius.circular(19));

    Widget addressWidget = Container();
    Widget newAddress = Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 0, bottom: 5, right: 20, left: 20),
      child: BaseText(
        color: Color(0XFF707070),
        margin: 0,
        text: getTranslated(context, 'address'),
        marginh: 35,
        fontSize: 10,
        onPressed: () {
          if (kIsWeb) {
            WebDialog.showMyDialog(
                WebDialog(
                  title: "",
                  text: getTranslated(context, 'Dis'),
                  descriptions: "",
                  customWidget: AddAddress(),
                ),
                context);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddAddress()));
          }
        },
        clickable: true,
        fontWeight: FontWeight.normal,
      ),
    );
    if (!donationOn) {
      List<Widget> addressLayiout = RefreshApp.of(context)!.addressesWidgets;
      addressLayiout.add(newAddress);
      addressWidget = Wrap(
        children: addressLayiout,
      );
    }
    Widget myWalletTile = Container();
    Widget pointsToSubtract = Container();
    if (usePoints) {
      myWalletTile = Container(
        height: 20,
        margin: const EdgeInsets.only(left: 5, right: 5),
        alignment: Alignment.center,
        child: ListTile(
            tileColor: Colors.grey[100],
            title: Container(),
            trailing: SizedBox(
                height: 20,
                child: FooterText(
                    text:
                        "${RefreshApp.of(context)!.apiAppVariables.cart!.pointsDiscount}",
                    clickable: false,
                    onPressed: () {})),
            leading: SizedBox(
                height: 20,
                child: FooterText(
                    text: getTranslated(context, 'MyWallet'),
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

      pointsToSubtract = Container(
        height: 20,
        margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
        alignment: Alignment.topLeft,
        child: Text(
          "*You will use ${RefreshApp.of(context)!.apiAppVariables.cart!.pointsToSubtract} points",
          style: const TextStyle(color: Colors.red, fontSize: 9),
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              BackBar(height: 60, title: " Checkout", notificationsNumber: 0),
              Expanded(
                child: ListView(
                  children: [
                    addressWidget,
                    Container(
                      height: 450,
                      child: Column(
                        children: [
                          Container(
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
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: 0, bottom: 5, right: 10, left: 10),
                            height: 1,
                            color: Colors.grey[300],
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
                                        text:
                                            "${RefreshApp.of(context)!.apiAppVariables.cart!.subtotal}",
                                        clickable: false,
                                        onPressed: () {})),
                                leading: Container(
                                    height: 20,
                                    child: FooterText(
                                        text:
                                            getTranslated(context, 'subtotal'),
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
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            alignment: Alignment.center,
                            child: ListTile(
                                tileColor: Colors.grey[100],
                                title: Container(),
                                trailing: SizedBox(
                                    height: 20,
                                    child: FooterText(
                                        text: "-",
                                        clickable: false,
                                        onPressed: () {})),
                                leading: Container(
                                    height: 20,
                                    child: FooterText(
                                        text:
                                            getTranslated(context, 'shipping'),
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

                          SizedBox(height: 40, child: pointsToSubtract),

                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 0, bottom: 1, right: 10, left: 10),
                                height: 1,
                                color: Colors.grey[300],
                              ),
                              Container(
                                height: 20,
                                margin: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 20),
                                alignment: Alignment.topCenter,
                                child: ListTile(
                                    tileColor: Colors.grey[100],
                                    title: Container(),
                                    trailing: SizedBox(
                                        height: 20,
                                        child: FooterText(
                                            text:
                                                "${RefreshApp.of(context)!.apiAppVariables.cart!.total}",
                                            clickable: false,
                                            onPressed: () {})),
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
                              text: getTranslated(context, 'checkO'),
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
                                if (CheckoutPage.selectedAddress.state !=
                                        null &&
                                    CheckoutPage.selectedAddress.state != "" &&
                                    donationOn == false) {
                                  checkout();
                                } else {
                                  if (donationOn) {
                                    checkout();
                                  } else {
                                    MainDialog.showMyDialog(
                                        MainDialog(
                                            title: getTranslated(
                                                context, 'cantComplete'),
                                            descriptions: getTranslated(
                                                context, 'address'),
                                            text: "",
                                            type: DialogType.WARNING,
                                            customWidget: Container()),
                                        context);
                                  }
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
