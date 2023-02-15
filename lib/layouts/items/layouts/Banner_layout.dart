
import 'package:bsdealz/layouts/pages/main/CampaignPage.dart';
import 'package:bsdealz/network/HttpAPI.dart';
import 'package:bsdealz/network/models/APIBanner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../dialogs/web_dialog.dart';


class BannerLayout extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final bool isRadius;
  final List<ApiBanner> banners;

  const BannerLayout({Key? key, required this.height, required this.banners, required this.isRadius})
      : super(key: key);

  @override
  _BannerLayoutState createState() => _BannerLayoutState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _BannerLayoutState extends State<BannerLayout> {


  _BannerLayoutState();

  @override
  void initState() {
    super.initState();
  }

  static final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomBannerItem(
        height: widget.height,banners:widget.banners, isRadius: widget.isRadius,
    );
  }
}

// Define a custom Form widget.
class CustomBannerItem extends StatefulWidget {
  final double height;
  final bool isRadius;
  final List<ApiBanner> banners;

  const CustomBannerItem({Key ?key, required this.height, required this.banners, required this.isRadius})
      : super(key: key);

  @override
  CustomBannerItemState createState() {
    return CustomBannerItemState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CustomBannerItemState extends State<CustomBannerItem> {
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

    double radius=0;
    if(widget.isRadius) {
      radius=21;
    }
    double width=MediaQuery.of(context).size.width;
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
                    itemCount:  widget.banners.length,
                    itemBuilder: (context, index) {
                      return bannerItem(widget.banners[index]);
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
                count: widget.banners.length,
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
  Widget bannerItem(ApiBanner banner) {
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
    return GestureDetector(
      onTap: (){
      //  _launchURL(banner.image!.toString(),banner.title.toString());
      // if(kIsWeb){
      //   WebDialog.showMyDialog(WebDialog(title: "",text: AppSettingTheme.getTheme(context,Config.DISMISS_KEY,Config.DISMISS_VALUE,),
      //       descriptions: "",customWidget: CampaignPage(campaign: banner.campaign)),context);
      // }else {
      //   Navigator.push(context, MaterialPageRoute(
      //       builder: (context) => CampaignPage(campaign: banner.campaign)));
      // }
      },
      child: Stack(

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
                  width: width,
                  height: widget.height,
                  child: Image(
                    image:CachedNetworkImageProvider(HttpAPI().BASE_URL+banner.image.toString(),),

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
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.all(20),
              width: width,
              height: 300,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(banner.title.toString(),style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                 Text(banner.subTitle.toString(),style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 35,fontWeight: FontWeight.bold),),
              ],),
            ),
          )
        ],
      ),
    );
  }
}
