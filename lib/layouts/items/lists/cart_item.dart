import 'dart:async';

import 'package:bsdealz/layouts/items/icons/AppIcon.dart';

import 'package:bsdealz/layouts/items/lists/web/campaign_item_web.dart';

import 'package:bsdealz/main.dart';

import 'package:bsdealz/network/models/APICartItem.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../network/HttpAPI.dart';
import '../../../network/models/APICart.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../../utils/sharedprefs.dart';

import '../../pages/main/CampaignPage.dart';
import '../../pages/main/cart_page.dart';

import '../texts/BaseText.dart';
import 'campaign_item.dart';

class CartItem extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;
  String? text;
  ApiCartItem? cartItem;

  CartItem(
      {Key? key,
      required this.height,
      required this.width,
      this.text,
      this.cartItem})
      : super(key: key);
  @override
  _CartItemState createState() => _CartItemState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _CartItemState extends State<CartItem> {
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

    return CartItemSingle(
        height: widget.height,
        width: widget.width,
        text: widget.cartItem!.campaign!.name.toString(),
        cartItem: widget.cartItem!);
  }
}

// Define a custom Form widget.
class CartItemSingle extends StatefulWidget {
  final double height, width;
  final String text;
  final ApiCartItem cartItem;
  const CartItemSingle(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      required this.cartItem})
      : super(key: key);
  @override
  CartItemSingleState createState() {
    return CartItemSingleState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CartItemSingleState extends State<CartItemSingle> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCartItemForm1State>.
  final _formKey = GlobalKey<FormState>();
  int quantity = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quantity = widget.cartItem.quantity!;
  }

  @override
  Widget build(BuildContext context) {
    double radius = 21;
    // Build a Form widget using the _formKey created above.
    Widget gallery = Container();

    gallery = InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CampaignPage(
                      campaign: widget.cartItem.campaign!,
                    )));
      },
      child: Image(
        image: CachedNetworkImageProvider(
            HttpAPI().BASE_URL + widget.cartItem.campaign!.image.toString()),
        alignment: Alignment.center,
        fit: BoxFit.contain,
        //  width: double.infinity,
      ),
    );
    ShapeBorder shapeBorder1 = RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(17)),
        side: BorderSide(width: 1, color: Colors.grey[300]!));
    int numberofCoupons = quantity; //widget.cartItem.quantity!.toInt();
    if (CartPage.donation == true) {
      numberofCoupons =
          numberofCoupons + quantity; //widget.cartItem.quantity!.toInt();
    }

    if (widget.cartItem.campaign!.earlyBirdQuantity!.toInt() > 0) {
      if (widget.cartItem.campaign!.earlyBirdQuantity!.toInt() <
          widget.cartItem.quantity!.toInt()) {
        numberofCoupons = numberofCoupons +
            widget.cartItem.campaign!.earlyBirdQuantity!.toInt();
      } else {
        numberofCoupons =
            numberofCoupons + quantity; //widget.cartItem.quantity!.toInt();
      }
    }
    return SizedBox(
      height: widget.height,
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 1, top: 8),
        alignment: Alignment.center,
        child: Stack(children: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CampaignPage(
                                            campaign: widget.cartItem.campaign!,
                                          )));
                            },
                            child: Image(
                              image: CachedNetworkImageProvider(
                                  HttpAPI().BASE_URL +
                                      widget.cartItem.campaign!.products!.first
                                          .productImage
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CampaignPage(
                                          campaign: widget.cartItem.campaign!,
                                        )));
                          },
                          child: BaseText(
                            color: Colors.black,
                            text: widget.cartItem.campaign!.name.toString(),
                            margin: 5,
                            marginh: 15,
                            fontSize: 16,
                            onPressed: () {},
                            fontWeight: FontWeight.bold,
                            clickable: false,
                          ),
                        ),
                        Container(
                          height: 2,
                        ),
                        BaseText(
                          color: Color(0XFF707070),
                          text: widget
                              .cartItem.campaign!.products!.first.productName
                              .toString(),
                          margin: 2,
                          marginh: 15,
                          fontSize: 12,
                          onPressed: () {},
                          fontWeight: FontWeight.normal,
                          clickable: false,
                        ),
                        Container(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 15,
                            ),
                            BaseText(
                              color: Color(0XFF707070),
                              text: "${AppSettingTheme.getTheme(
                                context,
                                Config.PRICE_KEY,
                                Config.PRICE_VALUE,
                              )} ",
                              margin: 2,
                              marginh: 0,
                              fontSize: 12,
                              onPressed: () {},
                              fontWeight: FontWeight.normal,
                              clickable: false,
                            ),
                            BaseText(
                              color: Color(0XFF707070),
                              text:
                                  " ${RefreshApp.of(context)!.apiHeaders.acceptCurrency}${widget.cartItem.campaign!.price.toString().replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), '')}",
                              margin: 2,
                              marginh: 0,
                              fontSize: 12,
                              onPressed: () {},
                              fontWeight: FontWeight.bold,
                              clickable: false,
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 15),
                          height: 35,
                          child: Card(
                            shape: shapeBorder1,
                            child: Container(
                              width: 85,
                              margin: EdgeInsets.only(left: 3, right: 3),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        CustomSharedPrefs()
                                            .getV("usePoints")
                                            .then((value) {
                                          if (value == "true") {
                                            updateLocally(false).then((value) {
                                              submitItems().then((value) {
                                                applyPromoCode();
                                              });
                                            });
                                          } else {
                                            updateLocally(false);
                                          }
                                        });

                                        //    submitItems(widget.cartItem);
                                      },
                                      child: AppIcon(
                                          icon: AppIcon.MINUS_PATH, size: 25)),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: BaseText(
                                        color: Colors.black,
                                        text: quantity.toString(),
                                        margin: 0,
                                        marginh: 5,
                                        fontSize: 12,
                                        onPressed: () {},
                                        fontWeight: FontWeight.normal,
                                        clickable: false,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        CustomSharedPrefs()
                                            .getV("usePoints")
                                            .then((value) {
                                          if (value == "true") {
                                            updateLocally(true).then((value) {
                                              submitItems().then((value) {
                                                applyPromoCode();
                                              });
                                            });
                                          } else {
                                            updateLocally(true);
                                          }
                                        });
                                      },
                                      child: AppIcon(
                                          icon: AppIcon.PLUS_PATH, size: 25)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 1,
                color: Color(0XFFD6D3D3),
                margin: EdgeInsets.only(top: 15, bottom: 0),
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BaseText(
                            text: "${numberofCoupons} ",
                            onPressed: () {},
                            clickable: false,
                            fontSize: 10,
                            margin: 0,
                            color: Colors.red,
                            marginh: 0,
                            fontWeight: FontWeight.bold,
                          ),
                          BaseText(
                            text: "${AppSettingTheme.getTheme(
                              context,
                              Config.COUPON_PER_UNIT_KEY,
                              Config.COUPON_PER_UNIT_VALUE,
                            )}",
                            onPressed: () {},
                            clickable: false,
                            fontSize: 10,
                            margin: 0,
                            color: Colors.black,
                            marginh: 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            height: 35,
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                InkWell(
                  onTap: () {
                    removeLocally();

                    // submitItems(widget.cartItem);
                  },
                  child: Container(
                      width: 35,
                      height: 35,
                      margin: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.topEnd,
                      child: AppIcon(
                        icon: AppIcon.CLOSE_PATH,
                        size: 15,
                        color: CupertinoColors.systemGrey3,
                      )),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  removeLocally() {
    //  updateCart();
    //  quantity=0;
    //  applyPromoCode();
    int j = 0;

    int counter = 0;
    for (int i = 0;
        i < RefreshApp.of(context)!.apiAppVariables.cart!.items!.length;
        i++) {
      if (RefreshApp.of(context)!
              .apiAppVariables
              .cart!
              .items!
              .elementAt(i)
              .campaignId ==
          widget.cartItem.campaign!.id) {
        j = i;
        ++counter;
        if (counter == 2) {
          RefreshApp.of(context)!.apiAppVariables.cart!.items!.removeAt(i);
          break;
        }
        RefreshApp.of(context)!.apiAppVariables.cart!.items!.removeAt(j);
      }
    }
    for (int i = 0; i < RefreshApp.of(context)!.localCart.items!.length; i++) {
      if (RefreshApp.of(context)!.localCart.items!.elementAt(i).campaignId ==
          widget.cartItem.campaign!.id) {
        j = i;

        RefreshApp.of(context)!.localCart.items!.removeAt(j);
      }
    }

    //  RefreshApp.of(context)!.CartSubTotal = double.parse(RefreshApp.of(context)!.apiAppVariables.cart.items!.elementAt(i).campaign!.price!) * double.parse(RefreshApp.of(context)!.localCart!.items!.elementAt(i)!.quantity.toString());

    double subtotal = 0.0;
    double total = 0.0;
    RefreshApp.of(context)!.apiAppVariables!.cart!.subtotal = 0.00;
    RefreshApp.of(context)!.apiAppVariables!.cart!.total = 0.00;
    RefreshApp.of(context)!.apiAppVariables!.cart!.items!.forEach((element) {
      subtotal = subtotal +
          double.parse(element.campaign!.price!) *
              double.parse(element.quantity.toString());
    });

    // RefreshApp.of(context)!.apiAppVariables!.cart!.total=RefreshApp.of(context)!.apiAppVariables!.cart!.subtotal;
    RefreshApp.of(context)!.apiAppVariables!.cart!.subtotal =
        RefreshApp.of(context)!.apiHeaders.acceptCurrency.toString() +
            subtotal.toString();
    RefreshApp.of(context)!.apiAppVariables!.cart!.total =
        RefreshApp.of(context)!.apiHeaders.acceptCurrency.toString() +
            subtotal.toString();
    // RefreshApp.of(context)!.CartTotal = RefreshApp.of(context)!.CartSubTotal;

    setState(() {
      RefreshApp.of(context)!.activeCampaignWidgets.clear();
      RefreshApp.of(context)!
          .apiAppVariables!
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
    });

    MyApp.refreshApp(context);
  }

  Future<void> updateLocally(bool increase) async {
    int j = 0;

    for (int i = 0;
        i < RefreshApp.of(context)!.apiAppVariables.cart!.items!.length;
        i++) {
      if (RefreshApp.of(context)!
              .apiAppVariables
              .cart!
              .items!
              .elementAt(i)
              .campaignId ==
          widget.cartItem.campaign!.id) {
        j = i;
        if (increase) {
          RefreshApp.of(context)!
              .apiAppVariables
              .cart!
              .items!
              .elementAt(i)!
              .quantity = RefreshApp.of(context)!
                  .apiAppVariables
                  .cart!
                  .items!
                  .elementAt(j)!
                  .quantity! +
              1;
        } else {
          RefreshApp.of(context)!
              .apiAppVariables
              .cart!
              .items!
              .elementAt(i)
              .quantity = RefreshApp.of(context)!
                  .apiAppVariables
                  .cart!
                  .items!
                  .elementAt(j)!
                  .quantity! -
              1;
        }
        quantity = RefreshApp.of(context)!
            .apiAppVariables
            .cart!
            .items!
            .elementAt(j)!
            .quantity!;
        if (RefreshApp.of(context)!
                .apiAppVariables
                .cart!
                .items!
                .elementAt(j)
                .quantity ==
            0) {
          //   RefreshApp.of(context)!.apiAppVariables.cart!.items!.removeAt(j);
          removeLocally();
        }
        updateCart();
      }

      //  RefreshApp.of(context)!.CartSubTotal = double.parse(RefreshApp.of(context)!.apiAppVariables.cart.items!.elementAt(i).campaign!.price!) * double.parse(RefreshApp.of(context)!.localCart!.items!.elementAt(i)!.quantity.toString());
    }
    double subtotal = 0.0;
    double total = 0.0;
    RefreshApp.of(context)!.apiAppVariables!.cart!.subtotal = 0.00;
    RefreshApp.of(context)!.apiAppVariables!.cart!.total = 0.00;
    RefreshApp.of(context)!.apiAppVariables!.cart!.items!.forEach((element) {
      subtotal = subtotal +
          double.parse(element.campaign!.price!) *
              double.parse(element.quantity.toString());
    });

    // RefreshApp.of(context)!.apiAppVariables!.cart!.total=RefreshApp.of(context)!.apiAppVariables!.cart!.subtotal;
    RefreshApp.of(context)!.apiAppVariables!.cart!.subtotal =
        RefreshApp.of(context)!.apiHeaders.acceptCurrency.toString() +
            subtotal.toString();
    RefreshApp.of(context)!.apiAppVariables!.cart!.total =
        RefreshApp.of(context)!.apiHeaders.acceptCurrency.toString() +
            subtotal.toString();

    setState(() {
      RefreshApp.of(context)!.activeCampaignWidgets.clear();
      RefreshApp.of(context)!
          .apiAppVariables!
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
    });

    MyApp.refreshApp(context);
  }

  applyPromoCode() {
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);
    return dio
        .get('showcart?promo_code=' +
            RefreshApp.of(context)!.promoCode.controller.text.toString() +
            '&use_points=true')
        .then((value) {
      ApiCart cart = ApiCart.fromJson(value.data['data']);
      try {
        RefreshApp.of(context)!.apiAppVariables.cart = cart;
      } catch (error) {
        print(error);
      }
    });
  }

  updateCart() {
    print("hi all");
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);
    EasyLoading.show();

    Map<String, dynamic> data = {
      "use_points": CartPage.usePoints,
      "promo_code":
          RefreshApp.of(context)!.promoCode.controller.text.toString(),
      "id": widget.cartItem.id,
      "quantity": widget.cartItem.quantity,
    };
    return dio.post('updatecart', data: data).then((value) {
      if (value.data['status'] == 'success') {
        ApiCart cart = ApiCart.fromJson(value.data['data']);
        // applyPromoCode();
        RefreshApp.of(context)!.apiAppVariables.cart = cart;
        MyApp.refreshApp(context);
      }

      EasyLoading.dismiss();
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }

  Future submitItems() {
    print("hi all");
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);
    EasyLoading.show();
    // Object itemsJson=jsonEncode(RefreshApp.of(context)!.apiAppVariables.cart!.items!.map((ApiCartItemR) => ApiCartItemR.toJson()).toList());
    List<ApiCartItemR> m = [];
    // Object itemsJson=jsonEncode(RefreshApp.of(context)!.apiAppVariables.cart!.items!.map((ApiCartItemR) => ApiCartItemR.toJson()).toList());
    RefreshApp.of(context)!.apiAppVariables.cart!.items!.forEach((element) {
      ApiCartItemR c = new ApiCartItemR(
          campaignId: element.campaignId, quantity: element.quantity);
      m.add(c);
    });
    List<Map<String, dynamic>> itemsList =
        m.map((model) => model.toJson()).toList();
    Map<String, dynamic> data = {
      "use_points": true,
      "promo_code":
          RefreshApp.of(context)!.promoCode.controller.text.toString(),
      "items": itemsList,
    };
    return dio.post('additemstocart', data: data).then((value) {
      if (value.data['status'] == 'success') {
        ApiCart cart = ApiCart.fromJson(value.data['data']);
        setState(() {
          RefreshApp.of(context)!.apiAppVariables.cart = cart;
          MyApp.refreshApp(context);
        });
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }
}
