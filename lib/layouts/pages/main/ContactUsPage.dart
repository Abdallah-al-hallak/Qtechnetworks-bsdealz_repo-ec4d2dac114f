import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/network/HttpAPI.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../localization/language_constants.dart';
import '../../dialogs/web_dialog.dart';
import '../../items/texts/BaseText.dart';
import '../../items/texts/SettingText.dart';
import '../../items/tobars/back_bar.dart';
import 'ContentWebView.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              BackBar(
                height: 60,
                notificationsNumber: 0,
                title: "Contact Us",
              ),
              Expanded(child: PerasonalDetailsForm()),
            ],
          ),
        )));
  }
}

// Define a custom Form widget.
class PerasonalDetailsForm extends StatefulWidget {
  @override
  PerasonalDetailsFormState createState() {
    return PerasonalDetailsFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class PerasonalDetailsFormState extends State<PerasonalDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  ShapeBorder shapeBorder1 = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(width: 1, color: Colors.grey));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Form(
        key: _formKey,
        child: ListView(children: <Widget>[
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
                      text: "Privacy policy",
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
                            text: getTranslated(context, 'Dis'),
                            descriptions:
                                "", //https://docs.google.com/viewer?url="
                            customWidget: ContentWebView(
                                url:
                                    HttpAPI().BASE_URL + "privacy-policy.html"),
                          ),
                          context);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentWebView(
                              url: HttpAPI().BASE_URL + "privacy-policy.html"),
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
                      text: "Terms and conditions",
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
                            text: getTranslated(context, 'Dis'),
                            descriptions: "", //replaceAll("http://", "").
                            customWidget: ContentWebView(
                                url: HttpAPI().BASE_URL +
                                    "terms-and-conditions.html"),
                          ),
                          context);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentWebView(
                              url: HttpAPI().BASE_URL +
                                  "terms-and-conditions.html"),
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
                      text: "FAQ", clickable: false, onPressed: () {}),
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
                                url: "https://docs.google.com/viewer?url=" +
                                    HttpAPI()
                                        .BASE_URL
                                        .replaceAll("http://", "")
                                        .replaceAll("https://", "") +
                                    "/FAQ.pdf"),
                          ),
                          context);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentWebView(
                              url: "https://docs.google.com/viewer?url=" +
                                  HttpAPI()
                                      .BASE_URL
                                      .replaceAll("http://", "")
                                      .replaceAll("https://", "") +
                                  "/FAQ.pdf"),
                        ),
                      );
                    }
                  }),
            ),
          ),
          Container(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    _launchURL("https://instagram.com", "INSTAGRAM_PATH link");
                  },
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: AppIcon(icon: AppIcon.INSTAGRAM_PATH, size: 55))),
              InkWell(
                  onTap: () {
                    _launchURL("https://facebook.com", "FACEBOOK_PATH link");
                  },
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: AppIcon(icon: AppIcon.FACEBOOK_PATH, size: 55))),
              InkWell(
                  onTap: () {
                    _launchURL(
                        "mailto://aaaa@qtechnetworks.com", "EMAIL_PATH link");
                  },
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: AppIcon(icon: AppIcon.EMAIL_PATH, size: 55))),
              InkWell(
                  onTap: () {
                    _launchURL("tel://+9627888888", "PHONE_PATH link");
                  },
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: AppIcon(icon: AppIcon.PHONE_PATH, size: 55))),
            ],
          )
        ]));
  }

  void _launchURL(_url, name) async => await canLaunchUrl(Uri.parse(_url))
      ? await launchUrl(Uri.parse(_url))
      : throw 'Could not Open' + name.toString();
}
