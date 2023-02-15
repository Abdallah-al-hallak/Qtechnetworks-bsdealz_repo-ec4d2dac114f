import 'package:bsdealz/layouts/items/icons/AppIcon.dart';

import 'package:bsdealz/network/models/APICoupon.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../../../network/HttpAPI.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../texts/BaseText.dart';

class ShadowCoupnItem extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;
  String? text;
  final ApiCoupon? coupon;

  ShadowCoupnItem(
      {Key? key,
      required this.height,
      required this.width,
      this.text,
      this.coupon})
      : super(key: key);
  @override
  _ShadowCoupnItemState createState() => _ShadowCoupnItemState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _ShadowCoupnItemState extends State<ShadowCoupnItem> {
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
        Container(
            //      height: widget.height,
            child: ShadowCoupnItemSingle(
                coupon: widget.coupon,
                height: widget.height,
                width: widget.width,
                text: "555"));
    // );
  }
}

// Define a custom Form widget.
class ShadowCoupnItemSingle extends StatefulWidget {
  double height, width;
  final String text;
  final ApiCoupon? coupon;
  ShadowCoupnItemSingle(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      this.coupon})
      : super(key: key);
  @override
  ShadowCoupnItemSingleState createState() {
    return ShadowCoupnItemSingleState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ShadowCoupnItemSingleState extends State<ShadowCoupnItemSingle> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyShadowCoupnItemForm1State>.
  final _formKey = GlobalKey<FormState>();
  ShapeBorder shapeBorder1 = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(width: 1, color: Colors.grey));
  Widget card = Container();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  initial() {
    card = Container(
      height: 150,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            // side: BorderSide(color: Colors.green, width: 0.5),
            //   F7F7F7
            //   E8E7E7
            borderRadius: BorderRadius.circular(22)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0XFFF7F7F7), Color(0XFFF2F2F2)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(22.0)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
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
                                    text: "${AppSettingTheme.getTheme(
                                      context,
                                      Config.PURCHASE_DATE_KEY,
                                      Config.PURCHASE_DATE_VALUE,
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
                      Container(
                        height: 100,
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          shape: shapeBorder1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.bottomRight,
                            child: PhysicalModel(
                              // elevation: 4.0,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              // shadowColor: Colors.black,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
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
                          child: Row(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: BaseText(
                                color: Colors.black,
                                text: "${AppSettingTheme.getTheme(
                                  context,
                                  Config.PURCHASE_DATE_KEY,
                                  Config.PURCHASE_DATE_VALUE,
                                )}",
                                margin: 5,
                                marginh: 0,
                                fontSize: 10,
                                onPressed: () {},
                                fontWeight: FontWeight.bold,
                                clickable: false,
                              )),
                          BaseText(
                            color: Colors.grey,
                            text: widget.coupon!.createdAt.toString(),
                            margin: 5,
                            marginh: 3,
                            fontSize: 10,
                            onPressed: () {},
                            fontWeight: FontWeight.normal,
                            clickable: false,
                          )
                        ],
                      )),
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
                        text: "${widget.coupon!.code}",
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

  @override
  Widget build(BuildContext context) {
    double radius = 21;
    // Build a Form widget using the _formKey created above.
    initial();

    return card;
  }
}
