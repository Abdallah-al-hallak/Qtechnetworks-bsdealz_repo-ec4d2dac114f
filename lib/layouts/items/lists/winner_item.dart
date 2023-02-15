import 'package:bsdealz/layouts/items/layouts/Banner_layout.dart';
import 'package:bsdealz/layouts/items/layouts/main_progress_indicator.dart';
import 'package:bsdealz/layouts/items/layouts/timer_indicator.dart';

import 'package:bsdealz/network/models/APIDraw.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../network/HttpAPI.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../texts/BaseText.dart';

class WinnerItem extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;
  String? text;
  final ApiDraw? winnerItem;

  WinnerItem({Key? key, required this.height, required this.width, this.text, this.winnerItem}) : super(key: key);
  @override
  _WinnerItemState createState() => _WinnerItemState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height!);
}

class _WinnerItemState extends State<WinnerItem> {
  @override
  void initState() {
    super.initState();
    if(mounted){
      setState((){});
    }

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      GestureDetector(
          onTap: (){

          },
          child:WinnerItemSingle(height: widget.height,width: widget.width,text: widget.winnerItem!.campaign!.name.toString(),winnerItem: widget.winnerItem!,)

      );
  }


}
// Define a custom Form widget.
class WinnerItemSingle extends StatefulWidget {
  final double height,width;
  final String text;
  final ApiDraw winnerItem;
  const WinnerItemSingle({Key? key,required  this.height,required this.width,required this.text,required this.winnerItem}) : super(key: key);
  @override
  WinnerItemSingleState createState() {
    return WinnerItemSingleState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class WinnerItemSingleState extends State<WinnerItemSingle> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyWinnerItemForm1State>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double radius=21;


    return

      SizedBox(height: widget.height,
        child: Container(padding:EdgeInsets.only(left: 8,right: 8,bottom: 1,top: 8),alignment: Alignment.center,
          child: Card(
            elevation: 5,
            shape:RoundedRectangleBorder(
              // side: BorderSide(color: Colors.green, width: 0.5),
                borderRadius: BorderRadius.circular(21)),
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Flexible(
                    child: Stack(

                      children: [

                        Container(

                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 5),
                          child: PhysicalModel(
                            // elevation: 4.0,
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                            // shadowColor: Colors.black,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(radius),
                              child: Container(
                                margin: EdgeInsets.only(top: 15),
                                height: 150,
                                child: Image(
                                  image:CachedNetworkImageProvider(HttpAPI().BASE_URL+widget.winnerItem.campaign!.image.toString()),
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                  //  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: AlignmentDirectional.topEnd,
                          child: BaseText(
                            color: Colors.black,
                            text:"",
                            margin: 10,
                            marginh: 5,
                            fontSize: 8,
                            onPressed: (){},
                            fontWeight: FontWeight.bold, clickable: false,),
                        )
                      ],
                    ),
                  ),
                  BaseText(
                    color: Theme.of(context).primaryColor,
                    text:"${AppSettingTheme.getTheme(context,Config.CONGRATS_KEY,Config.CONGRATS_VALUE,)}",
                    margin: 10,
                    marginh: 5,
                    fontSize: 19,
                    onPressed: (){},
                    fontWeight: FontWeight.bold, clickable: false,),

                  Center(

                    child: BaseText(
                      color: Colors.black,
                      text:"${widget.winnerItem.winnerName}",
                      margin: 4,
                      marginh: 5,
                      fontSize: 16,
                      onPressed: (){},
                      fontWeight: FontWeight.bold, clickable: false,),
                  ),
                  BaseText(
                    color: Colors.black,
                    text:"${AppSettingTheme.getTheme(context,Config.ON_WINNING_KEY,Config.ON_WINNING_VALUE,)}  ${widget.winnerItem.campaign!.prize.toString()}}",
                    margin: 10,
                    marginh: 5,
                    fontSize: 14,
                    onPressed: (){},
                    fontWeight: FontWeight.bold, clickable: false,),
                  Container(margin:EdgeInsets.only(top: 10,bottom: 5),height: 1,color: Colors.grey[300],),
                  BaseText(
                    color: Colors.grey[700]!,
                    text:"${AppSettingTheme.getTheme(context,Config.COUPON_NO_KEY,Config.COUPON_NO_VALUE,)} ${widget.winnerItem.coupon!.code}",
                    margin: 5,
                    marginh: 5,
                    fontSize: 11,
                    onPressed: (){},
                    fontWeight: FontWeight.bold, clickable: false,),

                  BaseText(
                    color: Colors.grey,
                    text:"${AppSettingTheme.getTheme(context,Config.ANNOUNCED_KEY,Config.ANNOUNCED_VALUE,)} ${widget.winnerItem.drawDate}",
                    margin: 0,
                    marginh: 5,
                    fontSize: 11,
                    onPressed: (){},
                    fontWeight: FontWeight.bold, clickable: false,),


                ],
              ),
            ),
          ),
        ),
      );

  }
}
