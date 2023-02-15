
import 'package:bsdealz/layouts/items/tobars/back_bar.dart';
import 'package:bsdealz/layouts/pages/main/home_page.dart';
import 'package:bsdealz/main.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../items/buttons/BaseButton.dart';
import '../../items/buttons/MainButton.dart';
import '../../items/buttons/ToggleBtn.dart';
import '../../items/icons/AppIcon.dart';
import '../../items/texts/BaseText.dart';
import '../../items/texts/TitleText.dart';



class MyCouponFragment extends StatefulWidget {

  @override
  _MyCouponFragmentState createState() =>
      _MyCouponFragmentState();
}

class _MyCouponFragmentState extends State<MyCouponFragment> {

  List<Widget> DrawsWidgets=[Container()];
  List<Widget> WinnersWidgets=[Container()];
  _MyCouponFragmentState();
  bool isFrawsFocus=true;
  @override
  void initState() {
    super.initState();
    if(mounted) {


      //    fetchCampaigns();

    }
  }

  Widget cartWidget=Container();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if(RefreshApp.of(context)!.apiAppVariables!.userCoupons!=null) {
      if (RefreshApp.of(context)!.apiAppVariables!.userCoupons!.length < 1) {
        cartWidget = ListView(children: [
          //TitleText(text: "My Cart", onPressed: (){}, clickable: false),
          Container(height: 200,),
          AppIcon(icon: AppIcon.COUPON_PATH, size: 70, color: Colors.grey,),
          Center(
            child: BaseText(
              color: Colors.grey,
              text: "You Can see your tickets here after you make a purchase",
              margin: 25,
              marginh: 25,
              fontSize: 13,
              onPressed: () {},
              fontWeight: FontWeight.normal,
              clickable: false,
            ),
          ),
          Container(height: 100,),
          MainButton(onPressed: () {
            setState(() {
              RefreshApp.of(context)!.selectedIndex = 2;
            });
            MyApp.refreshApp(context);
          }, text: "Start shopping", isActive: true),

        ],);
        return Scaffold(
            body: SafeArea(
                child: Container(
                    color: Colors.white,
                    child: Column(
                        children: [
                          TitleText(
                              text: "My Coupons",
                              onPressed: () {},
                              clickable: false),
                          Expanded(
                              child: cartWidget),
                        ]
                    ))));
      } else {
        return
          Container(
            color: Colors.white,

            child: ListView(
              controller: RefreshApp.of(context)!
                  .main_fragment_scroll_controller,
              children: [
                Container(
                  alignment: Alignment.center,

                  child: TitleText(
                      text: "My Coupons", onPressed: () {}, clickable: false),),
                Wrap(children: RefreshApp.of(context)!.couponWidgets),
              ],
            ),
          );
      }
    }else{
      return Scaffold(
          body: SafeArea(
              child: Container(
                  color: Colors.white,
                  child: Column(
                      children: [
                        TitleText(
                            text: "My Coupons",
                            onPressed: () {},
                            clickable: false),
                        Expanded(
                            child: cartWidget),
                      ]
                  ))));
    }



  }

}

