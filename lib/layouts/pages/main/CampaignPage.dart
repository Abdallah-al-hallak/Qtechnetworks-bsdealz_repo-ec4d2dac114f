import 'dart:async';

import 'package:bsdealz/layouts/dialogs/main_dialog.dart';
import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/layouts/add_to_cart_button.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/items/texts/SettingText.dart';
import 'package:bsdealz/layouts/items/texts/SubTitleText.dart';
import 'package:bsdealz/network/models/APICampaign.dart';
import 'package:bsdealz/network/models/APICart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../network/HttpAPI.dart';
import '../../../network/models/APICartItem.dart';
import '../../../network/models/APIUser.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../../utils/sharedprefs.dart';
import '../../items/buttons/AddMoreBtn.dart';
import '../../items/buttons/Button1.dart';
import '../../items/buttons/LikeButton.dart';
import '../../items/buttons/MiniButton.dart';
import '../../items/buttons/ToggleBtn.dart';
import '../../items/icons/AppIcon.dart';
import '../../items/layouts/campaign_slider.dart';
import '../../items/layouts/main_progress_indicator.dart';
import '../../items/layouts/timer_indicator.dart';
import '../../items/lists/campaign_item.dart';
import '../../items/lists/cart_item.dart';
import '../../items/lists/web/campaign_item_web.dart';
import '../../items/textboxes/CustomTextbox.dart';
import '../../items/texts/BaseText.dart';
import '../../items/texts/TitleText.dart';
import '../../items/tobars/back_bar.dart';
import '../credentials/login.dart';

class CampaignPage extends StatefulWidget {
  ApiCampaign? campaign;
  CampaignPage({
    Key? key,
    required this.campaign,
  }) : super(key: key);

  @override
  _CampaignPageState createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //RefreshApp.of(context)!.localCart.items!.clear();
    resetCampaigns();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    // RefreshApp.of(context)!.localCart.items!.clear();
    // RefreshApp.of(context)!.activeCampaignWidgets.clear();
    // RefreshApp.of(context)!.apiAppVariables!.activeCampaigns!.forEach((element) {
    //   if (kIsWeb) {
    //     RefreshApp.of(context)!.activeCampaignWidgets.add(CampaignItemWeb(
    //       mycampagin: element, height: 350, width: 1,
    //     ));
    //   } else {
    //     RefreshApp.of(context)!.activeCampaignWidgets.add(CampaignItem(
    //
    //       mycampagin: element, height: 555, width: 1,
    //     ));
    //   }
    // });
    // MyApp.refreshApp(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int quantity = 1;
  bool updatefinished = true;

  resetCampaigns() {
    //RefreshApp.of(context)!.localCart.items!.clear();
    RefreshApp.of(context)!.activeCampaignWidgets.clear();
    RefreshApp.of(context)!.apiAppVariables.activeCampaigns!.forEach((element) {
      if (kIsWeb) {
        RefreshApp.of(context)!.activeCampaignWidgets.add(CampaignItemWeb(
              mycampagin: element,
              height: 350,
              width: 1,
            ));
      } else {
        RefreshApp.of(context)!.activeCampaignWidgets.add(CampaignItem(
              mycampagin: element,
              height: 555,
              width: 1,
            ));
      }
    });
    //MyApp.refreshApp(context);
  }

  bool isPrizeDetailsFocused = true;
  @override
  Widget build(BuildContext context) {
    RefreshApp.of(context)!.localCart.items!.forEach((element) {
      if (widget.campaign!.id == element.campaign!.id) {
        widget.campaign != element;
      }
    });

    print("-------Reloading View CampaignPage frag");
    for (int i = 0; i < RefreshApp.of(context)!.localCart.items!.length; i++) {
      if (RefreshApp.of(context)!.localCart.items!.elementAt(i).campaignId ==
          widget.campaign!.id) {
        quantity =
            RefreshApp.of(context)!.localCart.items!.elementAt(i).quantity!;
      }
    }

    double width = MediaQuery.of(context).size.width;
    if (kIsWeb) {
      width = 500;
    }
    Widget mainIndecator = Container();
    Widget gallery = Container();
    if (widget.campaign!.isCountdown!) {
      mainIndecator = TimerIdicator(
        height: 30,
        criticalValue: 0.6,
        progress: 0.2,
        campaign: widget.campaign!,
      );
    } else {
      Color color = Colors.green;
      double progress = double.parse(widget.campaign!.sold.toString()) /
          double.parse(widget.campaign!.quantity.toString());
      if (progress >= 0.3 && progress <= 0.6) {
        color = Colors.orange;
      }
      if (progress > 0.6 || progress > 0.6) {
        color = Colors.red;
      }
      mainIndecator = MainProgressIndicator(
        height: 50,
        campagin: widget.campaign!,
        criticalValue: 0.6,
        progress: 0.2,
        color: color,
        scale: 1.0,
      );
    }
    mainIndecator = Container(
        margin: EdgeInsets.all(10),
        alignment: AlignmentDirectional.topStart,
        child: mainIndecator);
    Widget content = Container();
    Widget prizeWidget = ListView(
      children: [
        mainIndecator,
        SubTitleText(
            text: widget.campaign!.name.toString(),
            onPressed: () {},
            clickable: false),
        BaseText(
          color: Color(0XFF707070),
          text: widget.campaign!.description.toString(),
          margin: 10,
          marginh: 20,
          fontSize: 9,
          onPressed: () {},
          fontWeight: FontWeight.bold,
          clickable: false,
        ),
      ],
    );
    Widget productWidget = ListView(
      children: [
        SubTitleText(
            text: widget.campaign!.products!.first.productName.toString(),
            onPressed: () {},
            clickable: false),
        BaseText(
          color: Color(0XFF707070),
          text: widget.campaign!.products!.first.productDescription.toString(),
          margin: 10,
          marginh: 20,
          fontSize: 9,
          onPressed: () {},
          fontWeight: FontWeight.bold,
          clickable: false,
        ),
      ],
    );
    if (widget.campaign!.images!.length > 0) {
      gallery = CampaignSlider(
        isRadius: true,
        height: 300,
        images: widget.campaign!.images!,
      );
    } else {
      gallery = Image(
        image: CachedNetworkImageProvider(
            HttpAPI().BASE_URL + widget.campaign!.image.toString()),
        alignment: Alignment.center,
        fit: BoxFit.contain,
        //  width: double.infinity,
      );
    }
    Color wtextColr = Colors.grey[500]!;
    Color wbuttonColor = Colors.grey[300]!;
    Color dtextColr = Theme.of(context).primaryColor;
    Color dbuttonColor = Colors.grey[200]!;
    content = prizeWidget;
    if (!isPrizeDetailsFocused) {
      content = productWidget;
      dtextColr = Colors.grey[500]!;
      dbuttonColor = Colors.grey[300]!;
      wtextColr = Theme.of(context).primaryColor;
      wbuttonColor = Colors.grey[200]!;
    }
    ShapeBorder shapeBorder1 = RoundedRectangleBorder(
        // side: BorderSide(color: Colors.green, width: 0.5),
        borderRadius: BorderRadius.circular(19));
    bool isLiked = false;
    if (RefreshApp.of(context)!.isLogin) {
      RefreshApp.of(context)!.apiAppVariables.wishList!.forEach((element) {
        if (element.campaignId == widget.campaign!.id) {
          isLiked = true;
        }
      });
    }
    shapeBorder1 = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(9)),
        side: BorderSide(width: 1, color: Colors.grey[300]!));

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              BackBar(
                height: 40,
                title: "",
                notificationsNumber: 0,
                showCart: true,
              ),
              Stack(
                children: [
                  Container(
                    child: PhysicalModel(
                      // elevation: 4.0,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      // shadowColor: Colors.black,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(21),
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 10, right: 20, left: 20, bottom: 15),
                          height: 210,
                          child: gallery,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(15),
                      alignment: Alignment.topRight,
                      child: LikeButton(
                          isActive: isLiked,
                          campaignId: int.parse(
                            widget.campaign!.id.toString(),
                          )))
                ],
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Card(
                  elevation: 0,
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      // side: BorderSide(color: Colors.green, width: 0.5),
                      borderRadius: BorderRadius.circular(28)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ToggleButton(
                          isfilled: true,
                          isGradient: false,
                          isActive: false,
                          iconColor: Colors.white,
                          color: dbuttonColor,
                          height: 40,
                          text: "Prize details",
                          icon: Icons.home,
                          textColor: dtextColr,
                          padding: 5,
                          iconpadding: 5,
                          margin: 0,
                          radius: 21,
                          fontSize: 14,
                          ovalpadding: 4,
                          onPressed: () {
                            setState(() {
                              isPrizeDetailsFocused = true;
                            });
                          },
                          width: width / 2 - 10,
                          startColor: Color(0XffF73F50),
                          endColor: Color(0XffC31322),
                        ),
                      ),
                      Container(
                        child: ToggleButton(
                          isfilled: true,
                          isGradient: false,
                          isActive: false,
                          iconColor: Colors.white,
                          color: wbuttonColor,
                          height: 40,
                          text: "Product details",
                          icon: Icons.home,
                          textColor: wtextColr,
                          padding: 5,
                          iconpadding: 5,
                          margin: 0,
                          radius: 21,
                          fontSize: 14,
                          ovalpadding: 4,
                          onPressed: () {
                            setState(() {
                              isPrizeDetailsFocused = false;
                            });
                          },
                          width: width / 2 - 10,
                          startColor: Color(0XffF73F50),
                          endColor: Color(0XffC31322),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 10), child: content)),
              Container(
                color: Colors.grey,
                height: 1,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 5, bottom: 5, left: 30, right: 10),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppIcon(
                                        icon: AppIcon.CALENDAR_PATH, size: 18),
                                    BaseText(
                                      color: Color(0XFF707070),
                                      text: "Max draw date: " +
                                          widget.campaign!.drawDate.toString(),
                                      margin: 10,
                                      marginh: 5,
                                      fontSize: 9,
                                      onPressed: () {},
                                      fontWeight: FontWeight.bold,
                                      clickable: false,
                                    )
                                  ],
                                ),
                              ),
                              SubTitleText(
                                  text:
                                      "Buy ${widget.campaign!.products!.first.productName}",
                                  onPressed: () {},
                                  clickable: false),
                              BaseText(
                                color: Colors.black,
                                text:
                                    " ${RefreshApp.of(context)!.apiHeaders.acceptCurrency}${widget.campaign!.price.toString().replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), '')}",
                                margin: 5,
                                marginh: 20,
                                fontSize: 25,
                                onPressed: () {},
                                fontWeight: FontWeight.bold,
                                clickable: false,
                              ),
                              AddToCartButton(
                                campaign: widget.campaign!,
                                height: 60,
                              )
                            ],
                          ),
                        ),

                        // Container(
                        //   width: 150,
                        //   margin: EdgeInsets.only(top: 5,bottom: 5),
                        //   alignment: Alignment.topCenter,
                        //   child: MiniButton(text: "Add to cart",onPressed: (){
                        //     if( RefreshApp.of(context)!.isLogin) {
                        //       addToCart();
                        //     }else{
                        //       MainDialog.showMyDialog(MainDialog(title: "Failed",text: "Dismiss",
                        //         descriptions: "Please login First",type: DialogType.ERROR,customWidget: Button1(onPressed: (){
                        //           Navigator.pushReplacement(context, MaterialPageRoute(
                        //               builder: (context) => Login(destination: '1',)));
                        //         }, text: "Login", hasIcon: false, color: Colors.red, fontColor: Colors.white),),context);
                        //
                        //     }
                        //
                        //   },isActive: true),)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
