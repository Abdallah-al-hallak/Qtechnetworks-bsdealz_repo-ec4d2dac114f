import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatefulWidget {

  static String IMAGES_PATH='assets/images/';
  static String LOGO_PATH=IMAGES_PATH+'logo.svg';
  static String ANIMATION_PATH=IMAGES_PATH+'animation.gif';
  static String BACK_ARROW_PATH=IMAGES_PATH+'back_arrow.svg';
  static String CAMPAIGN_PATH=IMAGES_PATH+'campaign.svg';
  static String CART_PATH=IMAGES_PATH+'cart.svg';
  static String CLOSE_PATH=IMAGES_PATH+'close.svg';
  static String COUPON_PATH=IMAGES_PATH+'coupon.svg';
  static String DRAW_PATH=IMAGES_PATH+'draw.svg';
  static String PRODUCTS_PATH=IMAGES_PATH+'products.svg';
  static String HOME_PATH=IMAGES_PATH+'home.svg';
  static String NOTIFICATION_PATH=IMAGES_PATH+'notification.svg';
  static String PERSON_PATH=IMAGES_PATH+'person.svg';
  static String SETTING_PATH=IMAGES_PATH+'setting.svg';
  static String SUCCESS_PATH=IMAGES_PATH+'success.svg';
  static String WARNING_PATH=IMAGES_PATH+'warning.svg';
  static String INFO_PATH=IMAGES_PATH+'info.svg';
  static String ERROR_PATH=IMAGES_PATH+'error.svg';
  static String EMPTY_CART_PATH=IMAGES_PATH+'empty_cart.svg';
  static String VIDEO_PLACEHOLDER_PATH=IMAGES_PATH+'video_placeholder.jpg';
  static String LIKE_ACTIVE_PATH=IMAGES_PATH+'like_enabled.svg';
  static String LIKE_DISABLED_PATH=IMAGES_PATH+'like_disabled.svg';
  static String CALENDAR_PATH=IMAGES_PATH+'calendar.svg';
  static String GLOBE_PATH=IMAGES_PATH+'globe.svg';
  static String PLUS_PATH=IMAGES_PATH+'plus.svg';
  static String MINUS_PATH=IMAGES_PATH+'minus.svg';
  static String PROMO_CODE_PATH=IMAGES_PATH+'promo_code.svg';
  static String BIRD_PATH=IMAGES_PATH+'bird.png';
  static String FACEBOOK_PATH=IMAGES_PATH+'facebook.svg';
  static String INSTAGRAM_PATH=IMAGES_PATH+'instagram.svg';
  static String EMAIL_PATH=IMAGES_PATH+'email.svg';
  static String PHONE_PATH=IMAGES_PATH+'phone.svg';
  static String ARROW_DOWN_PATH=IMAGES_PATH+'arrow_down.svg';
  final String icon;
  final double size;
  final Color? color;

   AppIcon({
    Key? key,
    required this.icon,
    required this.size,
    this.color,
  }) : super(key: key);

  @override
  _AppIconState createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

     Widget content = SvgPicture.asset(
        widget.icon,
        color: widget.color,
        semanticsLabel:   widget.icon
    );
    if(!widget.icon.contains(".svg")){
       content=  Image.asset(
          widget.icon,
      );
    }
    return Container(height: widget.size,width:widget.size ,child: content,);

  }
}

