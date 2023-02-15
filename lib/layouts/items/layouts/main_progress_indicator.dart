
import 'package:bsdealz/network/models/APICampaign.dart';
import 'package:flutter/material.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../texts/BaseText.dart';


class MainProgressIndicator extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double progress;
  final double criticalValue;
  final ApiCampaign campagin;
  final Color color;
  final double scale;


  const MainProgressIndicator({Key? key,
    required this.height,
    required this.progress,
    required this.criticalValue,
    required this.campagin,
    required this.color, required this.scale
  })
      : super(key: key);

  @override
  _MainProgressIndicatorState createState() => _MainProgressIndicatorState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _MainProgressIndicatorState extends State<MainProgressIndicator> {


  _MainProgressIndicatorState();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Item(
      height: widget.height, progress: widget.progress,
      criticalValue: widget.criticalValue, campagin: widget.campagin,color: widget.color,scale: widget.scale,
    );
  }
}

// Define a custom Form widget.
class Item extends StatefulWidget {
  final double height;
  final double progress;
  final double criticalValue;
  final ApiCampaign campagin;
  final double scale;
  final Color color;
  const Item({Key ?key,
    required this.height,
    required this.progress,
    required this.criticalValue,
    required this.campagin,
    required this.color, required this.scale
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
  @override
  void initState() {

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Color color=Colors.green;
    if(widget.progress>=0.7&&widget.progress<=0.9){
      color=Colors.orange;
    }
    if(widget.progress>widget.criticalValue||widget.progress>0.9){
      color=Colors.red!;
    }
    color=widget.color;

    var alig=MainAxisAlignment.center;
    if(widget.scale==1.0){
      alig=MainAxisAlignment.start;
    }
    ShapeBorder shapeBorder1=RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      side: BorderSide(width: 0.0, color: color),

    );

    return Transform.scale(
      scale: widget.scale,
      child: Container(
       // margin: EdgeInsets.only(),
        height: widget.height,

        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: alig,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: widget.height,
              child: BaseText(
                color: Colors.grey,
                text:widget.campagin.sold.toString(),
                margin: 9,
                marginh: 0,
                fontSize: 9,
                onPressed: (){},
                fontWeight: FontWeight.bold, clickable: false,
              ),
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 13,
                      margin: EdgeInsets.only(top: 5,left: 3.5,right: 3.5),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: LinearProgressIndicator(color: color,value: widget.progress,backgroundColor: Colors.grey[200],)),
                    ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 70*widget.progress),
              child: Column(
                children: [
                  Container(

                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Card(
                          color: color,
                          elevation: 2,
                          shape: shapeBorder1,
                          child: Container(width: 7,height: 13,))),
                  ),
                  BaseText(
                    color: Colors.grey,
                    text:"${AppSettingTheme.getTheme(context,Config.SOLD_KEY,Config.SOLD_VALUE,)}",
                    margin: 2,
                    marginh: 0,
                    fontSize: 7,
                    onPressed: (){},
                    fontWeight: FontWeight.bold, clickable: false,
                  ),
                ],
              ),
            )],
                ),

              ],
            ),
            Container(
              height: widget.height,
              child: BaseText(
                color: Colors.grey,
                text:widget.campagin.quantity.toString(),
                margin: 9,
                marginh: 5,
                fontSize: 9,
                onPressed: (){},
                fontWeight: FontWeight.bold, clickable: false,
              ),
            ),
          ],
        ),
      ),
    );

  }

}
