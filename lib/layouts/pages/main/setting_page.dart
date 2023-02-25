import 'package:bsdealz/layouts/items/layouts/currency_changer.dart';
import 'package:bsdealz/layouts/items/layouts/language_indicator.dart';
import 'package:bsdealz/layouts/items/texts/SettingText.dart';
import 'package:bsdealz/layouts/items/texts/SubTitleText.dart';
import 'package:bsdealz/layouts/pages/main/ChangePasswordPage.dart';
import 'package:bsdealz/layouts/pages/main/splash.dart';
import 'package:bsdealz/main.dart';
import 'package:bsdealz/network/models/APIHeaders.dart';
import 'package:bsdealz/network/models/APIUser.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../network/HttpAPI.dart';
import '../../../utils/shared_func.dart';
import '../../../utils/sharedprefs.dart';
import '../../dialogs/web_dialog.dart';
import '../../items/layouts/currency_indicator.dart';
import '../../items/layouts/setting_membership_card.dart';
import '../../items/texts/BaseText.dart';
import '../../items/texts/TitleText.dart';
import '../../items/tobars/back_bar.dart';
import '../credentials/login.dart';
import 'ContactUsPage.dart';
import 'ContentWebView.dart';
import 'PersonalDetailsPage.dart';
import 'WalletPage.dart';
import 'WishListPage.dart';

class SettingPage extends StatefulWidget {
  SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool notificationOn = false;

  void toggleNotifications(bool value) {
    if (notificationOn == false) {
      CustomSharedPrefs().setV("allow_notifications", "true");
      setState(() {
        notificationOn = true;
      });
      print('allow_notifications Button is ON');
    } else {
      CustomSharedPrefs().setV("allow_notifications", "false");
      setState(() {
        notificationOn = false;
      });
      print('allow_notifications Button is OFF');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ShapeBorder shapeBorder1 = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      side: BorderSide(width: 0, color: Color(0XFF707070)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              BackBar(height: 40, title: "", notificationsNumber: 0),
              Expanded(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,

                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: TitleText(
                          text: RefreshApp.of(context)
                                  ?.apiAppVariables
                                  .user
                                  ?.firstName
                                  .toString() ??
                              '',
                          onPressed: () {},
                          clickable: false,
                        )),
                    Container(
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: SubTitleText(
                          text: RefreshApp.of(context)!
                                  .apiAppVariables
                                  .user
                                  ?.email
                                  .toString() ??
                              '',
                          onPressed: () {},
                          clickable: false,
                        )),

                    SettingMembershipCard(
                      height: 170,
                      width: 1,
                    ),
                    Container(
                      height: 15,
                    ),
                    BaseText(
                      color: Colors.black,
                      text: "Profile",
                      margin: 0,
                      marginh: 25,
                      fontSize: 25,
                      onPressed: () {},
                      fontWeight: FontWeight.bold,
                      clickable: false,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            // side: BorderSide(color: Colors.green, width: 0.5),
                            //   F7F7F7
                            //   E8E7E7
                            borderRadius: BorderRadius.circular(
                          22,
                        )),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: ListTile(
                                    title: SettingText(
                                        text: "Personal details",
                                        clickable: false,
                                        onPressed: () {}),
                                    trailing: Icon(
                                      size: 20,
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                    ),
                                    onTap: () {
                                      if (kIsWeb) {
                                        WebDialog.showMyDialog(
                                            WebDialog(
                                              title: "",
                                              text: "Dismiss",
                                              descriptions: "",
                                              customWidget:
                                                  PersonalDetailsPage(),
                                            ),
                                            context);
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PersonalDetailsPage(),
                                          ),
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Container(
                              height: 1,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              color: Colors.grey[300],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: ListTile(
                                    title: SettingText(
                                        text: "My Wishlist",
                                        clickable: false,
                                        onPressed: () {}),
                                    trailing: Icon(
                                      size: 20,
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                    ),
                                    onTap: () {
                                      if (kIsWeb) {
                                        WebDialog.showMyDialog(
                                            WebDialog(
                                              title: "",
                                              text: "Dismiss",
                                              descriptions: "",
                                              customWidget: WishListPage(),
                                            ),
                                            context);
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                WishListPage(),
                                          ),
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Container(
                              height: 1,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              color: Colors.grey[300],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: ListTile(
                                    title: SettingText(
                                        text: "Saved cards/Payment methods",
                                        clickable: false,
                                        onPressed: () {}),
                                    trailing: Icon(
                                      size: 20,
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                    ),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          //return ContactUsPage();
                                          return Container();
                                        },
                                      );
                                    }),
                              ),
                            ),
                            Container(
                              height: 1,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              color: Colors.grey[300],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: ListTile(
                                    title: SettingText(
                                        text: "Change password",
                                        clickable: false,
                                        onPressed: () {}),
                                    trailing: Icon(
                                      size: 20,
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                    ),
                                    onTap: () {
                                      if (kIsWeb) {
                                        WebDialog.showMyDialog(
                                            WebDialog(
                                              title: "",
                                              text: "Dismiss",
                                              descriptions: "",
                                              customWidget:
                                                  ChangePasswordPage(),
                                            ),
                                            context);
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChangePasswordPage(),
                                          ),
                                        );
                                      }
                                    }),
                              ),
                            ),
                            // Container(height: 1,margin: EdgeInsets.only(left: 20,right: 20),color: Colors.grey[300],),
                            // InkWell(
                            //   onTap: (){},
                            //   child: Container(
                            //     child: ListTile(
                            //         title: SettingText(text: "My coupons",clickable: false,onPressed: (){}),
                            //         trailing:Icon(
                            //           size:20,
                            //           Icons.arrow_forward_ios,
                            //           color: Colors.grey,
                            //         ),
                            //         onTap: () {
                            //           showDialog(
                            //             context: context,
                            //             builder: (BuildContext context) {
                            //               //return ContactUsPage();
                            //               return Container();
                            //             },
                            //           );
                            //         }),
                            //   ),
                            // ),
                            Container(
                              height: 1,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              color: Colors.grey[300],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: ListTile(
                                    title: SettingText(
                                        text: "My Wallet",
                                        clickable: false,
                                        onPressed: () {}),
                                    trailing: Icon(
                                      size: 20,
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                    ),
                                    onTap: () {
                                      if (kIsWeb) {
                                        WebDialog.showMyDialog(
                                            WebDialog(
                                              title: "",
                                              text: "Dismiss",
                                              descriptions: "",
                                              customWidget: WalletPage(),
                                            ),
                                            context);
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => WalletPage(),
                                          ),
                                        );
                                      }
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      height: 15,
                    ),
                    BaseText(
                      color: Colors.black,
                      text: "Info",
                      margin: 0,
                      marginh: 25,
                      fontSize: 25,
                      onPressed: () {},
                      fontWeight: FontWeight.bold,
                      clickable: false,
                    ),
                    /////////////////////////
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            // side: BorderSide(color: Colors.green, width: 0.5),
                            //   F7F7F7
                            //   E8E7E7
                            borderRadius: BorderRadius.circular(
                          22,
                        )),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: ListTile(
                                    title: SettingText(
                                        text: "How it works",
                                        clickable: false,
                                        onPressed: () {}),
                                    trailing: Icon(
                                      size: 20,
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                    ),
                                    onTap: () {
                                      if (kIsWeb) {
                                        WebDialog.showMyDialog(
                                            WebDialog(
                                              title: "",
                                              text: "Dismiss",
                                              descriptions: "",
                                              customWidget: ContentWebView(
                                                  url: HttpAPI()
                                                          .BASE_URL
                                                          .replaceAll(
                                                              "http://", "")
                                                          .replaceAll(
                                                              "https://", "") +
                                                      "/hot-it-works.pdf"),
                                            ),
                                            context);
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ContentWebView(
                                                    url: HttpAPI()
                                                            .BASE_URL
                                                            .replaceAll(
                                                                "http://", "")
                                                            .replaceAll(
                                                                "https://",
                                                                "") +
                                                        "/hot-it-works.pdf"),
                                          ),
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Container(
                              height: 1,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              color: Colors.grey[300],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: ListTile(
                                    title: SettingText(
                                        text: "Our charity work",
                                        clickable: false,
                                        onPressed: () {}),
                                    trailing: Icon(
                                      size: 20,
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                    ),
                                    onTap: () {
                                      if (kIsWeb) {
                                        WebDialog.showMyDialog(
                                            WebDialog(
                                              title: "",
                                              text: "Dismiss",
                                              descriptions: "",
                                              customWidget: ContentWebView(
                                                  url: HttpAPI()
                                                          .BASE_URL
                                                          .replaceAll(
                                                              "http://", "")
                                                          .replaceAll(
                                                              "https://", "") +
                                                      "/our-charity.pdf"),
                                            ),
                                            context);
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ContentWebView(
                                                    url: HttpAPI()
                                                            .BASE_URL
                                                            .replaceAll(
                                                                "http://", "")
                                                            .replaceAll(
                                                                "https://",
                                                                "") +
                                                        "/our-charity.pdf"),
                                          ),
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Container(
                              height: 1,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              color: Colors.grey[300],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: ListTile(
                                    title: SettingText(
                                        text: "Contact us",
                                        clickable: false,
                                        onPressed: () {}),
                                    trailing: Icon(
                                      size: 20,
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                    ),
                                    onTap: () {
                                      if (kIsWeb) {
                                        WebDialog.showMyDialog(
                                            WebDialog(
                                              title: "",
                                              text: "Dismiss",
                                              descriptions: "",
                                              customWidget: ContactUsPage(),
                                            ),
                                            context);
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ContactUsPage(),
                                          ),
                                        );
                                      }
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /////////////////////////////////////////////////////////

                    Container(
                      height: 15,
                    ),
                    BaseText(
                      color: Colors.black,
                      text: "Setting",
                      margin: 0,
                      marginh: 25,
                      fontSize: 25,
                      onPressed: () {},
                      fontWeight: FontWeight.bold,
                      clickable: false,
                    ),
                    //////////////////
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            // side: BorderSide(color: Colors.green, width: 0.5),
                            //   F7F7F7
                            //   E8E7E7
                            borderRadius: BorderRadius.circular(
                          22,
                        )),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: ListTile(
                                    title: SettingText(
                                        text: "Language",
                                        clickable: false,
                                        onPressed: () {}),
                                    trailing: Container(
                                        width: 100,
                                        child: LanguageIndicator(height: 40)),
                                    onTap: () {}),
                              ),
                            ),
                            Container(
                              height: 1,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              color: Colors.grey[300],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: ListTile(
                                    title: SettingText(
                                        text: "Currency",
                                        clickable: false,
                                        onPressed: () {}),
                                    trailing: Container(
                                        width: 100,
                                        child: CurrencyIndicator(height: 40)),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          //return ContactUsPage();
                                          return Container();
                                        },
                                      );
                                    }),
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.all(0),
                            //   child: ListTile(
                            //       title: SettingText(text: "Allow Notifications",clickable: false,onPressed: (){}),//Text("Allow Notifications",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                            //       trailing: Transform.scale(
                            //           scale: 1,
                            //           child: Switch(
                            //             onChanged: toggleNotifications,
                            //             value: notificationOn,
                            //             activeColor: Colors.blueAccent,
                            //             activeTrackColor: Colors.lightBlue[100],
                            //             inactiveThumbColor: Colors.black38,
                            //             inactiveTrackColor: Colors.black12,
                            //           )
                            //       ),
                            //       onTap: () {
                            //         showDialog(
                            //           context: context,
                            //           builder: (BuildContext context) {
                            //             //return ContactUsPage();
                            //             return Container();
                            //           },
                            //         );
                            //       }),
                            // ),

                            Container(
                              margin: EdgeInsets.only(right: 10, left: 10),
                              child: Column(
                                children: [
                                  ListTile(
                                      title: Text(
                                        "Logout",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      onTap: () {
                                        SharedFunc().setToken('token', '');
                                        CustomSharedPrefs().clear();
                                        RefreshApp.of(context)!
                                            .apiHeaders
                                            .token = null;

                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Login(
                                              destination: '',
                                            ),
                                          ),
                                        );
                                        MyApp.refreshApp(context);
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
