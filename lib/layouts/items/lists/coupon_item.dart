import 'package:badges/badges.dart' as b;
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/lists/shadow_coupon_item.dart';

import 'package:bsdealz/network/models/APICoupon.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../../../localization/language_constants.dart';
import '../../../network/HttpAPI.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';

import '../../pages/main/CampaignPage.dart';
import '../buttons/MiniButton.dart';
import '../layouts/main_progress_indicator.dart';
import '../layouts/timer_indicator.dart';
import '../texts/BaseText.dart';

class CouponItem extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;
  String? text;
  final ApiCoupon? coupon;

  CouponItem(
      {Key? key,
      required this.height,
      required this.width,
      this.text,
      this.coupon})
      : super(key: key);
  @override
  _CouponItemState createState() => _CouponItemState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _CouponItemState extends State<CouponItem> {
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

    return
        // GestureDetector(
        //     onTap: (){
        // if (kIsWeb) {
        //   WebDialog.showMyDialog(WebDialog(title: "",
        //       text: "${AppSettingTheme.getTheme(context,Config.DISMISS_KEY,Config.DISMISS_VALUE,)}",
        //       descriptions: "",
        //       customWidget: CampaignPage(campaign: widget.coupon!.campaign,)),
        //       context);
        // } else {
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => CampaignPage(campaign: widget.coupon!.campaign,)));
        // }
        // },
        //     child:
        CouponItemSingle(
            coupon: widget.coupon,
            height: widget.height,
            width: widget.width,
            text: "555");
    // );
  }
}

// Define a custom Form widget.
class CouponItemSingle extends StatefulWidget {
  double height, width;
  final String text;
  final ApiCoupon? coupon;
  CouponItemSingle(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      this.coupon})
      : super(key: key);
  @override
  CouponItemSingleState createState() {
    return CouponItemSingleState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CouponItemSingleState extends State<CouponItemSingle> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MycouponItemForm1State>.
  final _formKey = GlobalKey<FormState>();
  ShapeBorder shapeBorder1 = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(width: 1, color: Colors.grey));
  Widget dCard = Container();
  Widget eCard = Container();
  Widget topCard = Container();
  List<Widget> shadowCards = [];
  Widget earlyBirdCard = Container();
  Widget mainIndecator = Container();
  Widget donationCard = Container();
  Widget addMore = Container();
  Widget viewTickets = Container();
  String code = "";
  String tViewText = "View all tickets";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  initial() {
    addMore = Container(
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
      alignment: Alignment.bottomRight,
      width: 90,
      height: 30,
      child: MiniButton(
          text: getTranslated(context, 'addmore'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CampaignPage(
                          campaign: widget.coupon!.campaign,
                        )));
          },
          isActive: true),
    );
    viewTickets = Container(
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
      alignment: Alignment.bottomRight,
      width: 140,
      height: 30,
      child: MiniButton(
          text: tViewText,
          onPressed: () {
            couponPress();
          },
          isActive: false),
    );
    mainIndecator = Container();
    if (widget.coupon!.campaign!.isCountdown!) {
      mainIndecator = TimerIdicator(
        height: 30,
        criticalValue: 0.6,
        progress: double.parse(widget.coupon!.campaign!.sold.toString()) /
            double.parse(widget.coupon!.campaign!.quantity.toString()),
        campaign: widget.coupon!.campaign!,
      );
    } else {
      Color color = Colors.green;
      double progress = double.parse(widget.coupon!.campaign!.sold.toString()) /
          double.parse(widget.coupon!.campaign!.quantity.toString());
      if (progress >= 0.3 && progress <= 0.6) {
        color = Colors.orange;
      }
      if (progress > 0.6 || progress > 0.6) {
        color = Colors.red;
      }
      mainIndecator = Container(
          alignment: Alignment.centerLeft,
          child: MainProgressIndicator(
            height: 30,
            campagin: widget.coupon!.campaign!,
            criticalValue: 0.6,
            progress: double.parse(widget.coupon!.campaign!.sold.toString()) /
                double.parse(widget.coupon!.campaign!.quantity.toString()),
            color: color,
            scale: 1.0,
          ));
    }
    RefreshApp.of(context)!.apiAppVariables.closedCampaigns!.forEach((element) {
      if (element.id == widget.coupon!.campaignId) {
        mainIndecator = Container(
            alignment: Alignment.centerLeft,
            child: BaseText(
                margin: 5,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11,
                marginh: 5,
                text: "Draw date: ${widget.coupon!.campaign!.drawDate}",
                onPressed: () {},
                clickable: false));
      }
    });

    code = widget.coupon!.code!.replaceAll("O", "");
    code = code.replaceAll("E", "");
    code = code.replaceAll("D", "");
    topCard = SizedBox(
      height: 150,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            // side: BorderSide(color: Colors.green, width: 0.5),
            //   F7F7F7
            //   E8E7E7
            borderRadius: BorderRadius.circular(22)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Ink(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0XFFF7F7F7), Color(0XFFF2F2F2)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(22.0)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: AppIcon(
                                      icon: AppIcon.LOGO_PATH, size: 25)),
                              Row(
                                children: [
                                  BaseText(
                                    color: Colors.black,
                                    text: "${AppSettingTheme.getTheme(
                                      context,
                                      Config.PRIZE_KEY,
                                      Config.PRIZE_VALUE,
                                    )}",
                                    margin: 5,
                                    marginh: 0,
                                    fontSize: 10,
                                    onPressed: () {},
                                    fontWeight: FontWeight.bold,
                                    clickable: false,
                                  ),
                                  BaseText(
                                    color: Colors.grey,
                                    text: widget.coupon!.campaign!.name
                                        .toString(),
                                    margin: 5,
                                    marginh: 3,
                                    fontSize: 10,
                                    onPressed: () {},
                                    fontWeight: FontWeight.normal,
                                    clickable: false,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  BaseText(
                                    color: Colors.black,
                                    text: "${AppSettingTheme.getTheme(
                                      context,
                                      Config.PRICE_KEY,
                                      Config.PRICE_VALUE,
                                    )}",
                                    margin: 5,
                                    marginh: 0,
                                    fontSize: 10,
                                    onPressed: () {},
                                    fontWeight: FontWeight.bold,
                                    clickable: false,
                                  ),
                                  BaseText(
                                    color: Colors.grey,
                                    text: RefreshApp.of(context)!
                                            .apiHeaders
                                            .acceptCurrency
                                            .toString() +
                                        widget.coupon!.campaign!.price
                                            .toString()
                                            .replaceAll(
                                                RegExp(r'([.]*0+)(?!.*\d)'),
                                                ''),
                                    margin: 5,
                                    marginh: 3,
                                    fontSize: 10,
                                    onPressed: () {},
                                    fontWeight: FontWeight.normal,
                                    clickable: false,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  BaseText(
                                    color: Colors.black,
                                    text: AppSettingTheme.getTheme(
                                      context,
                                      Config.PURCHASE_DATE_KEY,
                                      Config.PURCHASE_DATE_VALUE,
                                    ),
                                    margin: 5,
                                    marginh: 0,
                                    fontSize: 10,
                                    onPressed: () {},
                                    fontWeight: FontWeight.bold,
                                    clickable: false,
                                  ),
                                  BaseText(
                                    color: Colors.grey,
                                    text: widget.coupon!.createdAt.toString(),
                                    margin: 5,
                                    marginh: 3,
                                    fontSize: 10,
                                    onPressed: () {},
                                    fontWeight: FontWeight.normal,
                                    clickable: false,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          shape: shapeBorder1,
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            alignment: Alignment.bottomRight,
                            child: PhysicalModel(
                              // elevation: 4.0,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              // shadowColor: Colors.black,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image(
                                    image: CachedNetworkImageProvider(
                                        HttpAPI().BASE_URL +
                                            widget.coupon!.campaign!.image
                                                .toString()),
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
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                  Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: mainIndecator)),
                      BaseText(
                        color: Colors.grey,
                        text: "${AppSettingTheme.getTheme(
                          context,
                          Config.COUPON_NO_KEY,
                          Config.COUPON_NO_VALUE,
                        )}",
                        margin: 5,
                        marginh: 0,
                        fontSize: 9,
                        onPressed: () {},
                        fontWeight: FontWeight.normal,
                        clickable: false,
                      ),
                      BaseText(
                        color: Colors.black,
                        text: "${code + "O"}",
                        margin: 5,
                        marginh: 15,
                        fontSize: 9,
                        onPressed: () {},
                        fontWeight: FontWeight.bold,
                        clickable: false,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isClicked = false;
  double oMargin = 0;
  double eMargin = 10;
  double dMargin = 5;
  double hToAdd = 0;
  int counter = 0;
  couponPress() {
    shadowCards = [];
    if (!isClicked) {
      print("checked--------");
      isClicked = true;

      RefreshApp.of(context)!.apiAppVariables.userCoupons!.forEach((element) {
        if (element.campaign!.id == widget.coupon!.campaign!.id &&
            element.code != widget.coupon!.code) {
          counter++;
          dMargin = dMargin + 45;
          print("hToAdd=" + hToAdd.toString());
          dCard = Container(
              margin: EdgeInsets.only(top: dMargin),
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                  height: 140,
                  child: ShadowCoupnItem(
                    coupon: element,
                    height: 160,
                    width: 1,
                  )));
          shadowCards.add(dCard);
        }
      });
      List<Widget> temp = [];
      // shadowCards.clear();
      shadowCards.reversed.forEach((element) {
        temp.add(element);
      });
      shadowCards = temp;
      print("shadowCards length" + shadowCards.length.toString());
      tViewText = "close";
      isClicked = true;
      widget.height = 150 + dMargin + eMargin;
      print("Height1=" + widget.height.toString());
    } else {
      hToAdd = 0;
      dMargin = 5;
      eMargin = 10;
      widget.height = 150 + dMargin + eMargin;
      print("Height2=" + widget.height.toString());
      isClicked = false;
      dCard = Container();

      tViewText = "View all tickets";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double radius = 21;
    // Build a Form widget using the _formKey created above.
    initial();

    Widget coupon = Wrap(//height: widget.height,
        children: [
      InkWell(
        onTap: () {
          couponPress();
        },
        child: Container(
          height: widget.height + 35,
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 1, top: 8),
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Stack(
                    children: shadowCards,
                  ),
                  Container(height: 150, child: topCard)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  viewTickets,
                  addMore,
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
    counter = 0;
    RefreshApp.of(context)!.apiAppVariables.userCoupons!.forEach((element) {
      if (element.campaign!.id == widget.coupon!.campaign!.id) {
        counter++;
      }
    });
    if (counter > 0) {
      coupon = b.Badge(
        badgeContent: Text(
          counter.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
        ),
        borderRadius: BorderRadius.circular(20),
        shape: b.BadgeShape.circle,
        padding: const EdgeInsets.all(4),
        position: b.BadgePosition.topEnd(top: 10, end: 15),
        badgeColor: Colors.red,
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: coupon,
        ),
      );
    }
    return coupon;
  }
}
