
import 'dart:async';

import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';

import 'package:bsdealz/layouts/items/layouts/main_progress_indicator.dart';
import 'package:bsdealz/layouts/items/layouts/timer_indicator.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/network/models/APICampaign.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../../network/HttpAPI.dart';
import '../../../../network/models/APICart.dart';
import '../../../../utils/Config.dart';
import '../../../../utils/GetSettingByKey.dart';
import '../../../dialogs/main_dialog.dart';
import '../../../dialogs/web_dialog.dart';
import '../../../pages/credentials/login.dart';
import '../../../pages/main/CampaignPage.dart';
import '../../buttons/Button1.dart';
import '../../buttons/LikeButton.dart';
import '../../buttons/MiniButton.dart';
import '../../layouts/campaign_slider.dart';
import '../../texts/BaseText.dart';

class CampaignItemWeb extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;
  String? text;
  final ApiCampaign? mycampagin;

  CampaignItemWeb({Key? key, required this.height, required this.width, this.text, this.mycampagin}) : super(key: key);
  @override
  _CampaignItemWebState createState() => _CampaignItemWebState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height!);
}

class _CampaignItemWebState extends State<CampaignItemWeb> {
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
      if (kIsWeb) {
        WebDialog.showMyDialog(WebDialog(title: "",
          text: AppSettingTheme.getTheme(context,Config.DISMISS_KEY,Config.DISMISS_VALUE,),
          descriptions: "",
          customWidget:  CampaignPage(campaign: widget.mycampagin!,),),
            context);
      } else {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CampaignPage(campaign: widget.mycampagin!,)));
      }
          },
          child:CampaignItemWebSingle(height: widget.height,width: widget.width,text: widget.mycampagin!.name.toString(),mycampagin: widget.mycampagin!,)

      );
  }


}
// Define a custom Form widget.
class CampaignItemWebSingle extends StatefulWidget {
  final double height,width;
  final String text;
  final ApiCampaign mycampagin;
  const CampaignItemWebSingle({Key? key,required  this.height,required this.width,required this.text,required this.mycampagin}) : super(key: key);
  @override
  CampaignItemWebSingleState createState() {
    return CampaignItemWebSingleState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CampaignItemWebSingleState extends State<CampaignItemWebSingle> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCampaignItemWebForm1State>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double radius=21;
    // Build a Form widget using the _formKey created above.
    bool isTimerOn=false;
    bool isGallery=true;
    Widget mainIndecator=Container();
    Widget gallery=Container();
    if(widget.mycampagin.isCountdown!){
      mainIndecator=TimerIdicator(height: 30,criticalValue: 0.6,progress:double.parse(widget.mycampagin.sold.toString())/double.parse(widget.mycampagin.quantity.toString()), campaign: widget.mycampagin,);
    }else{
      Color color=Colors.green;
      double progress= double.parse(widget.mycampagin!.sold.toString())/double.parse(widget.mycampagin!.quantity.toString());
      if(progress>=0.3&&progress<=0.6){
        color=Colors.orange;
      }
      if(progress>0.6||progress>0.6){
        color=Colors.red!;
      }
      mainIndecator=MainProgressIndicator(height: 50,campagin: widget.mycampagin,criticalValue: 0.6,progress:double.parse(widget.mycampagin.sold.toString())/double.parse(widget.mycampagin.quantity.toString()),color:color ,scale: 1.0,);

    }
    if(widget.mycampagin.images!.length>0){
      gallery=     CampaignSlider(isRadius:true,height: 300, images:widget.mycampagin.images!,);
    }else{
      gallery= Image(
        image:CachedNetworkImageProvider(
            HttpAPI().BASE_URL+widget.mycampagin.image.toString()),
        alignment: Alignment.center,
        fit: BoxFit.contain,
        //  width: double.infinity,
      );


    }

    bool isLiked=false;
    if(RefreshApp.of(context)!.isLogin) {
      RefreshApp.of(context)!.apiAppVariables.wishList!.forEach((element) {
        if(element.campaignId==widget.mycampagin.id){
          isLiked=true;
        }
      });
    }
    Widget earlyBirdWidget=Container();
    if(widget.mycampagin!.earlyBirdQuantity!>0){
      earlyBirdWidget=Container(
        margin: EdgeInsets.only(top: 5,bottom: 0,left: 30,right: 10),
        alignment: Alignment.centerLeft,
        child: Row(children: [
          FooterText(text: "${AppSettingTheme.getTheme(context,Config.EARLY_BIRD_ACTIVE_KEY,Config.EARLY_BIRD_ACTIVE_VALUE,)}", onPressed: (){}, clickable: false)
        ],),
      );
    }
    return

      SizedBox(height: widget.height,
        child: Container(padding:EdgeInsets.only(left: 8,right: 8,bottom: 1,top: 8),alignment: Alignment.center,
          child: Card(
            elevation: 5,
            shape:RoundedRectangleBorder(
              // side: BorderSide(color: Colors.green, width: 0.5),
                borderRadius: BorderRadius.circular(21)),
            child: Stack(
                children: <Widget>[

                  Row(
                    children: [
                      Container(
                        child: PhysicalModel(
                          // elevation: 4.0,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          // shadowColor: Colors.black,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(radius),
                            child: Container(
                              margin: EdgeInsets.only(top:55,right: 20,left: 20,bottom: 15),
                              height: 210,
                              width: 400,
                              child: gallery,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(height: 40,),
                            BaseText(
                              color: Theme.of(context).primaryColor,
                              text:widget.mycampagin.name.toString(),
                              margin: 10,
                              marginh: 25,
                              fontSize: 35,
                              onPressed: (){},
                              fontWeight: FontWeight.bold, clickable: false,
                            ),
                            BaseText(
                              color: Colors.black,
                              text:"${AppSettingTheme.getTheme(context,Config.BUY_KEY,Config.BUY_VALUE,)} "+widget.mycampagin.products!.first.productName.toString()+"${AppSettingTheme.getTheme(context,Config.FOR_KEY,Config.FOR_VALUE,)}",
                              margin: 5,
                              marginh: 25,
                              fontSize: 16,
                              onPressed: (){},
                              fontWeight: FontWeight.normal, clickable: false,
                            ),
                            BaseText(
                              color: Colors.black,
                              text:widget.mycampagin.price.toString().replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), '')+" "+RefreshApp.of(context)!.apiHeaders.acceptCurrency.toString(),
                              margin: 5,
                              marginh: 25,
                              fontSize: 25,
                              onPressed: (){},
                              fontWeight: FontWeight.bold, clickable: false,
                            ),

                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.bottomRight,
                                  child: PhysicalModel(
                                    // elevation: 4.0,
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    // shadowColor: Colors.black,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        child:Image(
                                          image:CachedNetworkImageProvider(
                                              HttpAPI().BASE_URL+widget.mycampagin.products!.first.productImage.toString()),
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,
                                          //  width: double.infinity,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20,bottom: 5),
                                  alignment: Alignment.bottomCenter,
                                  child: MainButton(text: "${AppSettingTheme.getTheme(context,Config.VIEW_PRIZE_KEY,Config.VIEW_PRIZE_VALUE,)}",onPressed: (){
                                    if (kIsWeb) {
                                      WebDialog.showMyDialog(WebDialog(title: "",
                                        text: "${AppSettingTheme.getTheme(context,Config.DISMISS_KEY,Config.DISMISS_VALUE,)}",
                                        descriptions: "",
                                        customWidget:  CampaignPage(campaign: widget.mycampagin!,),),
                                          context);
                                    } else {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CampaignPage(campaign: widget.mycampagin!,)));
                                     }
                                  },isActive: false),),
                                Container(
                                  margin: EdgeInsets.only(top: 20,bottom: 5),
                                  alignment: Alignment.bottomCenter,
                                  child: MainButton(text: "${AppSettingTheme.getTheme(context,Config.ADD_TO_CART_KEY,Config.ADD_TO_CART_VALUE,)}",onPressed: (){

                                    if( RefreshApp.of(context)!.isLogin) {
                                      addToCart();
                                    }else{
                                      MainDialog.showMyDialog(MainDialog(title: "${AppSettingTheme.getTheme(context,Config.FAILED_KEY,Config.FAILED_VALUE,)}",text: "${AppSettingTheme.getTheme(context,Config.DISMISS_KEY,Config.DISMISS_VALUE,)}",
                                        descriptions: "${AppSettingTheme.getTheme(context,Config.PLEASE_LOGIN_KEY,Config.PLEASE_LOGIN_VALUE,)}",type: DialogType.ERROR,customWidget: Button1(onPressed: (){
                                          Navigator.pushReplacement(context, MaterialPageRoute(
                                              builder: (context) => Login(destination: '1',)));
                                        }, text: "${AppSettingTheme.getTheme(context,Config.LOGIN_KEY,Config.LOGIN_VALUE,)}", hasIcon: false, color: Colors.red, fontColor: Colors.white),),context);

                                    }
                                  },isActive: true),),
                                Container(
                                  margin: EdgeInsets.only(top: 5,bottom: 5,left: 30,right: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Row(children: [
                                    AppIcon(icon: AppIcon.CALENDAR_PATH, size: 25),
                                    FooterText(text: "${AppSettingTheme.getTheme(context,Config.MAX_DRAW_DATE_KEY,Config.MAX_DRAW_DATE_VALUE,)}"+widget.mycampagin.drawDate.toString(), onPressed: (){}, clickable: false)

                                  ],),
                                )

                              ],
                            ),
                            earlyBirdWidget
                          ],),
                      ),
                    ],
                  ),

                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(

                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(20),
                              alignment: AlignmentDirectional.topStart,
                              child:mainIndecator
                          ),
                        ),
                        Container(

                            margin: EdgeInsets.all(15),
                            alignment: Alignment.topRight,
                            child: LikeButton(isActive: isLiked,campaignId:int.parse(widget.mycampagin.id.toString(),)))
                      ],
                    ),
                  ),





                ]
            ),
          ),
        ),
      );

  }
  addToCart(){
    HttpAPI http=HttpAPI();
    Dio dio=http.Inisalize(context);
    return dio.post('addtocart',data: { "campaign_id":widget.mycampagin.id,
      "quantity":"1"}).then((value) {
      setState(() {
        MainDialog.showMyDialog(MainDialog(title: "${AppSettingTheme.getTheme(context,Config.ADD_TO_CART_KEY,Config.ADDED_TO_CART_VALUE,)}",text: "${AppSettingTheme.getTheme(context,Config.CONTINUE_SHOPPING_KEY,Config.CONTINUE_SHOPPING_VALUE,)}",
          descriptions: "${AppSettingTheme.getTheme(context,Config.ITEM_ADDED_KEY,Config.ITEM_ADDED_VALUE,)}",type: DialogType.SUCCESS,customWidget: Container(),),context);
        if(value.data['status']=='success'){
          ApiCart cart=ApiCart.fromJson(value.data['data']);
          setState(() {
            RefreshApp.of(context)!.apiAppVariables.cart=cart;
          });
          MyApp.refreshApp(context);
        }
      });
    });
  }
}
