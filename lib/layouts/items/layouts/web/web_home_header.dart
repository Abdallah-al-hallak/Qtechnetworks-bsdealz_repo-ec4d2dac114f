import 'package:badges/badges.dart' as b;
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/layouts/language_indicator.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/pages/main/cart_page.dart';
import 'package:bsdealz/layouts/pages/main/splash.dart';
import 'package:bsdealz/network/models/APIUser.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:bsdealz/utils/sharedprefs.dart';
import 'package:flutter/material.dart';
import '../../../../utils/Config.dart';
import '../../../../utils/GetSettingByKey.dart';

import '../../../../utils/shared_func.dart';
import '../../../dialogs/web_dialog.dart';
import '../../../pages/credentials/login.dart';
import '../../../pages/main/ContactUsPage.dart';
import '../../../pages/main/setting_page.dart';
import '../currency_indicator.dart';

class WebHomeHeaderLayout extends StatefulWidget
    implements PreferredSizeWidget {
  final double height;
  final ApiUser user;

  const WebHomeHeaderLayout(
      {Key? key, required this.height, required this.user})
      : super(key: key);

  @override
  _WebHomeHeaderLayoutState createState() => _WebHomeHeaderLayoutState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _WebHomeHeaderLayoutState extends State<WebHomeHeaderLayout> {
  _WebHomeHeaderLayoutState();

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
  String username = "Login/Register";

  @override
  Widget build(BuildContext context) {
    double radius = 7;
    // Build a Form widget using the _formKey created above.
    Widget cartWidget = Container(
      padding: EdgeInsets.all(0),
      child: AppIcon(
        icon: AppIcon.CART_PATH,
        size: 25,
        color: Colors.grey,
      ),
    );
    if (RefreshApp.of(context)!.apiAppVariables.cart != null) {
      cartWidget = b.Badge(
        badgeContent: Text(
          RefreshApp.of(context)!
              .apiAppVariables
              .cart!
              .items!
              .length
              .toString(),
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
          padding: EdgeInsets.only(top: 0, left: 0),
          child: AppIcon(
            icon: AppIcon.CART_PATH,
            size: 25,
            color: Colors.grey,
          ),
        ),
      );
    }
    String username = "";
    Widget loginWidget = Container(
        width: 150,
        child: Container(
          child: FooterText(
            text: AppSettingTheme.getTheme(
              context,
              Config.WEB_HEADER_LOGIN_WIDGET_KEY,
              Config.WEB_HEADER_LOGIN_WIDGET_VALUE,
            ),
            clickable: true,
            onPressed: () {
              // WebDialog.showMyDialog(WebDialog(title: "",text: "Dismiss",
              //   descriptions: "",customWidget: Login(destination: "1"),),context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(destination: "1"),
                  ));
            },
          ),
        ));
    if (RefreshApp.of(context)!.apiHeaders.token!.isNotEmpty) {
      username =
          RefreshApp.of(context)!.apiAppVariables.user!.firstName.toString();
      loginWidget = Container(
          width: 150,
          child: Container(
            child: FooterText(
              text: AppSettingTheme.getTheme(
                context,
                Config.WEB_HEADER_LOGOUT_KEY,
                Config.WEB_HEADER_LOGOUT_VALUE,
              ),
              clickable: true,
              onPressed: () {
                SharedFunc().setToken('token', '');
                CustomSharedPrefs().clear();
                RefreshApp.of(context)!.apiHeaders.token = null;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Login(
                              destination: '2',
                            )));
                // WebDialog.showMyDialog(WebDialog(title: "",text: "Dismiss",
                //   descriptions: "",customWidget: Splash(),),context);
              },
            ),
          ));
    }
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 7),
      height: widget.height,
      width: 1500,
      alignment: Alignment.center,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: widget.height,
                    padding: EdgeInsets.all(0),
                    child: AppIcon(icon: AppIcon.LOGO_PATH, size: 40),
                  )),

              Expanded(flex: 30, child: Container()),

              Container(
                  width: 100,
                  child: CurrencyIndicator(
                    height: widget.height,
                  )),
              Container(
                  width: 100,
                  child: LanguageIndicator(
                    height: 40,
                  )),
              Container(
                  width: 100,
                  child: Container(
                    child: FooterText(
                      text: AppSettingTheme.getTheme(
                        context,
                        Config.WEB_HEADER_CONTACT_US_KEY,
                        Config.WEB_HEADER_CONTACT_US_VALUE,
                      ),
                      clickable: true,
                      onPressed: () {
                        WebDialog.showMyDialog(
                            WebDialog(
                              title: "",
                              text: AppSettingTheme.getTheme(
                                context,
                                Config.DISMISS_KEY,
                                Config.DISMISS_VALUE,
                              ),
                              descriptions: "",
                              customWidget: ContactUsPage(),
                            ),
                            context);
                      },
                    ),
                  )),
              loginWidget,
              Container(
                width: 100,
                child: FooterText(
                  text: username,
                  clickable: true,
                  onPressed: () {
                    WebDialog.showMyDialog(
                        WebDialog(
                          title: "",
                          text: AppSettingTheme.getTheme(
                            context,
                            Config.DISMISS_KEY,
                            Config.DISMISS_VALUE,
                          ),
                          descriptions: "",
                          customWidget: SettingPage(),
                        ),
                        context);
                  },
                ),
              ),
              Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        WebDialog.showMyDialog(
                            WebDialog(
                              title: "",
                              text: AppSettingTheme.getTheme(
                                context,
                                Config.DISMISS_KEY,
                                Config.DISMISS_VALUE,
                              ),
                              descriptions: "",
                              customWidget: CartPage(),
                            ),
                            context);
                      },
                      child: cartWidget)),
              // Expanded(flex:1,child: GestureDetector(onTap: (){
              //   Scaffold.of(context).openEndDrawer();
              // },child: Container(padding:EdgeInsets.only(left: 5),child: Image.asset("assets/images/user_setting.png"),
              // ))),
              //  IconButton(icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.redAccent, ), onPressed: null),
            ],
          ),
        ),
      ),
    );
  }
}
