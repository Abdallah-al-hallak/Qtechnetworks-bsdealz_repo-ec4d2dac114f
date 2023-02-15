import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/network/models/APICampaign.dart';
import 'package:bsdealz/network/models/APIWishListItem.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../network/HttpAPI.dart';
import '../../../utils/inherited/refresh_app_state.dart';
import '../../dialogs/main_dialog.dart';
import '../../pages/credentials/login.dart';
import '../lists/campaign_item.dart';
import 'Button1.dart';

class LikeButton extends StatefulWidget implements PreferredSizeWidget {
  bool isActive;
  int campaignId;
  LikeButton({Key? key, required this.isActive, required this.campaignId})
      : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    Widget icon = AppIcon(
      icon: AppIcon.LIKE_DISABLED_PATH,
      size: 30,
    );
    if (widget.isActive) {
      icon = AppIcon(
        icon: AppIcon.LIKE_ACTIVE_PATH,
        size: 30,
      );
    }
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          if (RefreshApp.of(context)!.isLogin) {
            widget.isActive = !widget.isActive;
            updateLike();
          } else {
            MainDialog.showMyDialog(
                MainDialog(
                  title: "Failed",
                  text: "Dismiss",
                  descriptions: "Please login First",
                  type: DialogType.ERROR,
                  customWidget: Button1(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login(
                                      destination: '1',
                                    )));
                      },
                      text: "Login",
                      hasIcon: false,
                      color: Colors.red,
                      fontColor: Colors.white),
                ),
                context);
          }
        });
      },
      child: Card(
        elevation: 5,
        color: Colors.white,
        shape: const CircleBorder(),
        child: Container(margin: EdgeInsets.all(7), child: icon),
      ),
    );
  }

  updateLike() {
    String url = "wishlist/${widget.campaignId}";
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);
    if (widget.isActive) {
      return dio.post(url).then((value) {
        if (value.data['status'] == 'success') {
          List<ApiWishListItem> wishList = List<ApiWishListItem>.from(value
              .data['data']
              .map((model) => ApiWishListItem.fromJson(model)));
          RefreshApp.of(context)!.apiAppVariables.wishList!.clear();
          setState(() {
            RefreshApp.of(context)!.apiAppVariables.wishList = wishList;
            if (RefreshApp.of(context)!.wishListWidgets.isNotEmpty) {
              RefreshApp.of(context)!.wishListWidgets.clear();
            }
            RefreshApp.of(context)!
                .apiAppVariables
                .wishList!
                .forEach((element) {
              RefreshApp.of(context)!.wishListWidgets.add(CampaignItem(
                    mycampagin: element.campaign,
                    height: 550,
                    width: 1,
                  ));
            });
          });
          MyApp.refreshApp(context);
        }
      });
    } else {
      return dio.delete(url).then((value) {
        if (value.data['status'] == 'success') {
          List<ApiWishListItem> wishList = List<ApiWishListItem>.from(value
              .data['data']
              .map((model) => ApiWishListItem.fromJson(model)));
          RefreshApp.of(context)!.apiAppVariables.wishList!.clear();
          setState(() {
            RefreshApp.of(context)!.apiAppVariables.wishList = wishList;
            if (RefreshApp.of(context)!.wishListWidgets.isNotEmpty) {
              RefreshApp.of(context)!.wishListWidgets.clear();
            }
            RefreshApp.of(context)!
                .apiAppVariables
                .wishList!
                .forEach((element) {
              RefreshApp.of(context)!.wishListWidgets.add(CampaignItem(
                    mycampagin: element.campaign,
                    height: 550,
                    width: 1,
                  ));
            });
          });
          MyApp.refreshApp(context);
        }
      });
    }
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
