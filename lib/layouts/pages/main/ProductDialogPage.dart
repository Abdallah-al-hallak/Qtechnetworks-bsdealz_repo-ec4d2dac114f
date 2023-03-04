import 'package:bsdealz/layouts/dialogs/main_dialog.dart';

import 'package:bsdealz/layouts/items/texts/SubTitleText.dart';
import 'package:bsdealz/layouts/items/tobars/close_bar.dart';
import 'package:bsdealz/network/models/APICampaign.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../localization/language_constants.dart';
import '../../../network/HttpAPI.dart';

import '../../../network/models/APIProduct.dart';

import '../../../utils/inherited/refresh_app_state.dart';

import '../../items/buttons/MiniButton.dart';

import '../../items/lists/campaign_item.dart';

import '../../items/lists/web/campaign_item_web.dart';

import '../../items/texts/BaseText.dart';

import 'CampaignPage.dart';

class ProductDialogPage extends StatefulWidget {
  final ApiProduct? product;
  ProductDialogPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductDialogPageState createState() => _ProductDialogPageState();
}

class _ProductDialogPageState extends State<ProductDialogPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //RefreshApp.of(context)!.localCart.items!.clear();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    // RefreshApp.of(context)!.localCart.items!.clear();
    // RefreshApp.of(context)!.activeCampaignWidgets.clear();
    // RefreshApp.of(context)!.apiAppVariables!.activeCampaigns!.forEach((element) {
    //   if (kIsWeb) {
    //     RefreshApp.of(context)!.activeCampaignWidgets.add(CampaignItemWeb(
    //       mycampagin: element, height: 350, width: 1,
    //     ));
    //   } else {
    //     RefreshApp.of(context)!.activeCampaignWidgets.add(CampaignItem(
    //
    //       mycampagin: element, height: 555, width: 1,
    //     ));
    //   }
    // });
    // MyApp.refreshApp(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int quantity = 1;
  bool updatefinished = true;

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

  bool isPrizeDetailsFocused = true;
  @override
  Widget build(BuildContext context) {
    Widget gallery = Container(
      height: 320,
      child: Image(
        image: CachedNetworkImageProvider(
            HttpAPI().BASE_URL + widget.product!.productImage.toString()),
        alignment: Alignment.center,
        fit: BoxFit.contain,
        //  width: double.infinity,
      ),
    );

    Widget productWidget = ListView(
      children: [
        CloseBar(height: 40),
        gallery,
        Container(
          height: 10,
        ),
        Row(
          children: [
            SubTitleText(
                text: widget.product!.productName.toString(),
                onPressed: () {},
                clickable: false),
            Container(
                width: 120,
                height: 35,
                child: MiniButton(
                    onPressed: () {
                      int i = 0;
                      for (ApiCampaign element in RefreshApp.of(context)!
                          .apiAppVariables
                          .activeCampaigns!) {
                        if (element.productId == widget.product!.productId) {
                          ++i;
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CampaignPage(campaign: element)));
                          break;
                        }
                      }
                      if (i == 0) {
                        MainDialog.showMyDialog(
                            MainDialog(
                              title: getTranslated(context, 'noAvalilable'),
                              text: "",
                              descriptions: "",
                              type: DialogType.INFO,
                              customWidget: Container(),
                            ),
                            context);
                      }
                    },
                    text: getTranslated(context, 'buy'),
                    isActive: true)),
          ],
        ),
        BaseText(
          color: Color(0XFF707070),
          text: widget.product!.productDescription.toString(),
          margin: 10,
          marginh: 20,
          fontSize: 9,
          onPressed: () {},
          fontWeight: FontWeight.bold,
          clickable: false,
        ),
      ],
    );

    return Scaffold(
      body: SafeArea(
          child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: productWidget)),
    );
  }
}
