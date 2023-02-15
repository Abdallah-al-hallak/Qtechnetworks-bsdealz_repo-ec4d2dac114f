import 'package:bsdealz/layouts/items/icons/AppIcon.dart';

import 'package:bsdealz/layouts/pages/main/CheckoutPage.dart';
import 'package:bsdealz/main.dart';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import '../../../network/HttpAPI.dart';

import '../../../network/models/ApiAddress.dart';
import '../../../utils/inherited/refresh_app_state.dart';

import '../texts/BaseText.dart';

import '../texts/SubTitleText.dart';

class AddressItem extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;

  final int? groupValue;
  final int? value;
  final ValueChanged<int?> onChanged;
  ApiAddress? addressItem;

  AddressItem(
      {Key? key,
      required this.height,
      required this.width,
      this.addressItem,
      required this.groupValue,
      required this.value,
      required this.onChanged})
      : super(key: key);
  @override
  _AddressItemState createState() => _AddressItemState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _AddressItemState extends State<AddressItem> {
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
    return AddressItemSingle(
      height: widget.height,
      width: widget.width,
      addressItem: widget.addressItem!,
      groupValue: widget.groupValue,
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}

// Define a custom Form widget.
class AddressItemSingle extends StatefulWidget {
  final double height, width;
  final ApiAddress addressItem;
  final int? groupValue;
  final int? value;
  final ValueChanged<int?> onChanged;
  const AddressItemSingle({
    Key? key,
    required this.height,
    required this.width,
    required this.addressItem,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);
  @override
  AddressItemSingleState createState() {
    return AddressItemSingleState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AddressItemSingleState extends State<AddressItemSingle> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyAddressItemForm1State>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double radius = 21;
    // Build a Form widget using the _formKey created above.

    ShapeBorder shapeBorder1 = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(17)),
        side: BorderSide(width: 1, color: Colors.grey[300]!));
    return SizedBox(
      height: widget.height,
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, bottom: 1, top: 8),
        alignment: Alignment.center,
        child: Stack(children: <Widget>[
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Radio<int?>(
                  groupValue: widget.groupValue,
                  value: widget.value,
                  activeColor: Colors.red,
                  onChanged: (int? newValue) {
                    widget.onChanged(newValue!);
                  },
                ),
              ),
              Expanded(
                child: Column(children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: SubTitleText(
                        text: widget.addressItem.address.toString(),
                        clickable: false,
                        onPressed: () {}),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: BaseText(
                        color: Color(0XFF707070),
                        margin: 5,
                        text: RefreshApp.of(context)!
                            .apiAppVariables
                            .user!
                            .firstName
                            .toString(),
                        marginh: 20,
                        fontSize: 13,
                        onPressed: () {},
                        clickable: false,
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      child: BaseText(
                        color: Color(0XFF707070),
                        margin: 5,
                        text: RefreshApp.of(context)!
                            .apiAppVariables
                            .user!
                            .phone
                            .toString(),
                        marginh: 20,
                        fontSize: 10,
                        onPressed: () {},
                        clickable: false,
                        fontWeight: FontWeight.normal,
                      )),
                  Expanded(
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Wrap(children: [
                          BaseText(
                            color: Color(0XFF707070),
                            margin: 5,
                            text:
                                "${widget.addressItem.apartmentNumber},${widget.addressItem.building},${widget.addressItem.street},${widget.addressItem.city},${widget.addressItem.state},${widget.addressItem.country}",
                            marginh: 20,
                            fontSize: 10,
                            onPressed: () {},
                            clickable: false,
                            fontWeight: FontWeight.normal,
                          ),
                        ])),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.only(top: 15, bottom: 5, right: 20, left: 0),
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ]),
              )
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.all(20),
                      alignment: AlignmentDirectional.topEnd,
                      child: InkWell(
                          onTap: () {
                            deleteAddress(widget.addressItem);
                          },
                          child: AppIcon(
                            icon: AppIcon.CLOSE_PATH,
                            size: 15,
                          ))),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  deleteAddress(ApiAddress addressItem) {
    HttpAPI http = HttpAPI();
    Dio dio = http.Inisalize(context);
    return dio.delete('address/' + addressItem.id.toString()).then((value) {
      if (value.data['status'] == 'success') {
        List<ApiAddress> addresses = List<ApiAddress>.from(
            value.data['data'].map((model) => ApiAddress.fromJson(model)));
        CheckoutPage.selectedAddress.state = "";

        setState(() {
          RefreshApp.of(context)!.apiAppVariables.addresses = addresses;
          if (addresses.length > 0) {
            CheckoutPage.selectedAddress = addresses.first;
            CheckoutPage.selectedId = addresses.first.id;
          }
        });
        MyApp.refreshApp(context);
      }
    });
  }
}
