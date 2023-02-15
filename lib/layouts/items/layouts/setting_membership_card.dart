
import 'dart:math';

import 'package:bsdealz/layouts/pages/main/LevelsPage.dart';
import 'package:bsdealz/network/models/APICampaign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../dialogs/web_dialog.dart';
import '../texts/BaseText.dart';

class SettingMembershipCard extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;


  SettingMembershipCard({Key? key, required this.height, required this.width,}) : super(key: key);
  @override
  _SettingMembershipCardState createState() => _SettingMembershipCardState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height!);
}

class _SettingMembershipCardState extends State<SettingMembershipCard> {
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
          child:SettingMembershipCardSingle(height: widget.height,width: widget.width,text: "555")

      );
  }


}
// Define a custom Form widget.
class SettingMembershipCardSingle extends StatefulWidget {
  final double height,width;
  final String text;

  const SettingMembershipCardSingle({Key? key,required  this.height,required this.width,required this.text}) : super(key: key);
  @override
  SettingMembershipCardSingleState createState() {
    return SettingMembershipCardSingleState();
  }
}

class SettingMembershipCardSingleState extends State<SettingMembershipCardSingle> {

  final _formKey = GlobalKey<FormState>();
  ShapeBorder shapeBorder1=RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(width: 1, color:Color(0XFF707070)));
  List<Color> gradiant=[Color(0XFFFFFFFF), Color(0XFFFFFFFF)];
  List<Color> sidegradiant=[Color(0XFFFFFFFF), Color(0XFFFFFFFF)];
  @override
  Widget build(BuildContext context) {

    String levelhint="${AppSettingTheme.getTheme(context,Config.MAX_LEVEL_KEY,Config.MAX_LEVEL_VALUE,)}";

       levelhint="${AppSettingTheme.getTheme(context,Config.TOTAL_EARNING_POINTS_KEY,Config.TOTAL_EARNING_POINTS_VALUE,)} ${RefreshApp.of(context)!.apiAppVariables.user!.totalCollectedPoints.toString()}  level reset:${RefreshApp.of(context)!.apiAppVariables.user!.pointsValidationDate} \n ${AppSettingTheme.getTheme(context,Config.EARN_KEY,Config.EARN_VALUE,)} ${RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.nextLevelRemain.toString()} ${AppSettingTheme.getTheme(context,Config.MORE_TO_REACH_KEY,Config.MORE_TO_REACH_VALUE,)}";

    try {
      gradiant = [
        Color(int.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.startColor.toString())),
        Color(int.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.endColor.toString()))
      ];
      sidegradiant = [
        Color(int.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.sideColorStart.toString())),
        Color(int.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.sideColorEnd.toString()))
      ];
    }catch(error){

      print(error);
    }

    // Widget levelNameWidget=Transform( transform: Matrix4.skewY(0.0)..rotateZ(-pi / 2.0),
    //   child: Container(
    //     margin: EdgeInsets.only(right:00),
    //     child: Transform.translate(
    //       offset: Offset(-260,-50),
    //       child: BaseText(
    //         color:   Color(int.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.sideFontColor.toString())),
    //         text:"${RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.name}",
    //         margin: 5,
    //         marginh: 0,
    //         fontSize: 21,
    //         onPressed: (){},
    //         fontWeight: FontWeight.bold, clickable: false,
    //         fontStyle: FontStyle.italic,
    //       ),
    //     ),
    //   ),);

    Widget levelNameWidget=Transform( transform: Matrix4.skewY(0.0)..rotateZ(-pi / 2.0),
      child: Container(
        margin: EdgeInsets.only(right:00),
        child: Transform.translate(
          offset: Offset(-165,-50),
          child: Container(
            height: 165,
            width: 165,
            alignment: Alignment.center,
            child: BaseText(
              color:   Color(int.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.sideFontColor.toString())),
              text:"${RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.name}",
              margin: 5,
              marginh: 0,
              fontSize: 20,
              onPressed: (){},
              fontWeight: FontWeight.bold, clickable: false,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),);
    double progress=(double.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.userTotalPoints.toString())-double.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.startThreshold.toString()))/(double.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.endThreshold.toString())-double.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.startThreshold.toString()));
    return

      SizedBox(height: widget.height,
        child: Container(padding:EdgeInsets.only(left: 8,right: 8,bottom: 1,top: 8),alignment: Alignment.center,
          child: Card(
            elevation: 5,
            shape:RoundedRectangleBorder(
              // side: BorderSide(color: Colors.green, width: 0.5),
              //   F7F7F7
              //   E8E7E7
                borderRadius: BorderRadius.circular(22)),
            child: Stack(
              children: [
                Container(

                    alignment: Alignment.centerLeft,

                    child: levelNameWidget),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: sidegradiant,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(22.0),bottomLeft: Radius.circular(22))
                        ),
                        child: Container(     width: 50,
                          height: widget.height,
                        ),
                      ),
                      Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: gradiant,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          borderRadius:BorderRadius.only(topRight: Radius.circular(22),bottomRight: Radius.circular(22)),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width-74,
                          child: Stack(
                              children: <Widget>[

                                Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(

                                      margin: EdgeInsets.only(top: 10),
                                      child: Card(
                                        elevation: 0,
                                        color:  Color(int.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.centerBoxColor.toString())),
                                        shape: shapeBorder1,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 150,
                                                margin:EdgeInsets.only(top:10,right: 25,left:25),
                                                alignment: Alignment.center,
                                                child:Text("${RefreshApp.of(context)!.apiAppVariables.user!.points.toString()}\n=${RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.pointsCurrencyAmount.toString()}",textAlign: TextAlign.center,style: TextStyle( color: Color(int.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.contentFontColor.toString())),fontSize: 18,fontWeight:FontWeight.bold,height: 0.9 ),
                                                )),
                                            // BaseText(
                                            //   color: Color(int.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.contentFontColor.toString())),
                                            //   text:"${RefreshApp.of(context)!.apiAppVariables.user!.points.toString()}\n=${RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.pointsCurrencyAmount.toString()}",
                                            //   margin: 10,
                                            //   marginh: 25,
                                            //   fontSize: 18,
                                            //   onPressed: (){},
                                            //   fontWeight: FontWeight.bold, clickable: false,
                                            // ),
                                            BaseText(
                                              color: Colors.grey,
                                              text:"${AppSettingTheme.getTheme(context,Config.AVAILABLE_POINTS_KEY,Config.AVAILABLE_POINTS_VALUE,)}",
                                              margin: 5,
                                              marginh: 25,
                                              fontSize: 12,
                                              onPressed: (){},
                                              fontWeight: FontWeight.normal, clickable: false,
                                            ),
                                            Container(height: 5,width: 1,)
                                          ],
                                        ),

                                      ),
                                    ),
                                    Container(
                                        height: 6,margin: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),

                                        child: ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                            child: LinearProgressIndicator(color: Colors.red,backgroundColor: Colors.grey[300],value:progress,))),

                                      Row(
                                      children: [
                                      Container(child:
                                      BaseText(
                                  color:Color(int.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.contentFontColor.toString())),
                                  text:"${RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.benefits}",
                                        margin: 5,
                                        marginh: 25,
                                        fontSize: 9,
                                        onPressed: (){},
                                        fontWeight: FontWeight.bold,  clickable: false,
                                ),),
                                 ],
                                 ),
                                    // Row(
                                    //   children: [
                                    //     Container(child:
                                    //     BaseText(
                                    //       color: Colors.redAccent,
                                    //       text:levelhint,
                                    //       margin: 5,
                                    //       marginh: 10,
                                    //       fontSize: 9,
                                    //       onPressed: (){},
                                    //       fontWeight: FontWeight.bold, clickable: false,
                                    //     ),),
                                    //   ],
                                    // )

                                  ],),
//
                                Container(

                                  alignment: AlignmentDirectional.bottomEnd,
                                  margin: EdgeInsets.all(5),
                                  child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(

                                      child: BaseText(
                                        color: Color(int.parse(RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.contentFontColor.toString())),
                                        text:"${AppSettingTheme.getTheme(context,Config.MEMBERSHIP_DETAILS_KEY,Config.MEMBERSHIP_DETAILS_VALUE,)}",
                                        margin: 5,
                                        marginh: 10,
                                        fontSize: 9,
                                        onPressed: (){
                                          if(kIsWeb){
                                            WebDialog.showMyDialog(WebDialog(title: "",text: "${AppSettingTheme.getTheme(context,Config.SOLD_KEY,Config.SOLD_VALUE,)}",
                                              descriptions: "",customWidget: LevelsPage()),context);
                                          }else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LevelsPage(),
                                              ),
                                            );
                                          }
                                        },
                                        fontWeight: FontWeight.normal, clickable: true,
                                      ),
                                    ),
                                      Icon(size: 10,
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                )
                                  ],
                                ),),

                              ],
                                ),
                        ),

                      ),
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
