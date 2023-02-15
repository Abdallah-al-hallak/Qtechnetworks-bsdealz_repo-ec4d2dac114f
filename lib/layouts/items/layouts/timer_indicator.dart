
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import '../../../network/models/APICampaign.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../texts/BaseText.dart';
import 'package:intl/intl.dart';

class TimerIdicator extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double progress;
  final double criticalValue;
  final ApiCampaign campaign;


  const TimerIdicator({Key? key,
    required this.height,
    required this.progress,
    required this.criticalValue,
    required this.campaign,
  })
      : super(key: key);

  @override
  _TimerIdicatorState createState() => _TimerIdicatorState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _TimerIdicatorState extends State<TimerIdicator> {


  _TimerIdicatorState();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Item(
      height: widget.height, progress: widget.progress, criticalValue: widget.criticalValue, campaign: widget.campaign,
    );
  }
}

// Define a custom Form widget.
class Item extends StatefulWidget {
  final double height;
  final double progress;
  final double criticalValue;
  final ApiCampaign campaign;

  const Item({Key ?key,
    required this.height,
    required this.progress,
    required this.criticalValue,
    required this.campaign,
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

    DateTime endTime1 = DateFormat("yyyy-MM-dd").parse(widget.campaign.endDate.toString()); // to be date
    endTime=endTime1.millisecondsSinceEpoch;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ShapeBorder shapeBorder1=RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        side: BorderSide(width: 1, color: Colors.red));
    return Container(

      margin: EdgeInsets.only(),
      height: widget.height,
      //width: 130,
      child: Row(
        children: [
          Card(
           shape: shapeBorder1,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      color: Colors.red,
                      text:"${AppSettingTheme.getTheme(context,Config.CLOSING_IN_KEY,Config.CLOSING_IN_VALUE,)}",
                      margin: 0,
                      marginh: 0,
                      fontSize: 9,
                      onPressed: (){},
                      fontWeight: FontWeight.bold, clickable: false,
                    ),
                    CountdownTimer(
                      endTime: endTime,
                      textStyle: TextStyle(color: Colors.red, fontSize: 9,fontWeight: FontWeight.bold),
                      endWidget: Text("${AppSettingTheme.getTheme(context,Config.CLOSED_KEY,Config.CLOSED_VALUE,)}",style: TextStyle(fontSize: 9,color: Colors.red,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              )),
          Expanded(child: Container())
        ],
      ),
    );

  }

}
