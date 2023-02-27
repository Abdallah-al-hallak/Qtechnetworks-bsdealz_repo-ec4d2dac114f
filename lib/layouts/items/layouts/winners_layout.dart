import 'package:bsdealz/layouts/items/texts/BaseText.dart';
import 'package:bsdealz/layouts/items/texts/TitleText.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/network/HttpAPI.dart';
import 'package:bsdealz/network/models/APIDraw.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../network/models/APIDraw.dart';

class WinnersLayout extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final List<ApiDraw> Draws;

  const WinnersLayout({Key? key, required this.height, required this.Draws})
      : super(key: key);

  @override
  _WinnersLayoutState createState() => _WinnersLayoutState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _WinnersLayoutState extends State<WinnersLayout> {
  _WinnersLayoutState();

  @override
  void initState() {
    super.initState();
  }

  static final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomDrawItem(height: widget.height, Draws: widget.Draws);
  }
}

// Define a custom Form widget.
class CustomDrawItem extends StatefulWidget {
  final double height;
  final List<ApiDraw> Draws;

  const CustomDrawItem({Key? key, required this.height, required this.Draws})
      : super(key: key);

  @override
  CustomDrawItemState createState() {
    return CustomDrawItemState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CustomDrawItemState extends State<CustomDrawItem> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomDrawForm1State>.
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
                        text: getTranslated(context, 'winners'),
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
                itemCount: widget.Draws.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return DrawItem(widget.Draws[index]);
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
  Widget DrawItem(ApiDraw draw) {
    ShapeBorder shapeBorder1 = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        side: BorderSide(width: 1, color: Colors.black));
    double width = 234;
    double radius = 21;

    if (kIsWeb) {
      //  width=1500;
      radius = 21;
    }
    return GestureDetector(
      onTap: () {
        _launchURL(draw.campaign!.image.toString(), "Draw link");
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
                                          draw.campaign!.image.toString()),
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
                    text: "Congratulations",
                    margin: 3,
                    marginh: 5,
                    fontSize: 16,
                    onPressed: () {},
                    fontWeight: FontWeight.bold,
                    clickable: false,
                  ),
                  BaseText(
                    color: Colors.black,
                    text: "Omar Ahmad \nOn winning Range River",
                    margin: 5,
                    marginh: 5,
                    fontSize: 11,
                    onPressed: () {},
                    fontWeight: FontWeight.bold,
                    clickable: false,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 0),
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  BaseText(
                    color: Colors.grey[700]!,
                    text: "Coupon no: CG-09876-8766-D",
                    margin: 5,
                    marginh: 5,
                    fontSize: 9,
                    onPressed: () {},
                    fontWeight: FontWeight.normal,
                    clickable: false,
                  ),
                  BaseText(
                    color: Colors.grey,
                    text: "Announced on 28 August 2022",
                    margin: 2,
                    marginh: 5,
                    fontSize: 8,
                    onPressed: () {},
                    fontWeight: FontWeight.normal,
                    clickable: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
