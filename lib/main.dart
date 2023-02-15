import 'dart:io';
import 'dart:ui';

import 'package:bsdealz/layouts/pages/credentials/login.dart';

import 'package:bsdealz/layouts/pages/credentials/signup.dart';
import 'package:bsdealz/layouts/pages/main/cart_page.dart';

import 'package:bsdealz/layouts/pages/main/home_page.dart';
import 'package:bsdealz/layouts/pages/main/splash.dart';

import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/localization/localization.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';

import 'package:country_picker/country_picker.dart';
import 'package:currency_picker/currency_picker.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_kurdish_localization/flutter_kurdish_localization.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("new message received and opened!!");
    // if (message.data['type'] == 'chat') {
    //   Navigator.pushNamed(context, '/chat',
    //       arguments: ChatArguments(message));
    // }
  });
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0XFFDD001A)));
  HttpOverrides.global = new MyHttpOverrides();
  // await Firebase.initializeApp(
  //   // Replace with actual values
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyDxhoxKno6k0DSfhAXaxPm11_XjjKp0qYY",
  //     appId: "1:289837798399:web:1068cd5d3789070d680dca",
  //     messagingSenderId: "289837798399",
  //     projectId: "bsdealz-4b71c",
  //   ),
  // );
  runApp(const MyApp());
}

DateTime? currentBackPressTime;
Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
    currentBackPressTime = now;
    EasyLoading.showToast("another back to exit");
    return Future.value(false);
  }
  return Future.value(true);
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  static void setCurrency(BuildContext context, Currency newCurrency) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setCurrency(newCurrency);
  }

  static void refreshApp(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.refreshApp();
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //_initialization = Firebase.initializeApp();
    // Get the token each time the application loads

    configLoading();
    //fetchServerData();
    // Save the initial token to the database
    // ///////////////await saveTokenToDatabase(token!);

    // Any time the token refreshes, store this in the database too.
    ///////////////  FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  }

  refreshApp() {
    setState(() {});
  }

  Locale? _locale;
  Currency? _currency;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  setCurrency(Currency currency) {
    setState(() {
      _currency = currency;
    });
  }

  void configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 40.0
      ..radius = 80.0
      ..progressColor = Colors.black
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.red
      ..textColor = Colors.black
      ..maskColor = Colors.orange.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Change Page
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return RefreshApp(
      child: MaterialApp(
        scrollBehavior: AppScrollBehavior(),
        // Start the app with the "/" named route. In this case, the app starts
        // on the FirstScreen widget.
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => Splash(), //Login(destination: '1'),// Splash(),
          '/home': (context) => HomePage(),
          '/cart': (context) => CartPage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/login1': (context) => Login(destination: '1'),
          '/login2': (context) => Login(destination: '2'),
          '/signup': (context) => Signup(),
          // '/edit_profile': (context) => EditProfile(),
          // '/home_page': (context) => HomePage(),

          // '/notifications': (context) => NotificationsPage(),
          //'/order_page': (context) => OrderPage(orderId: orderId),
          // '/cart_page': (context) => CartList(),
          // '/cart_page': (context) => CartList(),
        },

        theme: ThemeData(
          // Define the default brightness and colors.
          // brightness: Brightness.light,
          primaryColor: Color(0XFFDD001A),
          backgroundColor: Colors.white,
          accentColor: Colors.white,
          //  cardColor:  Color(0XFFE8EBF0),

          primarySwatch: Colors.red,
          // Define the default font family.
          fontFamily: 'Rubik',
          //
          // // Define the default TextTheme. Use this to specify the default
          // // text styling for headlines, titles, bodies of text, and more.
          // textTheme: TextTheme(
          //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          // ),
        ),
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        locale: _locale,

        supportedLocales: [
          Locale("en", "US"),
          Locale("ar", "SA"),
          Locale("ku", "IQ")
        ],
        localizationsDelegates: [
          Localization.delegate,
          CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          KurdishMaterialLocalizations.delegate,
          KurdishWidgetLocalizations.delegate,
          KurdishCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );

    return MaterialApp(
        home: Scaffold(
            body: Center(child: EasyLoading.instance.indicatorWidget)));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
