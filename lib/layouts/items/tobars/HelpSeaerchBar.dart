import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/utils/inherited/filter_drawer_model.dart';
import 'package:flutter/material.dart';


class HelpSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool backOn;

  search(context) {}

  HelpSearchBar({
    Key? key,
    required this.height,
    required this.backOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backWidget=Container(width: 10,);
    if(backOn){
      backWidget= IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).accentColor,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context));
    }
    return Column(
      children: [
        Container(

          child: Padding(
            padding: EdgeInsets.only(bottom: 2, left: 2, right: 2),
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(0),
              child: Row(children: [
                //  IconButton(icon: SvgPicture.asset("images/menu.svg",),   onPressed: () => null,),
                backWidget,
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PhysicalModel(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(8),
                          shadowColor: Colors.black,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: height,
                              child: TextField(
                                cursorColor: Colors.black,
                                controller: TextEditingController(
                                    text: FilterModel.of(context)?.searchT),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  height: 1.5,
                                  //color: Colors.black
                                ),
                                decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 18,
                                    ),

                                    contentPadding: EdgeInsets.only(
                                        left: 15, bottom: 0, top: 0, right: 15),
                                    hintText: getTranslated(context, "search").toString()),
                                onSubmitted: (value) {
                                  FilterModel.of(context)?.searchT = value;
                                  if (value != null && value.isNotEmpty) {
                                    try {
                                      //   ProductsList.of(context).SearchData(value);
                                    } catch (e) {
                                      print(e.toString());
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) {
                                      //     return ProductsList(
                                      //       searchtxt: value,
                                      //     );
                                      //   }),
                                      // );
                                    }
                                  } else {
                                    // Navigator.pop(context);
                                    try {
                                      //  ProductsList.of(context).fetchData('');
                                    } catch (e) {
                                      print(e.toString());
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) {
                                      //     return
                                      //       ProductsList(
                                      //       searchtxt: '',
                                      //     );
                                      //   }),
                                      // );
                                    }
                                  }
                                  //ProductsList.of(context).SearchData(value);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container( width: 10,),
                InkWell(
                    onTap:(){

                    },
                    child: Text("New",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Theme.of(context).primaryColor),)),
                  InkWell(
                      onTap:(){

                      },child: Container(   padding:EdgeInsets.all(5),width:34,child: Image.asset("assets/images/plusblue.png",))),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
