import 'package:bsdealz/layouts/items/texts/SubTitleText.dart';
import 'package:bsdealz/layouts/items/texts/TitleText.dart';
import 'package:bsdealz/network/HttpAPI.dart';
import 'package:bsdealz/network/models/APIImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../network/models/APIBanner.dart';


class CampaignSlider extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final bool isRadius;
  final List<ApiImage> images;

  const CampaignSlider({Key? key, required this.height, required this.images, required this.isRadius})
      : super(key: key);

  @override
  _CampaignSliderState createState() => _CampaignSliderState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _CampaignSliderState extends State<CampaignSlider> {


  _CampaignSliderState();

  @override
  void initState() {
    super.initState();
  }

  static final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomItem(
      height: widget.height,images:widget.images, isRadius: widget.isRadius,
    );
  }
}

// Define a custom Form widget.
class CustomItem extends StatefulWidget {
  final double height;
  final bool isRadius;
  final List<ApiImage> images;

  const CustomItem({Key ?key, required this.height, required this.images, required this.isRadius})
      : super(key: key);

  @override
  CustomItemState createState() {
    return CustomItemState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CustomItemState extends State<CustomItem> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomBannerForm1State>.
  final _formKey = GlobalKey<FormState>();
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.
    double width=MediaQuery.of(context).size.width;
    double radius=0;
    if(widget.isRadius) {
      radius=21;
    }

    if(kIsWeb){
      width=1500;
      radius=21;
    }
    return Container(
      height: widget.height,
      width: width,
      // color: Colors.red,
      child: Stack(
        children: [
          Row(
            children: [
              //  IconButton(icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.redAccent, ), onPressed: null),
              Expanded(
                child: PageView.builder(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    reverse: false,
                    itemCount:  widget.images.length,
                    itemBuilder: (context, index) {
                      return Item(widget.images[index]);
                    }
                ),
              ),
              // IconButton(icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.redAccent,), onPressed: null),
            ],
          ),

          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10),
            child: SmoothPageIndicator(
                controller: controller,
                // PageController
                count: widget.images.length,
                textDirection: TextDirection.ltr,
                effect: WormEffect(
                    spacing: 8.0,
                    radius: 7.0,
                    dotWidth: 7.0,
                    dotHeight: 7.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 0.1,
                    dotColor: Colors.grey.shade50,
                    activeDotColor: Colors.red),
                onDotClicked: (index) {

                }),
          ),
        ],
      ),
    );
  }
  void _launchURL(_url,name) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not Open'+name.toString();
  Widget Item(ApiImage image) {
    //  print(HttpAPI().BASE_URL+banner.link!.url.toString());
    double width=MediaQuery.of(context).size.width;
    double radius=0;
    if(widget.isRadius) {
      radius=21;
    }

    if(kIsWeb){
      width=1500;
      radius=21;
    }
    return Stack(

      children: [

        Container(

          alignment: Alignment.center,
          child: PhysicalModel(
            // elevation: 4.0,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(radius),
            // shadowColor: Colors.black,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Container(

                height: widget.height,
                child: Image(
                  image:CachedNetworkImageProvider(HttpAPI().BASE_URL+image.imagePath.toString(),),

                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  //  width: double.infinity,
                ),
              ),
            ),
          ),
        ),          Align(
          alignment: Alignment.topLeft,
          child: Container(
            alignment: AlignmentDirectional.topStart,
            margin: EdgeInsets.all(20),
            width: 250,
            height: 200,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //  Text("INDULDGE \nIN LUXURY!",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
             //   Text("BUY NOW!",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 35,fontWeight: FontWeight.bold),),
              ],),
          ),
        )
      ],
    );
  }
}
