import 'package:badges/badges.dart' as b;
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/layouts/home_header.dart';
import 'package:bsdealz/layouts/items/layouts/web/web_home_header.dart';

import 'package:bsdealz/layouts/pages/fragments/MainFragment.dart';
import 'package:bsdealz/layouts/pages/fragments/MyCouponsFragment.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/network/HttpAPI.dart';
import 'package:bsdealz/network/models/APIUser.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:bsdealz/utils/sharedprefs.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../fragments/DrawsFragment.dart';
import '../fragments/NotificationsFragment.dart';
import '../fragments/ProductsFragment.dart';

class HomePage extends StatefulWidget {
  static _HomePageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_HomePageState>();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgetOptions = [
    const Center(),
    const Center(),
    const Center(),
    const Center(),
  ];

  _HomePageState();

  @override
  void initState() {
    super.initState();
    print("Token-------" + RefreshApp.of(context)!.apiHeaders.token.toString());

    if (mounted) {
      if (RefreshApp.of(context)!.isLogin) {
        fetchData();
      }
      //fetchServerData();
      //RefreshApp.of(context)!.bodyWidget = bodyWidget;
    }
  }

  // showmessages() async {
  //
  //
  //
  //   var initializationSettingsAndroid = AndroidInitializationSettings('logo');
  //   // Note: permissions aren't requested here just to demonstrate that can be done later
  //   var initializationSettingsIOS = IOSInitializationSettings(
  //     requestAlertPermission: false,
  //     requestBadgePermission: false,
  //     requestSoundPermission: false,
  //   );
  //   var initializationSettingsMacOS = MacOSInitializationSettings(
  //       requestAlertPermission: false,
  //       requestBadgePermission: false,
  //       requestSoundPermission: false);
  //   var initializationSettings = InitializationSettings(
  //       android: initializationSettingsAndroid,
  //       iOS: initializationSettingsIOS,
  //       macOS: initializationSettingsMacOS);
  //
  //
  //
  //
  //   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //     alert: true, // Required to display a heads up notification
  //     badge: true,
  //     sound: true,
  //   );
  //   AndroidNotificationChannel channel = AndroidNotificationChannel(
  //     'Tuning_Dynamicsc', // id
  //     'Tuning_Dynamics Notifications', // title
  //     'This channel is used for Tuning_Dynamics notifications.', // description
  //     importance: Importance.max,
  //   );
  //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //   FlutterLocalNotificationsPlugin();
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings);
  //
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel);
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //
  //     // If `onMessage` is triggered with a notification, construct our own
  //     // local notification to show to users using the created channel.
  //     if (notification != null && android != null) {
  //       flutterLocalNotificationsPlugin.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               channel.id,
  //               channel.name,
  //               channel.description,
  //              // icon: android?.smallIcon,
  //               // other properties...
  //             ),
  //           ));
  //     }
  //   });
  // }

  Future sendToken(String token) async {
    print("-------Reloading View main token1");
    HttpAPI dio = HttpAPI();
    await dio.Inisalize(context)
        .post('settoken', data: {"fcm_token": token}).then((value) {
      if (value.statusCode == 200) {
        print("setting token!!" + token);
        //   showmessages();
      } else {
        print("Error setting token!!");
      }
    }).onError((error, stackTrace) {
      print("Error setting token!!" + error.toString());
    });
  }

  Future<void> saveTokenToDatabase(String token) async {
    // Assume user is logged in for this example
    // String userId = FirebaseAuth.instance.currentUser!.uid;
    print("-------Reloading View main token");
    HttpAPI dio = HttpAPI();
    var response = await dio.Inisalize(context)
        .post('settoken', data: {"fcm_token": token}).then((value) {
      if (value.statusCode == 200) {
        print("setting token!!" + token);
      } else {
        print("Error setting token!!");
      }
    });
  }

  fetchData() async {
    // EasyLoading.show();

    print("-getting user-------");
    await CustomSharedPrefs().getVJson("user").then((value) async {
      print("-user data-------" + value.toString());
      String token =
          await FirebaseMessaging.instance.getToken().then((value) async {
        print("-getting token-------" + value!);
        await sendToken(value.toString()).onError((error, stackTrace) => null);
        // Any time the token refreshes, store this in the database too.
        FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
        return value;
      }).onError((error, stackTrace) {
        print(error.toString());
        return "";
      });

      setState(() {
        RefreshApp.of(context)!.currentUser = ApiUser.fromJson(value);
      });
    }).onError((error, stackTrace) {
      print("-getting user-----failed--");
    });
  }

  //int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      //_selectedIndex = index;
      RefreshApp.of(context)!.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //fetchData();
    Widget main = MainFragment();
    Widget draws = DrawsFragment();
    Widget coupons = MyCouponFragment();
    Widget products = ProductsFragment();
    Widget notifications = NotificationsFragment();
    _widgetOptions = <Widget>[
      Container(child: draws),
      Container(child: products),
      Container(child: main),
      Container(child: coupons),
      Container(child: notifications),
    ];
    print("-------Reloading View home");
    if (false) {
      EasyLoading.show(status: "loading");
      return const Center(child: Text("Loading"));
    } else {
      //  EasyLoading.dismiss();

      Widget topbar = Container(
          height: 60,
          alignment: Alignment.center,
          color: Theme.of(context).backgroundColor,
          child: HomeHeaderLayout(
              height: 60, user: RefreshApp.of(context)!.currentUser));
      if (kIsWeb) {
        topbar = Container(
            height: 90,
            alignment: Alignment.center,
            color: Theme.of(context).backgroundColor,
            child: WebHomeHeaderLayout(
                height: 80, user: RefreshApp.of(context)!.currentUser));
      }
      double width = MediaQuery.of(context).size.width;
      if (kIsWeb) {
        width = 1500;
      }
      Widget notificationsIcon =
          AppIcon(icon: AppIcon.NOTIFICATION_PATH, size: 22);
      Widget couponsIcon = AppIcon(icon: AppIcon.COUPON_PATH, size: 22);
      if (!RefreshApp.of(context)!.isNotificationSeen) {
        notificationsIcon = b.Badge(
            badgeContent: const Text(
              ' ',
              style: TextStyle(
                  color: Colors.red, fontSize: 6, fontWeight: FontWeight.bold),
            ),
            borderRadius: BorderRadius.circular(20),
            shape: b.BadgeShape.circle,
            padding: const EdgeInsets.all(3),
            position: b.BadgePosition.topEnd(top: 0, end: 15),
            badgeColor: Colors.red,
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: AppIcon(icon: AppIcon.NOTIFICATION_PATH, size: 22),
            ));
      }
      if (RefreshApp.of(context)!.apiAppVariables.userCoupons !=
          // ignore: curly_braces_in_flow_control_structures
          null) if (RefreshApp.of(
              context)!
          .apiAppVariables
          .userCoupons!
          .isNotEmpty) {
        for (var element
            in RefreshApp.of(context)!.apiAppVariables.userCoupons!) {
          if (element.campaign!.status != "Not active") {
            couponsIcon = b.Badge(
                badgeContent: const Text(
                  ' ',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 6,
                      fontWeight: FontWeight.bold),
                ),
                borderRadius: BorderRadius.circular(20),
                shape: b.BadgeShape.circle,
                padding: const EdgeInsets.all(3),
                position: b.BadgePosition.topEnd(top: 0, end: 15),
                badgeColor: Colors.red,
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: AppIcon(icon: AppIcon.COUPON_PATH, size: 22),
                ));
          }
        }
      }
      return Scaffold(
        // drawer: CustomDrawer(),
        //  endDrawer: CustomDrawer(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              topbar,

              Flexible(
                  flex: 1,
                  child: _widgetOptions
                      .elementAt(RefreshApp.of(context)!.selectedIndex)),
              //  Container(height: 60,)
            ],
          ),
        ),

        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(5),
          child: Card(
            elevation: 4,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21.0),
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              child: BottomNavigationBar(
                elevation: 0,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: AppIcon(
                        icon: AppIcon.DRAW_PATH,
                        size: 22,
                      ),
                      label: 'Draws',
                      backgroundColor: Colors.white,
                      activeIcon: AppIcon(
                          icon: AppIcon.DRAW_PATH,
                          size: 22,
                          color: Theme.of(context).primaryColor)),
                  BottomNavigationBarItem(
                      icon: AppIcon(icon: AppIcon.PRODUCTS_PATH, size: 22),
                      label: getTranslated(context, 'products'),
                      backgroundColor: Colors.white,
                      activeIcon: AppIcon(
                          icon: AppIcon.PRODUCTS_PATH,
                          size: 22,
                          color: Theme.of(context).primaryColor)),
                  BottomNavigationBarItem(
                      icon: AppIcon(icon: AppIcon.HOME_PATH, size: 22),
                      label: getTranslated(context, 'home'),
                      backgroundColor: Colors.white,
                      activeIcon: AppIcon(
                          icon: AppIcon.HOME_PATH,
                          size: 22,
                          color: Theme.of(context).primaryColor)),
                  BottomNavigationBarItem(
                      icon: couponsIcon,
                      label: getTranslated(context, 'coupond'),
                      backgroundColor: Colors.white,
                      activeIcon: AppIcon(
                          icon: AppIcon.COUPON_PATH,
                          size: 22,
                          color: Theme.of(context).primaryColor)),
                  BottomNavigationBarItem(
                      icon: notificationsIcon,
                      label: getTranslated(context, 'notification'),
                      backgroundColor: Colors.white,
                      activeIcon: AppIcon(
                          icon: AppIcon.NOTIFICATION_PATH,
                          size: 24,
                          color: Theme.of(context).primaryColor)),
                ],
                currentIndex: RefreshApp.of(context)!.selectedIndex,
                selectedItemColor: Theme.of(context).primaryColor,
                onTap: _onItemTapped,
              ),
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed:() {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => RequestFragment()));
        //   },
        //   tooltip: 'New Request',
        //   child: Icon(Icons.add),
        // )
      );
    }
  }
}

class Application extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<Application> {
  late String _token;
  Future<void> saveTokenToDatabase(String token) async {
    // Assume user is logged in for this example
    // String userId = FirebaseAuth.instance.currentUser!.uid;
    print("-------Reloading View main token");
    HttpAPI dio = HttpAPI();
    var response = await dio.Inisalize(context)
        .post('user/settoken', data: {"fcm_token": token}).then((value) {
      if (value.statusCode == 200) {
        print("setting token!!" + token);
      } else {
        print("Error setting token!!");
      }
    });
  }

  @override
  void initState() async {
    super.initState();
    // Get the token each time the application loads
    String? token = await FirebaseMessaging.instance.getToken();

    // Save the initial token to the database
    await saveTokenToDatabase(token!);

    // Any time the token refreshes, store this in the database too.
    FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  }

  @override
  Widget build(BuildContext context) {
    return Text("...");
  }
}
