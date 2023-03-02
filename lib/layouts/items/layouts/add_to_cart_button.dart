import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/texts/BaseText.dart';
import 'package:bsdealz/layouts/pages/main/cart_page.dart';

import 'package:bsdealz/network/models/APICampaign.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:bsdealz/utils/sharedprefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../localization/language_constants.dart';
import '../../../main.dart';
import '../../../network/HttpAPI.dart';
import '../../../network/models/APICart.dart';
import '../../../network/models/APICartItem.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../dialogs/main_dialog.dart';
import '../../pages/credentials/login.dart';
import '../buttons/AddMoreBtn.dart';
import '../buttons/BaseButton.dart';
import '../buttons/Button1.dart';
import '../buttons/MiniButton.dart';
import '../lists/campaign_item.dart';
import '../lists/web/campaign_item_web.dart';

class AddToCartButton extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final ApiCampaign campaign;

  const AddToCartButton(
      {Key? key, required this.height, required this.campaign})
      : super(key: key);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _AddToCartButtonState extends State<AddToCartButton> {
  final _formKey = GlobalKey<FormState>();
  _AddToCartButtonState();

  @override
  void initState() {
    super.initState();
  }

  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    for (var element in RefreshApp.of(context)!.localCart.items!) {
      if (element.campaign!.id == widget.campaign.id) {
        quantity = element.quantity!;
      }
    }
    RefreshApp.of(context)!
        .localCart
        .items!
        .addAll(RefreshApp.of(context)!.apiAppVariables.cart!.items!);

    Widget addToCartWidget = Container(
      margin: const EdgeInsets.only(top: 20, bottom: 5),
      alignment: Alignment.bottomCenter,
      child: MiniButton(
          text: AppSettingTheme.getTheme(
            context,
            Config.ADD_TO_CART_KEY,
            Config.ADD_TO_CART_VALUE,
          ),
          onPressed: () {
            if (RefreshApp.of(context)!.isLogin) {
              if (widget.campaign.quantity! - widget.campaign.sold! >= 1 &&
                  widget.campaign.status == "active") {
                // addToCart();
                quantity = 1;
                addToCartLocally(true);
              } else {
                MainDialog.showMyDialog(
                    MainDialog(
                      title: "Failed to add",
                      text: "can't add more, not active campaign",
                      descriptions: "can't add more, not active campaign",
                      type: DialogType.ERROR,
                      customWidget: Container(),
                    ),
                    context);
              }
            } else {
              MainDialog.showMyDialog(
                  MainDialog(
                    title: AppSettingTheme.getTheme(
                      context,
                      Config.FAILED_KEY,
                      Config.FAILED_VALUE,
                    ),
                    text: AppSettingTheme.getTheme(
                      context,
                      Config.DISMISS_KEY,
                      Config.DISMISS_VALUE,
                    ),
                    descriptions: AppSettingTheme.getTheme(
                      context,
                      Config.PLEASE_LOGIN_KEY,
                      Config.PLEASE_LOGIN_VALUE,
                    ),
                    type: DialogType.ERROR,
                    customWidget: Button1(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login(
                                        destination: '1',
                                      )));
                        },
                        text: AppSettingTheme.getTheme(
                          context,
                          Config.LOGIN_KEY,
                          Config.LOGIN_VALUE,
                        ),
                        hasIcon: false,
                        color: Colors.red,
                        fontColor: Colors.white),
                  ),
                  context);
            }
          },
          isActive: true),
    );
    ShapeBorder shapeBorder1 = RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(9)),
        side: BorderSide(width: 1, color: Colors.grey[300]!));

    if (RefreshApp.of(context)!.localCart.items!.isNotEmpty) {
      for (int i = 0;
          i < RefreshApp.of(context)!.localCart.items!.length;
          i++) {
        if (RefreshApp.of(context)!
                .localCart
                .items!
                .elementAt(i)
                .campaign!
                .id ==
            widget.campaign.id) {
          addToCartWidget = Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 60,
            child: Card(
              shape: shapeBorder1,
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                margin: const EdgeInsets.only(left: 5, right: 5),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(
                        width: 50,
                        child: BaseButton(
                          isfilled: true,
                          isGradient: true,
                          isActive: true,
                          iconColor: Colors.white,
                          color: Theme.of(context).primaryColor,
                          height: 55,
                          text: "-",
                          icon: Icons.home,
                          textColor: HexColor(AppSettingTheme.getTheme(
                            context,
                            Config.MAIN_BUTTON_TEXT_COLOR_KEY,
                            Config.MAIN_BUTTON_TEXT_COLOR_VALUE,
                          )),
                          padding: 5,
                          iconpadding: 5,
                          margin: 0,
                          radius: 9,
                          fontSize: 30,
                          ovalpadding: 4,
                          onPressed: () {
                            quantity = quantity - 1;
                            updateLocally1(false);
                            updateLocally(false);
                          },
                          width: 50,
                          startColor: HexColor(AppSettingTheme.getTheme(
                            context,
                            Config.MAIN_BUTTON_START_COLOR_KEY,
                            Config.MAIN_BUTTON_START_COLOR_VALUE,
                          )),
                          endColor: HexColor(AppSettingTheme.getTheme(
                            context,
                            Config.MAIN_BUTTON_END_COLOR_KEY,
                            Config.MAIN_BUTTON_END_COLOR_VALUE,
                          )),
                        )),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: BaseText(
                          color: Colors.black,
                          // text:RefreshApp.of(context)!.apiAppVariables!.cart!.items!.elementAt(i).quantity!.toString(),
                          text: quantity.toString(),
                          margin: 0,
                          marginh: 5,
                          fontSize: 15,
                          onPressed: () {},
                          fontWeight: FontWeight.bold, clickable: false,
                        ),
                      ),
                    ),
                    BaseButton(
                      isfilled: true,
                      isGradient: true,
                      isActive: true,
                      iconColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      height: 55,
                      text: "+",
                      icon: Icons.home,
                      textColor: HexColor(AppSettingTheme.getTheme(
                        context,
                        Config.MAIN_BUTTON_TEXT_COLOR_KEY,
                        Config.MAIN_BUTTON_TEXT_COLOR_VALUE,
                      )),
                      padding: 5,
                      iconpadding: 5,
                      margin: 0,
                      radius: 9,
                      fontSize: 30,
                      ovalpadding: 4,
                      onPressed: () {
                        if (widget.campaign.quantity! - widget.campaign.sold! >
                            quantity) {
                          quantity = quantity + 1;
                          updateLocally1(true);
                          updateLocally(true);
                        } else {
                          MainDialog.showMyDialog(
                              MainDialog(
                                title: "Failed to add",
                                text: "can't add more, all sold out",
                                descriptions: "can't add more, all sold out",
                                type: DialogType.ERROR,
                                customWidget: Container(),
                              ),
                              context);
                        }
                      },
                      width: 50,
                      startColor: HexColor(AppSettingTheme.getTheme(
                        context,
                        Config.MAIN_BUTTON_START_COLOR_KEY,
                        Config.MAIN_BUTTON_START_COLOR_VALUE,
                      )),
                      endColor: HexColor(AppSettingTheme.getTheme(
                        context,
                        Config.MAIN_BUTTON_END_COLOR_KEY,
                        Config.MAIN_BUTTON_END_COLOR_VALUE,
                      )),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: AddMoreBtn(
                        isActive: true,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()));
                        },
                        text: getTranslated(context, 'cart'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
    }
    return addToCartWidget;
  }

  addToCartLocally(bool increase) {
    print("addToCartLocally " + quantity.toString());
    ApiCartItem cartItem;
    int j = -1;
    setState(() {
      bool isGlobal = false;
      if (widget.campaign.quantity!.toInt() - widget.campaign.sold!.toInt() >
              quantity &&
          widget.campaign.status == "active") {
        for (int i = 0;
            i < RefreshApp.of(context)!.apiAppVariables.cart!.items!.length;
            i++) {
          if (RefreshApp.of(context)!
                  .apiAppVariables
                  .cart
                  ?.items
                  ?.elementAt(i)
                  .campaignId ==
              widget.campaign.id) {
            isGlobal = true;
            j = i;
            print("isGlobal " + quantity.toString());
          }

          //  RefreshApp.of(context)!.CartSubTotal = double.parse(RefreshApp.of(context)!.apiAppVariables.cart.items!.elementAt(i).campaign!.price!) * double.parse(RefreshApp.of(context)!.localCart!.items!.elementAt(i)!.quantity.toString());
        }
        cartItem = ApiCartItem(
            campaignId: widget.campaign.id,
            quantity: 1,
            campaign: widget.campaign);
        if (!isGlobal) {
          RefreshApp.of(context)!.apiAppVariables.cart?.items?.add(cartItem);
        } else {
          RefreshApp.of(context)!
              .apiAppVariables
              .cart!
              .items!
              .elementAt(j)
              .quantity = RefreshApp.of(context)!
                  .apiAppVariables
                  .cart!
                  .items!
                  .elementAt(j)
                  .quantity! +
              1;
        }

        RefreshApp.of(context)!.localCart.items!.add(cartItem);
        double subtotal = 0.0;
        double total = 0.0;

        RefreshApp.of(context)!.apiAppVariables.cart?.items!.forEach((element) {
          subtotal = subtotal +
              double.parse(element.campaign!.price!) *
                  double.parse(element.quantity.toString());
        });

        // RefreshApp.of(context)!.apiAppVariables!.cart!.total=RefreshApp.of(context)!.apiAppVariables!.cart!.subtotal;
        RefreshApp.of(context)!.apiAppVariables.cart?.subtotal =
            RefreshApp.of(context)!.apiHeaders.acceptCurrency.toString() +
                subtotal.toString();
        RefreshApp.of(context)!.apiAppVariables.cart?.total =
            RefreshApp.of(context)!.apiHeaders.acceptCurrency.toString() +
                subtotal.toString();
        MyApp.refreshApp(context);
      }
    });
  }
  //!
  //here buuton

  Future<void> updateLocally1(bool increase) async {
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
          widget.campaign.id) {
        j = i;
        if (increase) {
          RefreshApp.of(context)!
              .apiAppVariables
              .cart!
              .items!
              .elementAt(i)
              .quantity = RefreshApp.of(context)!
                  .apiAppVariables
                  .cart!
                  .items!
                  .elementAt(j)
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
                  .elementAt(j)
                  .quantity! -
              1;
        }
        quantity = RefreshApp.of(context)!
            .apiAppVariables
            .cart!
            .items!
            .elementAt(j)
            .quantity!;
        if (RefreshApp.of(context)!
                .apiAppVariables
                .cart!
                .items!
                .elementAt(j)
                .quantity ==
            0) {
          //   RefreshApp.of(context)!.apiAppVariables.cart!.items!.removeAt(j);
          // removeLocally();
        }
        updateCart();
      }

      //  RefreshApp.of(context)!.CartSubTotal = double.parse(RefreshApp.of(context)!.apiAppVariables.cart.items!.elementAt(i).campaign!.price!) * double.parse(RefreshApp.of(context)!.localCart!.items!.elementAt(i)!.quantity.toString());
    }
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

    setState(() {
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
    });

    MyApp.refreshApp(context);
  }

  //!
  //cart
  updateCart() {
    print("hi all");
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);
    EasyLoading.show();

    Map<String, dynamic> data = {
      "use_points": CartPage.usePoints,
      "promo_code":
          RefreshApp.of(context)!.promoCode.controller.text.toString(),
      "id": widget.campaign.id,
      "quantity": widget.campaign.quantity,
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
  //

  updateLocally(bool increase) {
    int m = -1;
    int j = -1;
    for (int i = 0; i < RefreshApp.of(context)!.localCart.items!.length; i++) {
      if (RefreshApp.of(context)!.localCart.items!.elementAt(i).campaign!.id ==
          widget.campaign.id) {
        m = i;
      }
    }
    if (m != -1) {
      RefreshApp.of(context)!.localCart.items!.elementAt(m).quantity = quantity;
    }
    if (quantity == 0 && !increase) {
      setState(() {
        RefreshApp.of(context)!.localCart.items!.removeAt(m);
      });
    }
    setState(() {});
    print("updateLocally2 " + quantity.toString());
    // print("updateLocally RefreshApp2 "+ RefreshApp.of(context)!.localCart!.items!.elementAt(m)!.quantity.toString());

    for (int i = 0;
        i < RefreshApp.of(context)!.apiAppVariables.cart!.items!.length;
        i++) {
      if (RefreshApp.of(context)!
              .apiAppVariables
              .cart!
              .items!
              .elementAt(i)
              .campaignId ==
          widget.campaign.id) {
        j = i;
        print("updateLocally if " +
            widget.campaign.id.toString() +
            "----" +
            quantity.toString());
        //  print("updateLocally 3if "+widget.campaign!.id.toString()+"----"+RefreshApp.of(context)!.localCart!.items!.elementAt(m).quantity!.toString());

        //print("updateLocally4if "+widget.campaign!.id.toString()+"----"+RefreshApp.of(context)!.localCart!.items!.elementAt(m).quantity!.toString());
        // print("-----------cartItem "+RefreshApp
        //     .of(context)!
        //     .apiAppVariables
        //     .cart!
        //     .items!
        //     .elementAt(j).quantity.toString() );
        // print("-----------cartItemlocal "+RefreshApp
        //     .of(context)!
        //     .localCart
        //     .items!
        //     .elementAt(m).quantity!.toString() );
        // quantity=RefreshApp
        //     .of(context)!
        //     .localCart
        //     .items!
        //     .elementAt(m).quantity!;
      }

      //  RefreshApp.of(context)!.CartSubTotal = double.parse(RefreshApp.of(context)!.apiAppVariables.cart.items!.elementAt(i).campaign!.price!) * double.parse(RefreshApp.of(context)!.localCart!.items!.elementAt(i)!.quantity.toString());
    }
    // print("updateLocally 7if "+widget.campaign!.id.toString()+"----"+RefreshApp.of(context)!.localCart!.items!.elementAt(m).quantity!.toString());
    if (increase) {
      // RefreshApp
      //     .of(context)!
      //     .apiAppVariables
      //     .cart!
      //     .items!boku
      //     .elementAt(j)!
      //     .quantity =   RefreshApp
      //     .of(context)!
      //     .apiAppVariables
      //     .cart!
      //     .items!
      //     .elementAt(j)!
      //     .quantity!+1;
      //    print("updateLocally 8if "+widget.campaign!.id.toString()+"----"+RefreshApp.of(context)!.localCart!.items!.elementAt(m).quantity!.toString());
    } else {
      // RefreshApp
      //     .of(context)!
      //     .apiAppVariables
      //     .cart!
      //     .items!
      //     .elementAt(j).quantity =   RefreshApp
      //     .of(context)!
      //     .apiAppVariables
      //     .cart!
      //     .items!
      //     .elementAt(j)!
      //     .quantity!-1;
      //   print("updateLocally 9if "+widget.campaign!.id.toString()+"----"+RefreshApp.of(context)!.localCart!.items!.elementAt(m).quantity!.toString());
    }
    if (RefreshApp.of(context)!
            .apiAppVariables
            .cart!
            .items!
            .elementAt(j)
            .quantity ==
        0) {
      RefreshApp.of(context)!.apiAppVariables.cart!.items!.removeAt(j);
    }
    //   print("updateLocally 10if "+widget.campaign!.id.toString()+"----"+RefreshApp.of(context)!.localCart!.items!.elementAt(m).quantity!.toString());
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
    // RefreshApp.of(context)!.CartTotal = RefreshApp.of(context)!.CartSubTotal;
    // print("updateLocally 6if "+widget.campaign!.id.toString()+"----"+RefreshApp.of(context)!.localCart!.items!.elementAt(m).quantity!.toString());
    setState(() {
      // quantity=RefreshApp.of(context)!.localCart!.items!.elementAt(m)!.quantity!;
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
      print("updateLocally 4if " +
          widget.campaign.id.toString() +
          "----" +
          quantity.toString());
      //     print("updateLocally 5if "+widget.campaign!.id.toString()+"----"+RefreshApp.of(context)!.localCart!.items!.elementAt(m).quantity!.toString());
      MyApp.refreshApp(context);
    });
  }

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
}
