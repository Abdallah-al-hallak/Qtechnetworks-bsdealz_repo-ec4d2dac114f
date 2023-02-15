import 'package:bsdealz/network/models/APIDraw.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../../../network/HttpAPI.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../texts/BaseText.dart';

class DrawItem extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;
  String? text;
  final ApiDraw? drawItem;

  DrawItem(
      {Key? key,
      required this.height,
      required this.width,
      this.text,
      this.drawItem})
      : super(key: key);
  @override
  _DrawItemState createState() => _DrawItemState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _DrawItemState extends State<DrawItem> {
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
        onTap: () {},
        child: DrawItemSingle(
          height: widget.height,
          width: widget.width,
          text: widget.drawItem!.campaign!.name.toString(),
          drawItem: widget.drawItem!,
        ));
  }
}

// Define a custom Form widget.
class DrawItemSingle extends StatefulWidget {
  final double height, width;
  final String text;
  final ApiDraw drawItem;
  const DrawItemSingle(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      required this.drawItem})
      : super(key: key);
  @override
  DrawItemSingleState createState() {
    return DrawItemSingleState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class DrawItemSingleState extends State<DrawItemSingle> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyDrawItemForm1State>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double radius = 21;

    Widget participated = Container();
    if (RefreshApp.of(context)!.apiAppVariables.userCoupons != null) {
      RefreshApp.of(context)!.apiAppVariables.userCoupons!.forEach((coupon) {
        if (widget.drawItem.campaignId == coupon.campaignId) {
          participated = BaseText(
            color: Colors.red,
            text: "you participated in this campaign",
            margin: 10,
            marginh: 5,
            fontSize: 11,
            onPressed: () {},
            fontWeight: FontWeight.bold,
            clickable: false,
          );
        }
      });
    }

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
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 5),
                        child: PhysicalModel(
                          // elevation: 4.0,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          // shadowColor: Colors.black,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(radius),
                            child: Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 150,
                              child: Image(
                                image: CachedNetworkImageProvider(HttpAPI()
                                        .BASE_URL +
                                    widget.drawItem.campaign!.image.toString()),
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                //  width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        child: BaseText(
                          color: Colors.black,
                          text: "",
                          margin: 10,
                          marginh: 5,
                          fontSize: 8,
                          onPressed: () {},
                          fontWeight: FontWeight.bold,
                          clickable: false,
                        ),
                      )
                    ],
                  ),
                ),
                BaseText(
                  color: Theme.of(context).primaryColor,
                  text: widget.drawItem.campaign!.prize.toString(),
                  margin: 10,
                  marginh: 5,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  onPressed: () {},
                  fontWeight: FontWeight.bold,
                  clickable: false,
                ),
                BaseText(
                  color: Colors.black,
                  text: "${AppSettingTheme.getTheme(
                        context,
                        Config.CAMPAIGN_NO_KEY,
                        Config.CAMPAIGN_NO_VALUE,
                      )} " +
                      widget.drawItem.campaign!.id.toString(),
                  margin: 10,
                  marginh: 5,
                  fontSize: 11,
                  onPressed: () {},
                  fontWeight: FontWeight.bold,
                  clickable: false,
                ),
                participated,
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 5),
                  height: 1,
                  color: Colors.grey[300],
                ),
                BaseText(
                  color: Colors.grey,
                  text: "${AppSettingTheme.getTheme(
                        context,
                        Config.DRAW_DATE_KEY,
                        Config.DRAW_DATE_VALUE,
                      )}" +
                      widget.drawItem.drawDate.toString(),
                  margin: 5,
                  marginh: 5,
                  fontSize: 11,
                  onPressed: () {},
                  fontWeight: FontWeight.bold,
                  clickable: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
