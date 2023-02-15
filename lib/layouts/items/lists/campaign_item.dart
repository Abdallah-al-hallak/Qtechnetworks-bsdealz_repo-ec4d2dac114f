import 'package:bsdealz/layouts/items/icons/AppIcon.dart';

import 'package:bsdealz/layouts/items/layouts/main_progress_indicator.dart';
import 'package:bsdealz/layouts/items/layouts/timer_indicator.dart';
import 'package:bsdealz/layouts/items/lists/web/campaign_item_web.dart';

import 'package:bsdealz/network/models/APICampaign.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../network/HttpAPI.dart';

import '../../../network/models/APICart.dart';
import '../../../network/models/APICartItem.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../dialogs/main_dialog.dart';
import '../../dialogs/web_dialog.dart';

import '../../pages/main/CampaignPage.dart';

import '../buttons/LikeButton.dart';

import '../layouts/JustLaunched.dart';
import '../layouts/add_to_cart_button.dart';
import '../layouts/campaign_slider.dart';
import '../texts/BaseText.dart';

class CampaignItem extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;
  String? text;
  final ApiCampaign? mycampagin;

  CampaignItem(
      {Key? key,
      required this.height,
      required this.width,
      this.text,
      this.mycampagin})
      : super(key: key);
  @override
  _CampaignItemState createState() => _CampaignItemState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _CampaignItemState extends State<CampaignItem> {
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
    return GestureDetector(
        onTap: () {
          if (kIsWeb) {
            WebDialog.showMyDialog(
                WebDialog(
                    title: "",
                    text: "${AppSettingTheme.getTheme(
                      context,
                      Config.DISMISS_KEY,
                      Config.DISMISS_VALUE,
                    )}",
                    descriptions: "",
                    customWidget: CampaignPage(
                      campaign: widget.mycampagin!,
                    )),
                context);
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CampaignPage(
                          campaign: widget.mycampagin!,
                        )));
          }
        },
        child: CampaignItemSingle(
          height: widget.height,
          width: widget.width,
          text: widget.mycampagin!.name.toString(),
          mycampagin: widget.mycampagin!,
        ));
  }
}

// Define a custom Form widget.
class CampaignItemSingle extends StatefulWidget {
  final double height, width;
  final String text;
  final ApiCampaign mycampagin;
  const CampaignItemSingle(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      required this.mycampagin})
      : super(key: key);
  @override
  CampaignItemSingleState createState() {
    return CampaignItemSingleState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CampaignItemSingleState extends State<CampaignItemSingle> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCampaignItemForm1State>.
  final _formKey = GlobalKey<FormState>();

  int quantity = 1;
  bool updatefinished = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double radius = 21;
    print("-------CampaignItemSingleState View reload");
    // Build a Form widget using the _formKey created above.
    bool isTimerOn = false;
    bool isGallery = true;
    for (int i = 0; i < RefreshApp.of(context)!.localCart.items!.length; i++) {
      if (RefreshApp.of(context)!.localCart.items!.elementAt(i).campaignId ==
          widget.mycampagin.id) {
        quantity =
            RefreshApp.of(context)!.localCart.items!.elementAt(i).quantity!;
        print("-------CampaignItemSingleState View quantity " +
            quantity.toString());
      }
    }

    Widget mainIndecator = Container();
    Widget gallery = Container();
    if (widget.mycampagin.isCountdown!) {
      mainIndecator = TimerIdicator(
        height: 30,
        criticalValue: 0.6,
        progress: double.parse(widget.mycampagin.sold.toString()) /
            double.parse(widget.mycampagin.quantity.toString()),
        campaign: widget.mycampagin,
      );
    } else {
      Color color = Colors.green;
      double progress = double.parse(widget.mycampagin.sold.toString()) /
          double.parse(widget.mycampagin.quantity.toString());
      if (progress >= 0.3 && progress <= 0.6) {
        color = Colors.orange;
      }
      if (progress > 0.6 || progress > 0.6) {
        color = Colors.red;
      }
      mainIndecator = MainProgressIndicator(
        height: 50,
        campagin: widget.mycampagin,
        criticalValue: 0.6,
        progress: double.parse(widget.mycampagin.sold.toString()) /
            double.parse(widget.mycampagin.quantity.toString()),
        color: color,
        scale: 1.0,
      );
    }
    if (widget.mycampagin.images!.length > 0) {
      gallery = CampaignSlider(
        isRadius: true,
        height: 300,
        images: widget.mycampagin.images!,
      );
    } else {
      gallery = Image(
        image: CachedNetworkImageProvider(
            HttpAPI().BASE_URL + widget.mycampagin.image.toString()),
        alignment: Alignment.center,
        fit: BoxFit.contain,
        //  width: double.infinity,
      );
    }
    double width = MediaQuery.of(context).size.width;
    if (kIsWeb) {
      width = 400;
    }
    bool isLiked = false;

    if (RefreshApp.of(context)!.isLogin) {
      RefreshApp.of(context)!.apiAppVariables.wishList!.forEach((element) {
        if (element.campaignId == widget.mycampagin.id) {
          isLiked = true;
        }
      });
    }
    Widget earlyBirdWidget = Container();
    Widget justLaunchedWidget = Container();

    if (widget.mycampagin.earlyBirdQuantity! > 0) {
      earlyBirdWidget = Container(
        height: 50,
        margin: EdgeInsets.only(top: 5, bottom: 0, left: 30, right: 10),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            AppIcon(icon: AppIcon.BIRD_PATH, size: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BaseText(
                  color: Colors.black,
                  text: "${AppSettingTheme.getTheme(
                    context,
                    Config.EARLY_BIRD_ACTIVE_KEY,
                    Config.EARLY_BIRD_ACTIVE_VALUE,
                  )}",
                  margin: 5,
                  marginh: 5,
                  fontSize: 12,
                  onPressed: () {},
                  fontWeight: FontWeight.bold,
                  clickable: false,
                ),
                BaseText(
                  color: Colors.black,
                  text: "Get extra coupon when early bird is active",
                  margin: 2,
                  marginh: 5,
                  fontSize: 11,
                  onPressed: () {},
                  fontWeight: FontWeight.normal,
                  clickable: false,
                )
              ],
            ),
          ],
        ),
      );
      justLaunchedWidget = Container(
        margin: EdgeInsets.only(top: 180),
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  height: 45,
                  margin: EdgeInsets.all(20),
                  alignment: AlignmentDirectional.center,
                  child: JustLaunched(
                    height: 40,
                  )),
            ),
          ],
        ),
      );
    }

    ScrollController _scrollController = ScrollController();
    return SizedBox(
      height: widget.height,
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, bottom: 1, top: 8),
        alignment: Alignment.center,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              // side: BorderSide(color: Colors.green, width: 0.5),
              borderRadius: BorderRadius.circular(21)),
          child: Stack(children: <Widget>[
            Column(
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
                        margin: EdgeInsets.only(
                            top: 55, right: 20, left: 20, bottom: 15),
                        height: 210,
                        width: width,
                        child: gallery,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BaseText(
                            color: Theme.of(context).primaryColor,
                            text: "WIN",
                            margin: 10,
                            marginh: 25,
                            fontSize: 20,
                            onPressed: () {},
                            fontWeight: FontWeight.bold,
                            clickable: false,
                            fontStyle: FontStyle.italic,
                          ),
                          BaseText(
                            color: Colors.black,
                            text: widget.mycampagin.name.toString(),
                            margin: 0,
                            marginh: 25,
                            fontSize: 20,
                            onPressed: () {},
                            fontWeight: FontWeight.bold,
                            clickable: false,
                            fontStyle: FontStyle.italic,
                          ),
                          BaseText(
                            color: Colors.black,
                            text: "${AppSettingTheme.getTheme(
                                  context,
                                  Config.BUY_KEY,
                                  Config.BUY_VALUE,
                                )}" +
                                widget.mycampagin.products!.first.productName
                                    .toString() +
                                "${AppSettingTheme.getTheme(
                                  context,
                                  Config.FOR_KEY,
                                  Config.FOR_VALUE,
                                )}",
                            margin: 5,
                            marginh: 25,
                            fontSize: 13,
                            onPressed: () {},
                            fontWeight: FontWeight.normal,
                            clickable: false,
                          ),
                          BaseText(
                            color: Colors.black,
                            text: RefreshApp.of(context)!
                                    .apiHeaders
                                    .acceptCurrency
                                    .toString() +
                                "" +
                                widget.mycampagin.price.toString().replaceAll(
                                    RegExp(r'([.]*0+)(?!.*\d)'), ''),
                            margin: 3,
                            marginh: 25,
                            fontSize: 15,
                            onPressed: () {},
                            fontWeight: FontWeight.bold,
                            clickable: false,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.bottomRight,
                      child: PhysicalModel(
                        elevation: 2.0,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        shadowColor: Colors.black,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 80,
                            height: 80,
                            child: Image(
                              image: CachedNetworkImageProvider(HttpAPI()
                                      .BASE_URL +
                                  widget.mycampagin.products!.first.productImage
                                      .toString()),
                              alignment: Alignment.center,
                              fit: BoxFit.contain,
                              //  width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Transform.scale(
                    scale: 0.9,
                    child: AddToCartButton(
                        height: 60,
                        campaign: widget.mycampagin)), //addToCartWidget
                Container(
                  height: 1,
                  color: Colors.grey[400],
                  margin: EdgeInsets.only(top: 5, bottom: 15),
                  alignment: Alignment.bottomCenter,
                ),
                Container(
                  height: 50,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    controller: _scrollController,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      controller: _scrollController,
                      children: [
                        earlyBirdWidget,
                        Container(
                            height: 50,
                            margin: EdgeInsets.only(
                                top: 5, bottom: 5, left: 30, right: 10),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                AppIcon(icon: AppIcon.CALENDAR_PATH, size: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BaseText(
                                      color: Colors.black,
                                      text: "${AppSettingTheme.getTheme(
                                            context,
                                            Config.MAX_DRAW_DATE_KEY,
                                            Config.MAX_DRAW_DATE_VALUE,
                                          )}" +
                                          widget.mycampagin.drawDate.toString(),
                                      margin: 5,
                                      marginh: 5,
                                      fontSize: 12,
                                      onPressed: () {},
                                      fontWeight: FontWeight.bold,
                                      clickable: false,
                                    ),
                                    BaseText(
                                      color: Colors.black,
                                      text:
                                          "Or when tickets are sold out whichever comes first",
                                      margin: 2,
                                      marginh: 5,
                                      fontSize: 11,
                                      onPressed: () {},
                                      fontWeight: FontWeight.normal,
                                      clickable: false,
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
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
                        child: mainIndecator),
                  ),
                  Container(
                      margin: EdgeInsets.all(15),
                      alignment: Alignment.topRight,
                      child: LikeButton(
                          isActive: isLiked,
                          campaignId: int.parse(
                            widget.mycampagin.id.toString(),
                          )))
                ],
              ),
            ),
            justLaunchedWidget,
          ]),
        ),
      ),
    );
  }

  addToCart() {
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);

    MainDialog.showMyDialog(
        MainDialog(
          title: "${AppSettingTheme.getTheme(
            context,
            Config.ADDED_TO_CART_KEY,
            Config.ADDED_TO_CART_VALUE,
          )}",
          text: "${AppSettingTheme.getTheme(
            context,
            Config.CONTINUE_SHOPPING_KEY,
            Config.CONTINUE_SHOPPING_VALUE,
          )}",
          descriptions: "${AppSettingTheme.getTheme(
            context,
            Config.ITEM_ADDED_KEY,
            Config.ITEM_ADDED_VALUE,
          )}",
          type: DialogType.SUCCESS,
          customWidget: Container(),
        ),
        context);
    return dio.post('addtocart', data: {
      "campaign_id": widget.mycampagin.id,
      "quantity": "1"
    }).then((value) {
      setState(() {
        quantity = 1;
        //  Timer(Duration(seconds:2),(){Navigator.of(context).pop();});
        if (value.data['status'] == 'success') {
          ApiCart cart = ApiCart.fromJson(value.data['data']);
          setState(() {
            RefreshApp.of(context)!.apiAppVariables.cart = cart;
          });
          MyApp.refreshApp(context);
        }
      });
    });
  }

  addToCartLocally() {
    print("addToCartLocally " + quantity.toString());
    if (widget.mycampagin.quantity!.toInt() - widget.mycampagin.sold!.toInt() >
            quantity &&
        widget.mycampagin.status == "active") {
      ApiCartItem cartItem = ApiCartItem(
          campaignId: widget.mycampagin.id,
          quantity: 1,
          campaign: widget.mycampagin);
      RefreshApp.of(context)!.apiAppVariables.cart!.items!.add(cartItem);
      double subtotal = 0.0;
      double total = 0.0;
      RefreshApp.of(context)!.apiAppVariables.cart!.subtotal = 0.00;
      RefreshApp.of(context)!.apiAppVariables.cart!.total = 0.00;
      RefreshApp.of(context)!.apiAppVariables.cart!.items!.forEach((element) {
        subtotal = subtotal +
            double.parse(element.campaign!.price!) *
                double.parse(element.quantity.toString());
      });

      // RefreshApp.of(context)!.apiAppVariables!.cart!.total=RefreshApp.of(context)!.apiAppVariables!.cart!.subtotal;
      RefreshApp.of(context)!.apiAppVariables.cart!.subtotal =
          RefreshApp.of(context)!.apiHeaders.acceptCurrency.toString() +
              subtotal.toString();
      RefreshApp.of(context)!.apiAppVariables.cart!.total =
          RefreshApp.of(context)!.apiHeaders.acceptCurrency.toString() +
              subtotal.toString();
      setState(() {});
      MyApp.refreshApp(context);
    }
  }

  updateLocally() {
    int m = 0;
    for (int i = 0;
        i < RefreshApp.of(context)!.apiAppVariables.cart!.items!.length;
        i++) {
      if (RefreshApp.of(context)!
              .apiAppVariables
              .cart!
              .items!
              .elementAt(i)
              .campaignId ==
          widget.mycampagin.id) {
        m = i;
      }
      RefreshApp.of(context)!.CartSubTotal = double.parse(
              RefreshApp.of(context)!
                  .apiAppVariables
                  .cart!
                  .items!
                  .elementAt(i)
                  .campaign!
                  .price!) *
          double.parse(RefreshApp.of(context)!
              .apiAppVariables
              .cart!
              .items!
              .elementAt(i)
              .quantity
              .toString());
    }
    RefreshApp.of(context)!.CartTotal = RefreshApp.of(context)!.CartSubTotal;
    setState(() {
      if (quantity == 0) {
        RefreshApp.of(context)!.apiAppVariables.cart!.items!.removeAt(m);
      } else {
        RefreshApp.of(context)!
            .apiAppVariables
            .cart!
            .items!
            .elementAt(m)
            .quantity = quantity;
      }

      RefreshApp.of(context)!.activeCampaignWidgets.clear();
      RefreshApp.of(context)!
          .apiAppVariables
          .activeCampaigns!
          .forEach((element) {
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
      MyApp.refreshApp(context);
    });
  }
}
