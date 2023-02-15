import 'package:bsdealz/layouts/items/buttons/MiniButton.dart';
import 'package:bsdealz/layouts/pages/main/CampaignPage.dart';

import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import '../../../network/HttpAPI.dart';
import '../../../network/models/APICampaign.dart';
import '../../../network/models/APIProduct.dart';
import '../../dialogs/main_dialog.dart';
import '../../pages/main/ProductDialogPage.dart';
import '../texts/BaseText.dart';
import '../texts/SubTitleText.dart';

class ProductItem extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;
  String? text;
  final ApiProduct? product;

  ProductItem(
      {Key? key,
      required this.height,
      required this.width,
      this.text,
      this.product})
      : super(key: key);
  @override
  _ProductItemState createState() => _ProductItemState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _ProductItemState extends State<ProductItem> {
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
    Widget gallery = Image(
      image: CachedNetworkImageProvider(
          HttpAPI().BASE_URL + widget.product!.productImage.toString()),
      alignment: Alignment.center,
      fit: BoxFit.contain,
      //  width: double.infinity,
    );

    Widget productWidget = ListView(
      children: [
        InkWell(
            onTap: () {
              int i = 0;
              for (ApiCampaign element
                  in RefreshApp.of(context)!.apiAppVariables.activeCampaigns!) {
                if (element.productId == widget.product!.productId) {
                  ++i;
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
                      title: "No available campaigns",
                      text: "",
                      descriptions: "",
                      type: DialogType.INFO,
                      customWidget: Container(),
                    ),
                    context);
              }
            },
            child: gallery),
        Container(
          height: 10,
        ),
        InkWell(
          onTap: () {
            int i = 0;
            for (ApiCampaign element
                in RefreshApp.of(context)!.apiAppVariables.activeCampaigns!) {
              if (element.productId == widget.product!.productId) {
                ++i;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CampaignPage(campaign: element)));
                break;
              }
            }
            if (i == 0) {
              MainDialog.showMyDialog(
                  MainDialog(
                    title: "No available campaigns",
                    text: "",
                    descriptions: "",
                    type: DialogType.INFO,
                    customWidget: Container(),
                  ),
                  context);
            }
          },
          child: Row(
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
                                title: "No available campaigns",
                                text: "",
                                descriptions: "",
                                type: DialogType.INFO,
                                customWidget: Container(),
                              ),
                              context);
                        }
                      },
                      text: "Buy Now",
                      isActive: true)),
            ],
          ),
        ),
        Expanded(
          child: BaseText(
            color: Color(0XFF707070),
            text: widget.product!.productDescription.toString(),
            margin: 10,
            marginh: 20,
            fontSize: 9,
            onPressed: () {},
            fontWeight: FontWeight.bold,
            clickable: false,
          ),
        ),
      ],
    );
    Widget productDetails = Container(
      height: 400,
      child: productWidget,
    );
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductDialogPage(product: widget.product)));
          // MainDialog.showMyDialog(MainDialog(title: "",text: "",
          //   descriptions: "",type: DialogType.INFO,customWidget: productDetails,),context);
        },
        child: ProductItemSingle(
          height: widget.height,
          width: widget.width,
          product: widget.product!,
        ));
  }
}

// Define a custom Form widget.
class ProductItemSingle extends StatefulWidget {
  final double height, width;
  final ApiProduct product;
  const ProductItemSingle(
      {Key? key,
      required this.height,
      required this.width,
      required this.product})
      : super(key: key);
  @override
  ProductItemSingleState createState() {
    return ProductItemSingleState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ProductItemSingleState extends State<ProductItemSingle> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyProductItemForm1State>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double radius = 21;

    return Container(
      height: 90,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            height: 80,
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
                  height: 80,
                  child: Image(
                    image: CachedNetworkImageProvider(HttpAPI().BASE_URL +
                        widget.product.productImage.toString()),
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    //  width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: BaseText(
              color: Colors.black,
              text: widget.product.productName.toString(),
              margin: 5,
              marginh: 5,
              fontSize: 10,
              onPressed: () {},
              fontWeight: FontWeight.bold,
              clickable: false,
            ),
          ),
        ],
      ),
    );
  }
}
