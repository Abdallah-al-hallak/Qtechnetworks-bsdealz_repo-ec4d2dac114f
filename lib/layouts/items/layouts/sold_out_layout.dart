import 'package:bsdealz/layouts/items/texts/BaseText.dart';

import 'package:bsdealz/layouts/items/texts/TitleText.dart';
import 'package:bsdealz/localization/language_constants.dart';

import 'package:bsdealz/network/HttpAPI.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../network/models/APICampaign.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';

class SoldOutLayout extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final List<ApiCampaign> Campaigns;

  const SoldOutLayout({Key? key, required this.height, required this.Campaigns})
      : super(key: key);

  @override
  _SoldOutLayoutState createState() => _SoldOutLayoutState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _SoldOutLayoutState extends State<SoldOutLayout> {
  _SoldOutLayoutState();

  @override
  void initState() {
    super.initState();
  }

  static final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomCampaignItem(
        height: widget.height, Campaigns: widget.Campaigns);
  }
}

// Define a custom Form widget.
class CustomCampaignItem extends StatefulWidget {
  final double height;
  final List<ApiCampaign> Campaigns;

  const CustomCampaignItem(
      {Key? key, required this.height, required this.Campaigns})
      : super(key: key);

  @override
  CustomCampaignItemState createState() {
    return CustomCampaignItemState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CustomCampaignItemState extends State<CustomCampaignItem> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomCampaignForm1State>.
  final _formKey = GlobalKey<FormState>();
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    double width = 234;
    double radius = 0;

    if (kIsWeb) {
      width = 1500;
      radius = 21;
    }
    return Container(
      height: widget.height,
      width: width,
      // color: Colors.red,
      child: Column(
        children: [
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: TitleText(
                        text: getTranslated(context, 'sold out'),
                        onPressed: () {},
                        clickable: false)),
                //     Flexible(
                //       flex: 1,
                //   child: Container(
                //
                //       alignment: Alignment.bottomRight,
                //       margin: EdgeInsets.only(bottom: 10),
                //       child: FooterText(text: "View More", onPressed: (){}, clickable: true)),
                // )
              ],
            ),
          ),
          Flexible(
            child: Container(
              child: ListView.builder(
                itemCount: widget.Campaigns.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CampaignItem(widget.Campaigns[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void _launchURL(_url, name) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not Open' + name.toString();
  Widget CampaignItem(ApiCampaign campaign) {
    ShapeBorder shapeBorder1 = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        side: BorderSide(width: 1, color: Colors.black));
    double width = 234;
    double radius = 21;

    if (kIsWeb) {
      //width=250;
      radius = 21;
    }
    return GestureDetector(
      onTap: () {
        _launchURL(campaign.image!.toString(), "campaign link");
      },
      child: Stack(
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                // side: BorderSide(color: Colors.green, width: 0.5),
                borderRadius: BorderRadius.circular(21)),
            child: Container(
              width: width - 10,
              height: width - 10,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Flexible(
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 10),
                          child: PhysicalModel(
                            // elevation: 4.0,
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                            // shadowColor: Colors.black,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(radius),
                              child: Container(
                                child: Image(
                                  image: CachedNetworkImageProvider(
                                      HttpAPI().BASE_URL +
                                          campaign.image.toString()),
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
                  ),
                  BaseText(
                    color: Theme.of(context).primaryColor,
                    text: campaign.name.toString(),
                    margin: 5,
                    marginh: 5,
                    fontSize: 16,
                    onPressed: () {},
                    fontWeight: FontWeight.bold,
                    clickable: false,
                  ),
                  Card(
                    shape: shapeBorder1,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: BaseText(
                        color: Colors.black,
                        text: "${AppSettingTheme.getTheme(
                          context,
                          Config.DRAW_DATE_KEY,
                          Config.DRAW_DATE_VALUE,
                        )} ${campaign.drawDate}",
                        margin: 0,
                        marginh: 5,
                        fontSize: 13,
                        onPressed: () {},
                        fontWeight: FontWeight.normal,
                        clickable: false,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            elevation: 2,
            color: Color(0X10000000),
            shape: RoundedRectangleBorder(
                // side: BorderSide(color: Colors.green, width: 0.5),
                borderRadius: BorderRadius.circular(21)),
            child: Container(
              width: width - 10,
              height: width - 10,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
            ),
          )
        ],
      ),
    );
  }
}
