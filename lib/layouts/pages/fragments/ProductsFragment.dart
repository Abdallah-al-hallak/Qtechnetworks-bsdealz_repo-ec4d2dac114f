import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:flutter/material.dart';
import '../../items/texts/TitleText.dart';


class ProductsFragment extends StatefulWidget {

  @override
  _ProductsFragmentState createState() =>
      _ProductsFragmentState();
}

class _ProductsFragmentState extends State<ProductsFragment> {
  _ProductsFragmentState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Container(

        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: TitleText(text: "Products",onPressed: (){},clickable: false),),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: 100 / 65
                ),
                children:
                RefreshApp.of(context)!.productsWidgets,

              ),
            ),
          ],
        ),
      );
  }

}

