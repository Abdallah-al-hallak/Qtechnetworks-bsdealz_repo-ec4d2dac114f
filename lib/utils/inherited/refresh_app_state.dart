import 'dart:developer';
import 'dart:io';
import 'package:bsdealz/layouts/items/lists/product_item.dart';
import 'package:bsdealz/network/models/APICampaign.dart';
import 'package:bsdealz/network/models/APICart.dart';
import 'package:bsdealz/network/models/APIUser.dart';

import 'package:currency_picker/currency_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../layouts/items/layouts/Banner_layout.dart';
import '../../layouts/items/layouts/campaigns_mini_layout.dart';
import '../../layouts/items/layouts/sold_out_layout.dart';
import '../../layouts/items/layouts/winners_layout.dart';
import '../../layouts/items/lists/address_item.dart';
import '../../layouts/items/lists/campaign_item.dart';
import '../../layouts/items/lists/coupon_item.dart';
import '../../layouts/items/lists/draw_item.dart';
import '../../layouts/items/lists/level_item.dart';
import '../../layouts/items/lists/notification_item.dart';
import '../../layouts/items/lists/web/campaign_item_web.dart';
import '../../layouts/items/lists/winner_item.dart';

import '../../layouts/items/textboxes/PromoCodeEditText.dart';
import '../../network/HttpAPI.dart';
import '../../network/models/APIAppVariables.dart';
import '../../network/models/APIHeaders.dart';
import '../../network/models/APIOrder.dart';

class RefreshApp extends StatefulWidget {
  final Widget child;
  static _RefreshAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_RefreshAppState>();
  const RefreshApp({Key? key, required this.child}) : super(key: key);
  @override
  _RefreshAppState createState() => _RefreshAppState();
}

class _RefreshAppState extends State<RefreshApp> {
  late Currency currency = Currency(
      code: "AED",
      name: "UNITED ARAB DIRHAM",
      symbol: "AED",
      flag: "AED",
      number: 1,
      decimalDigits: 2,
      namePlural: "AED",
      symbolOnLeft: true,
      decimalSeparator: '.',
      thousandsSeparator: ",",
      spaceBetweenAmountAndSymbol: true);

  String OTPCode = '';
  String name = '';
  String password = '';
  String phone = '';
  Widget bodyWidget = Container();
  ApiUser currentUser = ApiUser(
      id: -1,
      firstName: "",
      email: "",
      createdAt: '',
      updatedAt: '',
      phone: "",
      fcmToken: "",
      levelId: 1);
  Color success = Color(0XFF38B259);
  Color danger = Color(0XFFFF5C52);
  Color info = Color(0XFF13AAE5);
  Color warning = Color(0XFFDB8F00);
///////// register Data
  bool isLogin = false;
  String nickName = '';
  String nameAR = '';
  String nameEN = '';
  String birthDate = '';
  String nationalityId = '';
  String branchId = '';
  String gender = '';
  String countryOfResidence = '';
  String email = '';
  String expirationDate = '';
  String rPassword = '';
  // Widget activeServiceFragment=ForeignExchangeFragment();

  Color bgColor = Colors.white;
  int index = 0;
  Color textColor = Colors.grey;
  String icon = "assets/images/foreign_exchange_active.png";
  String title = "Foreign\nExchange";
  ShapeBorder border = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      side: BorderSide(
        width: 0,
      ));
  ApiAppVariables apiAppVariables = ApiAppVariables();
  ApiHeaders apiHeaders =
      ApiHeaders(token: "", acceptCurrency: "USD", acceptLanguage: "en");
  Widget closingSoonCampaignLayout = Container();
  List<Widget> activeCampaignWidgets = [];
  Widget soldoutLayout = Container();
  List<Widget> upcomigDrawsWidgets = [];
  List<Widget> winnersWidgets = [];
  List<Widget> couponWidgets = [];
  List<Widget> productsWidgets = [];
  List<Widget> notificationsWidgets = [];
  List<Widget> addressesWidgets = [];
  List<Widget> wishListWidgets = [];
  List<Widget> levelsWidgets = [];
  int selectedIndex = 2;
  double CartTotal = 0.00;
  double CartSubTotal = 0.00;
  ApiCart localCart = ApiCart(subtotal: 0.00, total: 0.00, items: []);
  Widget winnersLayout = Container();
  Widget bannersLayout = Container();
  Widget downArrow = Container();
  Color primaryColor = Color(0XFF174785);
  Color accentColor = Colors.white;
  Color cardColor = Color(0XFFE8EBF0);
  bool isNotificationSeen = true;
  ApiOrder OrderDetails = ApiOrder();
  ScrollController main_fragment_scroll_controller = ScrollController();

// This is what you're looking for!
  void scrollDown() {
    main_fragment_scroll_controller.animateTo(
      main_fragment_scroll_controller.position.minScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  PromoCodeEditText promoCode = PromoCodeEditText(
      text: "Promo code",
      margin: 0,
      marginh: 0,
      focusNode: FocusNode(),
      isValidationDialog: true,
      controller: TextEditingController(),
      maxLines: 1,
      width: 305,
      height: 35);
  resetList(int index) {
    print("cleared!!!");
  }

  Future? fetchServerData(String url, BuildContext mcontext) async {
    //  EasyLoading.show();

    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(mcontext);
    return dio.get(url).then((value) {
      if (url.contains("app-guest")) {
        RefreshApp.of(mcontext)!.isLogin = false;
      } else {
        RefreshApp.of(mcontext)!.isLogin = true;
      }
      //   EasyLoading.dismiss();
      log("apiAppVariables splash-------------");
      //  log("apiAppVariables splash-------------"+value.data['data']['user'].toString());
      //  RefreshApp.of(mcontext)!.apiAppVariables
      RefreshApp.of(mcontext)!.apiAppVariables =
          ApiAppVariables.fromJson(value.data['data']);
      //  log("apiAppVariables splash2 -------------");
      //  log("apiAppVariables splash m-------------"+apiAppVariables.toJson().toString());
      // RefreshApp.of(context)!.campaigns=apiAppVariables.;
      RefreshApp.of(mcontext)!.closingSoonCampaignLayout = Container(
          height: 250,
          child: MiniCampaignLayout(
              height: 210,
              Campaigns: RefreshApp.of(mcontext)!
                  .apiAppVariables
                  .closingSoonCampaigns!));
      //  campagins!.clear();

      if (RefreshApp.of(mcontext)!.activeCampaignWidgets.isNotEmpty) {
        RefreshApp.of(mcontext)!.activeCampaignWidgets.clear();
      }
      RefreshApp.of(mcontext)!
          .apiAppVariables
          .activeCampaigns!
          .forEach((element) {
        if (kIsWeb) {
          RefreshApp.of(mcontext)!.activeCampaignWidgets.add(CampaignItemWeb(
                mycampagin: element,
                height: 350,
                width: 1,
              ));
        } else {
          RefreshApp.of(mcontext)!.activeCampaignWidgets.add(CampaignItem(
                mycampagin: element,
                height: 555,
                width: 1,
              ));
        }
      });
      if (RefreshApp.of(mcontext)!.levelsWidgets.isNotEmpty) {
        RefreshApp.of(mcontext)!.levelsWidgets.clear();
      }
      RefreshApp.of(mcontext)!.apiAppVariables.levels!.forEach((element) {
        RefreshApp.of(mcontext)!.levelsWidgets.add(MembershipItem(
              level: element,
              height: 165,
              width: 1,
            ));
      });

      //  campagins!.clear();

      RefreshApp.of(mcontext)!.bannersLayout = BannerLayout(
        isRadius: false,
        height: 350,
        banners: RefreshApp.of(mcontext)!.apiAppVariables.banners!,
      );
      RefreshApp.of(mcontext)!.soldoutLayout = Container(
          height: 300,
          child: SoldOutLayout(
              height: 250,
              Campaigns:
                  RefreshApp.of(mcontext)!.apiAppVariables.closedCampaigns!));
      RefreshApp.of(mcontext)!.winnersLayout = Container(
          height: 300,
          child: WinnersLayout(
              height: 250,
              Draws: RefreshApp.of(mcontext)!.apiAppVariables.winners!));
      if (RefreshApp.of(mcontext)!.upcomigDrawsWidgets.isNotEmpty) {
        RefreshApp.of(mcontext)!.upcomigDrawsWidgets.clear();
      }
      RefreshApp.of(mcontext)!
          .apiAppVariables
          .upcomingDraws!
          .forEach((element) {
        RefreshApp.of(mcontext)!.upcomigDrawsWidgets.add(DrawItem(
              drawItem: element,
              height: 300,
              width: 1,
            ));
      });
      if (RefreshApp.of(mcontext)!.winnersWidgets.isNotEmpty) {
        RefreshApp.of(mcontext)!.winnersWidgets.clear();
      }
      RefreshApp.of(mcontext)!.apiAppVariables.winners!.forEach((element) {
        RefreshApp.of(mcontext)!.winnersWidgets.add(WinnerItem(
              winnerItem: element,
              height: 340,
              width: 1,
            ));
      });
      if (RefreshApp.of(mcontext)!.productsWidgets.isNotEmpty) {
        RefreshApp.of(mcontext)!.productsWidgets.clear();
      }
      //localCart=   RefreshApp.of(mcontext)!.apiAppVariables!.cart!;
      RefreshApp.of(mcontext)!.apiAppVariables.products!.forEach((element) {
        RefreshApp.of(mcontext)!.productsWidgets.add(ProductItem(
              product: element,
              height: 100,
              width: 1,
            ));
      });
      if (RefreshApp.of(mcontext)!.couponWidgets.isNotEmpty) {
        RefreshApp.of(mcontext)!.couponWidgets.clear();
      }
      List<int> campaignIdBlack = [];
      RefreshApp.of(mcontext)!.apiAppVariables.userCoupons!.forEach((element) {
        if (!campaignIdBlack.contains(element.campaign!.id)) {
          campaignIdBlack.add(element.campaign!.id!);
          RefreshApp.of(mcontext)!.couponWidgets.add(CouponItem(
                coupon: element,
                height: 160,
                width: 1,
              ));
        }
      });

      if (RefreshApp.of(mcontext)!.notificationsWidgets.isNotEmpty) {
        RefreshApp.of(mcontext)!.notificationsWidgets.clear();
      }
      RefreshApp.of(mcontext)!
          .apiAppVariables
          .notifications!
          .forEach((element) {
        if (element.status != "seen") {
          isNotificationSeen = false;
        }
        RefreshApp.of(mcontext)!.notificationsWidgets.add(NotificationItem(
              notification: element,
              height: 90,
              width: 1,
            ));
      });
      if (RefreshApp.of(mcontext)!.wishListWidgets.isNotEmpty) {
        RefreshApp.of(mcontext)!.wishListWidgets.clear();
      }
      RefreshApp.of(mcontext)!.apiAppVariables.wishList!.forEach((element) {
        RefreshApp.of(mcontext)!.wishListWidgets.add(CampaignItem(
              mycampagin: element.campaign,
              height: 580,
              width: 1,
            ));
      });
      //  campagins!.clear();
    }).onError((error, stackTrace) {
      print(error.toString() + "----" + stackTrace.toString());
      EasyLoading.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    // brands.insert(0, 'ALL');
    // models.insert(0, 'ALL');
    // years.insert(0, 'ALL');
    return RefreshAppState(
      child: widget.child,
      currentUser: currentUser,
      bodyWidget: bodyWidget,
    );
  }
}

class RefreshAppState extends InheritedWidget {
  RefreshAppState({
    Key? key,
    required this.currentUser,
    required this.bodyWidget,
    required Widget child,
  }) : super(key: key, child: child);
  Widget bodyWidget;
  ApiUser currentUser;

  static RefreshAppState? of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<RefreshAppState>();
    assert(result != null, 'No data found in context');
    return result;
  }

  @override
  bool updateShouldNotify(RefreshAppState old) {
    return (currentUser != old.currentUser ||
        currentUser != old.currentUser ||
        bodyWidget != old.bodyWidget);
  }
}
