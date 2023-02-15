
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import '../../../network/models/APICampaign.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../texts/BaseText.dart';
import 'package:intl/intl.dart';

class JustLaunched extends StatefulWidget implements PreferredSizeWidget {
  final double height;



  const JustLaunched({Key? key,
    required this.height,
  })
      : super(key: key);

  @override
  _JustLaunchedState createState() => _JustLaunchedState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _JustLaunchedState extends State<JustLaunched> {


  _JustLaunchedState();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Item(
      height: widget.height,
    );
  }
}

// Define a custom Form widget.
class Item extends StatefulWidget {
  final double height;


  const Item({Key ?key,
    required this.height,

  })
      : super(key: key);

  @override
  ItemState createState() {
    return ItemState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ItemState extends State<Item>  with SingleTickerProviderStateMixin{
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomBannerForm1State>.
  final _formKey = GlobalKey<FormState>();
  final controller = PageController(initialPage: 0);
  late int endTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ShapeBorder shapeBorder1=RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(width: 1, color: Colors.orange));
    return Container(

      margin: EdgeInsets.only(),
      height: widget.height,
      width: 180,
      child: Card(
          shape: shapeBorder1,
          color: Colors.orange,
          child: Container(
            alignment: Alignment.center,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BaseText(
                  color: Colors.white,
                  text:"${AppSettingTheme.getTheme(context,Config.JUST_LAUNCHED_KEY,Config.JUST_LAUNCHED_VALUE,)}",
                  margin: 0,
                  marginh: 0,
                  fontSize: 14,
                  onPressed: (){},
                  fontWeight: FontWeight.bold, clickable: false,
                ),
              ],
            ),
          )),
    );

  }

}
