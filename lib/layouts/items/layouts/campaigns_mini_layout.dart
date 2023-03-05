import 'package:bsdealz/layouts/items/layouts/blinking_progress_indicator.dart';
import 'package:bsdealz/layouts/items/texts/BaseText.dart';
import 'package:bsdealz/layouts/items/texts/TitleText.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/network/HttpAPI.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../network/models/APICampaign.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../dialogs/web_dialog.dart';
import '../../pages/main/CampaignPage.dart';

class MiniCampaignLayout extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final List<ApiCampaign> Campaigns;

  const MiniCampaignLayout(
      {Key? key, required this.height, required this.Campaigns})
      : super(key: key);

  @override
  _MiniCampaignLayoutState createState() => _MiniCampaignLayoutState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _MiniCampaignLayoutState extends State<MiniCampaignLayout> {
  _MiniCampaignLayoutState();

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
    double width = 160;
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
                        text: getTranslated(context, 'closing'),
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

  // void _launchURL(_url,name) async =>
  //     await canLaunch(_url) ? await launch(_url) : throw 'Could not Open'+name.toString();
  Widget CampaignItem(ApiCampaign campaign) {
    //  print(HttpAPI().BASE_URL+Campaign.link!.url.toString());
    double width = 180;
    double radius = 21;

    if (kIsWeb) {
      width = 250;
      radius = 21;
    }
    double progress = double.parse(campaign.sold.toString()) /
        double.parse(campaign.quantity.toString());
    return GestureDetector(
      onTap: () {
        // _launchURL(campaign.image!.toString(),"campaign link");
        if (kIsWeb) {
          WebDialog.showMyDialog(
              WebDialog(
                title: "",
                text: AppSettingTheme.getTheme(
                  context,
                  Config.DISMISS_KEY,
                  Config.DISMISS_VALUE,
                ),
                descriptions: "",
                customWidget: CampaignPage(
                  campaign: campaign,
                ),
              ),
              context);
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CampaignPage(
                        campaign: campaign,
                      )));
        }
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            // side: BorderSide(color: Colors.green, width: 0.5),
            borderRadius: BorderRadius.circular(21)),
        child: Container(
          width: width - 10,
          height: width - 10,
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Flexible(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: PhysicalModel(
                        //elevation: 4.0,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        // shadowColor: Colors.black,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(radius),
                          child: SizedBox(
                            height: 75,
                            child: Image(
                              image: CachedNetworkImageProvider(
                                HttpAPI().BASE_URL + campaign.image.toString(),
                              ),
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
                        elevation: 4.0,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        shadowColor: Colors.black,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 35,
                            height: 35,
                            child: Image(
                              image: CachedNetworkImageProvider(
                                HttpAPI().BASE_URL +
                                    campaign.products!.first.productImage
                                        .toString(),
                              ),

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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BaseText(
                        color: Colors.black,
                        text: getTranslated(context, 'getChance'),
                        margin: 5,
                        marginh: 0,
                        fontSize: 10,
                        onPressed: () {},
                        fontWeight: FontWeight.bold,
                        clickable: false,
                      ),
                      BaseText(
                        color: Theme.of(context).primaryColor,
                        text: getTranslated(context, 'win'),
                        margin: 5,
                        marginh: 0,
                        fontSize: 10,
                        onPressed: () {},
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        clickable: false,
                      ),
                    ],
                  ),
                  BaseText(
                    color: Theme.of(context).primaryColor,
                    text: campaign.name.toString(),
                    margin: 0,
                    marginh: 5,
                    fontSize: 10,
                    onPressed: () {},
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    clickable: false,
                  ),
                ],
              ),
              Container(
                  child: BlinkingProgressIndicator(
                height: 45,
                progress: progress,
                criticalValue: 0.9,
                campagin: campaign,
              )),
              // BaseText(
              //   color: Colors.grey,
              //   text:"${campaign.sold} ${AppSettingTheme.getTheme(context,Config.OUT_OF_KEY,Config.OUT_OF_VALUE,)} ${campaign.quantity}",
              //   margin: 2,
              //   marginh: 2,
              //   fontSize: 10,
              //   onPressed: (){},
              //   fontWeight: FontWeight.bold, clickable: false,),

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
    );
  }
}
