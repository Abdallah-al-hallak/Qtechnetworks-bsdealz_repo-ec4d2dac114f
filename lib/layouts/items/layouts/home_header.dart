import 'package:badges/badges.dart' as b;
import 'package:bsdealz/layouts/items/buttons/Button1.dart';
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/layouts/language_indicator.dart';
import 'package:bsdealz/network/models/APIUser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../dialogs/main_dialog.dart';
import '../../pages/credentials/login.dart';
import '../../pages/main/cart_page.dart';
import '../../pages/main/setting_page.dart';
import '../lists/campaign_item.dart';
import '../lists/web/campaign_item_web.dart';

class HomeHeaderLayout extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final ApiUser user;

  const HomeHeaderLayout({Key? key, required this.height, required this.user})
      : super(key: key);

  @override
  _HomeHeaderLayoutState createState() => _HomeHeaderLayoutState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _HomeHeaderLayoutState extends State<HomeHeaderLayout> {
  _HomeHeaderLayoutState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomHeaderItem(height: widget.height, user: widget.user);
  }
}

// Define a custom Form widget.
class CustomHeaderItem extends StatefulWidget {
  final double height;
  final ApiUser user;

  const CustomHeaderItem({Key? key, required this.height, required this.user})
      : super(key: key);

  @override
  CustomHeaderItemState createState() {
    return CustomHeaderItemState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CustomHeaderItemState extends State<CustomHeaderItem> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomBannerForm1State>.
  final _formKey = GlobalKey<FormState>();
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    double radius = 7;
    // Build a Form widget using the _formKey created above.
    int sum = 0;

    Widget cartWidget = Container(
      padding: const EdgeInsets.all(0),
      child: AppIcon(icon: AppIcon.CART_PATH, size: 20),
    );
    if (RefreshApp.of(context)!.apiAppVariables.cart != null) {
      if (RefreshApp.of(context)!.apiAppVariables.cart!.items!.isNotEmpty) {
        RefreshApp.of(context)!.apiAppVariables.cart!.items!.forEach((element) {
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
    return Container(
      // margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 7),
      height: widget.height,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        if (RefreshApp.of(context)!.isLogin) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingPage()));
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
                                descriptions: AppSettingTheme.getTheme(
                                  context,
                                  Config.PLEASE_LOGIN_KEY,
                                  Config.PLEASE_LOGIN_VALUE,
                                ),
                                type: DialogType.ERROR,
                                customWidget: Button1(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const Login(
                                                    destination: '1',
                                                  )));
                                    },
                                    text: AppSettingTheme.getTheme(
                                      context,
                                      Config.LOGIN_KEY,
                                      Config.LOGIN_VALUE,
                                    ),
                                    hasIcon: false,
                                    color: Colors.red,
                                    fontColor: Colors.white),
                              ),
                              context);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        child: AppIcon(icon: AppIcon.PERSON_PATH, size: 20),
                      ))),
              Expanded(flex: 3, child: Container()),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: AppIcon(icon: AppIcon.LOGO_PATH, size: 40),
                  )),
              Expanded(flex: 1, child: Container()),
              const Expanded(
                  flex: 2,
                  child: LanguageIndicator(
                    height: 40,
                  )),
              Expanded(
                  flex: 1,
                  child: InkWell(
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
                                title: AppSettingTheme.getTheme(
                                  context,
                                  Config.FAILED_KEY,
                                  Config.FAILED_VALUE,
                                ),
                                text: AppSettingTheme.getTheme(
                                  context,
                                  Config.DISMISS_KEY,
                                  Config.DISMISS_VALUE,
                                ),
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
                      child: cartWidget)),

              // Expanded(flex:1,child: GestureDetector(onTap: (){
              //   Scaffold.of(context).openEndDrawer();
              // },child: Container(padding:EdgeInsets.only(left: 5),child: Image.asset("assets/images/user_setting.png"),
              // ))),
              //  IconButton(icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.redAccent, ), onPressed: null),
            ],
          ),
        ],
      ),
    );
  }
}
