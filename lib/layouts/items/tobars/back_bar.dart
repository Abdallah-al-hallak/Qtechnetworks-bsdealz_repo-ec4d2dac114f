import 'package:badges/badges.dart' as b;
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/texts/TitleText.dart';
import 'package:bsdealz/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../dialogs/main_dialog.dart';
import '../../pages/credentials/login.dart';
import '../../pages/main/cart_page.dart';
import '../buttons/Button1.dart';
import '../lists/campaign_item.dart';
import '../lists/web/campaign_item_web.dart';

class BackBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final int notificationsNumber;
  final String title;
  bool? showCart;
  BackBar(
      {Key? key,
      required this.height,
      required this.title,
      required this.notificationsNumber,
      this.showCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cartWidget = Container();

    if (showCart != null && showCart == true) {
      int sum = 0;
      cartWidget = Container(
        padding: const EdgeInsets.all(0),
        child: AppIcon(icon: AppIcon.CART_PATH, size: 20),
      );
      if (RefreshApp.of(context)!.apiAppVariables.cart != null) {
        if (RefreshApp.of(context)!.apiAppVariables.cart!.items!.isNotEmpty) {
          RefreshApp.of(context)!
              .apiAppVariables
              .cart!
              .items!
              .forEach((element) {
            sum = sum + element.quantity!;
          });
          cartWidget = b.Badge(
            badgeContent: Text(
              sum.toString(),
              style: const TextStyle(
                  color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold),
            ),
            borderRadius: BorderRadius.circular(20),
            shape: b.BadgeShape.circle,
            padding: const EdgeInsets.all(4),
            position: b.BadgePosition.topEnd(top: 0, end: 20),
            badgeColor: Colors.white,
            elevation: 4,
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: AppIcon(icon: AppIcon.CART_PATH, size: 20),
            ),
          );
        }
      }
    }
    Widget backicon = AppIcon(
        icon: AppIcon.BACK_ARROW_PATH, size: 24, color: Colors.grey[400]);
    if (RefreshApp.of(context)!.apiHeaders.acceptLanguage == "ar") {
      backicon = Transform.scale(
          scaleX: -1,
          child: AppIcon(
            icon: AppIcon.BACK_ARROW_PATH,
            size: 24,
            color: Colors.grey[400],
          ));
    }
    return Stack(
      children: [
        // Container(width: MediaQuery.of(context).size.width,
        // height: height,
        // child: Image.asset("assets/images/header_bg.png",fit: BoxFit.fill,),
        // ),
        Container(
          height: height,
          margin: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(top: 5, right: 5, left: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: backicon,
                    onTap: () {
                      Navigator.pop(context);
                      resetCampaigns(context);
                    },
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: TitleText(
                          text: title, onPressed: () {}, clickable: false),
                      margin: EdgeInsets.only(right: 10),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        if (RefreshApp.of(context)!.isLogin) {
                          RefreshApp.of(context)!.localCart.items!.clear();
                          RefreshApp.of(context)!.activeCampaignWidgets.clear();
                          RefreshApp.of(context)!
                              .apiAppVariables
                              .activeCampaigns!
                              .forEach((element) {
                            if (kIsWeb) {
                              RefreshApp.of(context)!
                                  .activeCampaignWidgets
                                  .add(CampaignItemWeb(
                                    mycampagin: element,
                                    height: 350,
                                    width: 1,
                                  ));
                            } else {
                              RefreshApp.of(context)!
                                  .activeCampaignWidgets
                                  .add(CampaignItem(
                                    mycampagin: element,
                                    height: 555,
                                    width: 1,
                                  ));
                            }
                          });
                          MyApp.refreshApp(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()));
                        } else {
                          MainDialog.showMyDialog(
                              MainDialog(
                                title: "${AppSettingTheme.getTheme(
                                  context,
                                  Config.FAILED_KEY,
                                  Config.FAILED_VALUE,
                                )}",
                                text: "${AppSettingTheme.getTheme(
                                  context,
                                  Config.DISMISS_KEY,
                                  Config.DISMISS_VALUE,
                                )}",
                                descriptions: "${AppSettingTheme.getTheme(
                                  context,
                                  Config.PLEASE_LOGIN_KEY,
                                  Config.PLEASE_LOGIN_VALUE,
                                )}",
                                type: DialogType.ERROR,
                                customWidget: Button1(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login(
                                                    destination: '1',
                                                  )));
                                    },
                                    text: "${AppSettingTheme.getTheme(
                                      context,
                                      Config.LOGIN_KEY,
                                      Config.LOGIN_VALUE,
                                    )}",
                                    hasIcon: false,
                                    color: Colors.red,
                                    fontColor: Colors.white),
                              ),
                              context);
                        }
                      },
                      child: cartWidget)
                ]),
          ),
        ),
      ],
    );
  }

  resetCampaigns(BuildContext context) {
    // RefreshApp.of(context)!.localCart.items!.clear();
    RefreshApp.of(context)!.activeCampaignWidgets.clear();
    RefreshApp.of(context)!.apiAppVariables.activeCampaigns!.forEach((element) {
      if (kIsWeb) {
        RefreshApp.of(context)!.activeCampaignWidgets.add(CampaignItemWeb(
              mycampagin: element,
              height: 350,
              width: 1,
            ));
      } else {
        RefreshApp.of(context)!.activeCampaignWidgets.add(CampaignItem(
              mycampagin: element,
              height: 555,
              width: 1,
            ));
      }
    });
    MyApp.refreshApp(context);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
