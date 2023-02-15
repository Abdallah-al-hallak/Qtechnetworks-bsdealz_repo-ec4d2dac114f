
import 'package:bsdealz/layouts/items/layouts/timer_indicator.dart';
import 'package:flutter/material.dart';

import '../../../network/models/APICampaign.dart';
import 'main_progress_indicator.dart';


class BlinkingProgressIndicator extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double progress;
  final double criticalValue;
  final ApiCampaign campagin;

  const BlinkingProgressIndicator({Key? key,
    required this.height,
    required this.progress,
    required this.criticalValue,
    required this.campagin,
  })
      : super(key: key);

  @override
  _BlinkingProgressIndicatorState createState() => _BlinkingProgressIndicatorState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _BlinkingProgressIndicatorState extends State<BlinkingProgressIndicator> {


  _BlinkingProgressIndicatorState();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Item(
        height: widget.height, progress: widget.progress, criticalValue: widget.criticalValue,campagin: widget.campagin,
    );
  }
}

// Define a custom Form widget.
class Item extends StatefulWidget {
  final double height;
  final double progress;
  final double criticalValue;
  final ApiCampaign campagin;
  const Item({Key ?key,
    required this.height,
    required this.progress,
    required this.criticalValue,
    required this.campagin,
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
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _colorAnimation = ColorTween(begin: Colors.redAccent, end: Colors.grey[300])
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
      setState(() {});
    });
    _controller.forward();
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    Color color=Colors.green;
    if(widget.progress>=0.7&&widget.progress<=0.9){
      color=Colors.orange;
    }
    if(widget.progress>widget.criticalValue||widget.progress>0.9){
      color=_colorAnimation.value!;
    }
    Widget mainIndecator=Container();
    if(widget.campagin.isCountdown!){
      mainIndecator=   Transform.scale(

          scale: 1,child:TimerIdicator(height: 30,criticalValue: 0.6,progress:double.parse(widget.campagin.sold.toString())/double.parse(widget.campagin.quantity.toString()), campaign: widget.campagin,));
    }else{
      mainIndecator=  MainProgressIndicator(height: widget.height,progress: widget.progress,criticalValue: 60, campagin: widget.campagin,color: color,scale: 0.6,);
    }
    return
      mainIndecator;
      Container(
      margin: EdgeInsets.only(),
      height: widget.height,
      width: 100,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: LinearProgressIndicator(color: color,value: widget.progress,backgroundColor: Colors.grey[300],)),
    );

  }

}
