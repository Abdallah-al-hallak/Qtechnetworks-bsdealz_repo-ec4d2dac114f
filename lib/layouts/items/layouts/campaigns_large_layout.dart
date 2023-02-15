import 'package:bsdealz/layouts/items/layouts/blinking_progress_indicator.dart';
import 'package:bsdealz/layouts/items/texts/BaseText.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/items/texts/TitleText.dart';

import 'package:bsdealz/network/HttpAPI.dart';
import 'package:bsdealz/network/models/APICampaign.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';


class LargeCampaignLayout extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final List<ApiCampaign> Campaigns;

  const LargeCampaignLayout({Key? key, required this.height, required this.Campaigns})
      : super(key: key);

  @override
  _LargeCampaignLayoutState createState() => _LargeCampaignLayoutState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height*Campaigns.length+10);
}

class _LargeCampaignLayoutState extends State<LargeCampaignLayout> {


  _LargeCampaignLayoutState();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomCampaignItem(
        height: widget.height,Campaigns:widget.Campaigns
    );
  }
}

// Define a custom Form widget.
class CustomCampaignItem extends StatefulWidget {
  final double height;
  final List<ApiCampaign> Campaigns;

  const CustomCampaignItem({Key ?key, required this.height, required this.Campaigns})
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


  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.
    double width=160;
    double radius=0;

    if(kIsWeb){
      width=1500;
      radius=21;
    }
    return Flexible(
      child: Container(

        height: widget.height,
       // width: width,
        // color: Colors.red,
        child: Column(
          children: [
            Container(

              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container( child: TitleText(text: AppSettingTheme.getTheme(context,Config.CLOSING_SOON_KEY,Config.CLOSING_SOON_VALUE,), onPressed: (){}, clickable: false)),
                  //     Flexible(
                  //       flex: 1,
                  //   child: Container(
                  //
                  //       alignment: Alignment.bottomRight,
                  //       margin: EdgeInsets.only(bottom: 10),
                  //       child: FooterText(text: "View More", onPressed: (){}, clickable: true)),
                  // )
                ],),),


          ],
        ),
      ),
    );
  }
  void _launchURL(_url,name) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not Open'+name.toString();
  Widget CampaignItem(ApiCampaign campaign) {
    //  print(HttpAPI().BASE_URL+Campaign.link!.url.toString());
    double width=160;
    double radius=21;

    if(kIsWeb){
      width=1500;
      radius=21;
    }

    return GestureDetector(
      onTap: (){
        _launchURL(campaign.image!.toString(),"campaign link");
      },
      child: Container(
        height: widget.height,
        child: Card(
          elevation: 2,

          shape:RoundedRectangleBorder(
            // side: BorderSide(color: Colors.green, width: 0.5),
              borderRadius: BorderRadius.circular(21)),
          child: Container(
            height: widget.height,
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
                              width: 110,
                              height: 75,
                              child: Image(
                                image:CachedNetworkImageProvider(HttpAPI().BASE_URL+campaign.image.toString()),
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                //  width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(

                        alignment: Alignment.bottomRight,
                        child: PhysicalModel(
                          // elevation: 4.0,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          // shadowColor: Colors.black,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 35,
                              height: 35,
                              child: Image(
                                image:CachedNetworkImageProvider(HttpAPI().BASE_URL+campaign.products!.first.productImage.toString()),
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                //  width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                BaseText(
                  color: Theme.of(context).primaryColor,
                  text:campaign.name.toString(),
                  margin: 5,
                  marginh: 5,
                  fontSize: 10,
                  onPressed: (){},
                  fontWeight: FontWeight.bold, clickable: false,),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    child: BlinkingProgressIndicator(height: 6, progress: 0.8, criticalValue: 0.6,campagin: campaign,)),
                BaseText(
                  color: Colors.grey,
                  text:"${campaign.sold} ${AppSettingTheme.getTheme(context,Config.OUT_OF_KEY,Config.OUT_OF_VALUE,)} ${campaign.quantity}",
                  margin: 2,
                  marginh: 2,
                  fontSize: 10,
                  onPressed: (){},
                  fontWeight: FontWeight.bold, clickable: false,),

                // BaseText(
                //   color: Theme.of(context).primaryColor,
                //   text:campaign.campaingDescription.toString(),
                //   margin: 20,
                //   marginh: 20,
                //   fontSize: 10,
                //   onPressed: (){},
                //   fontWeight: FontWeight.bold, clickable: false,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
