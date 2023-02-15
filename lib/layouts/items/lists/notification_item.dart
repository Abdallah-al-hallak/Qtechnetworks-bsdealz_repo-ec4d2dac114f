import 'package:badges/badges.dart' as b;
import 'package:bsdealz/network/models/APINotification.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../network/HttpAPI.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../dialogs/web_dialog.dart';
import '../../pages/main/CampaignPage.dart';
import '../icons/AppIcon.dart';

class NotificationItem extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;
  String? text;
  final ApiNotification? notification;

  NotificationItem(
      {Key? key,
      required this.height,
      required this.width,
      this.text,
      this.notification})
      : super(key: key);
  @override
  _NotificationItemState createState() => _NotificationItemState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {
          if (kIsWeb) {
            WebDialog.showMyDialog(
                WebDialog(
                    title: "",
                    text: "${AppSettingTheme.getTheme(
                      context,
                      Config.DISMISS_KEY,
                      Config.DISMISS_VALUE,
                    )}",
                    descriptions: "",
                    customWidget: CampaignPage(
                      campaign: widget.notification!.campaign,
                    )),
                context);
          } else {
            updateNotification(widget.notification!);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CampaignPage(
                          campaign: widget.notification!.campaign,
                        )));
          }
        },
        child: NotificationItemSingle(
          height: widget.height,
          width: widget.width,
          notification: widget.notification!,
        ));
  }

  updateNotification(ApiNotification Item) {
    print("hi all");
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);
    return dio.post('notification', data: {
      "id": Item.id,
      "status": "seen",
    }).then((value) {
      if (value.data['status'] == 'success') {
        List<ApiNotification> notifications = List<ApiNotification>.from(
            value.data['data'].map((model) => ApiNotification.fromJson(model)));
        setState(() {
          RefreshApp.of(context)!.notificationsWidgets.clear();
          RefreshApp.of(context)!.apiAppVariables.notifications = notifications;
          RefreshApp.of(context)!.isNotificationSeen = true;
          RefreshApp.of(context)!
              .apiAppVariables
              .notifications!
              .forEach((element) {
            if (element.status != "seen") {
              RefreshApp.of(context)!.isNotificationSeen = false;
            }
            RefreshApp.of(context)!.notificationsWidgets.add(NotificationItem(
                  notification: element,
                  height: 90,
                  width: 1,
                ));
          });
        });

        MyApp.refreshApp(context);
      }
    }).onError((error, stackTrace) {});
  }
}

// Define a custom Form widget.
class NotificationItemSingle extends StatefulWidget {
  final double height, width;
  final ApiNotification notification;
  const NotificationItemSingle(
      {Key? key,
      required this.height,
      required this.width,
      required this.notification})
      : super(key: key);
  @override
  NotificationItemSingleState createState() {
    return NotificationItemSingleState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class NotificationItemSingleState extends State<NotificationItemSingle> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyNotificationItemForm1State>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double radius = 21;

    Widget badge = Container(
        margin: const EdgeInsets.only(top: 10),
        child: AppIcon(
          icon: AppIcon.NOTIFICATION_PATH,
          size: 25,
        ));
    if (widget.notification.status != "seen") {
      badge = b.Badge(
          badgeContent: const Text(
            ' ',
            style: TextStyle(
                color: Colors.red, fontSize: 6, fontWeight: FontWeight.bold),
          ),
          borderRadius: BorderRadius.circular(20),
          shape: b.BadgeShape.circle,
          padding: const EdgeInsets.all(3),
          position: b.BadgePosition.topEnd(top: 5, end: 15),
          badgeColor: Colors.red,
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.only(top: 10, left: 0),
            child: Container(
                child: AppIcon(
              icon: AppIcon.NOTIFICATION_PATH,
              size: 25,
            )),
          ));
    }

    return SizedBox(
      height: widget.height,
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, bottom: 1, top: 5),
        alignment: Alignment.center,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              // side: BorderSide(color: Colors.green, width: 0.5),
              borderRadius: BorderRadius.circular(21)),
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: ListTile(
              tileColor: Colors.white,
              leading: badge,
              title: Text(widget.notification.title.toString()),
              subtitle: Text(widget.notification.subtitle.toString()),
              trailing: Container(
                width: 80,
                height: 80,
                alignment: Alignment.bottomRight,
                child: PhysicalModel(
                  // elevation: 4.0,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  // shadowColor: Colors.black,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image(
                        image: CachedNetworkImageProvider(HttpAPI().BASE_URL +
                            widget.notification.campaign!.image.toString()),
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        //  width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
