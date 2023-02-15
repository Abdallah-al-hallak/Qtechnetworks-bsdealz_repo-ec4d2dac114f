
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../main.dart';
import '../../items/lists/campaign_item.dart';
import '../../items/lists/web/campaign_item_web.dart';
import '../../items/texts/TitleText.dart';


class MainFragment extends StatefulWidget {


  @override
  _MainFragmentState createState() =>
      _MainFragmentState();
}

class _MainFragmentState extends State<MainFragment>  with WidgetsBindingObserver{

  final List<AppLifecycleState> _stateHistoryList = <AppLifecycleState>[];
  _MainFragmentState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (WidgetsBinding.instance.lifecycleState != null) {
      _stateHistoryList.add(WidgetsBinding.instance.lifecycleState!);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _stateHistoryList.add(state);
      print("-------Reloading View main frag "+_stateHistoryList.last.toString());
      if(_stateHistoryList.last.toString().contains("paused")){
        RefreshApp.of(context)!.localCart.items!.clear();
        RefreshApp.of(context)!.activeCampaignWidgets.clear();
        RefreshApp.of(context)!.apiAppVariables!.activeCampaigns!.forEach((element) {
          if (kIsWeb) {
            RefreshApp.of(context)!.activeCampaignWidgets.add(CampaignItemWeb(
              mycampagin: element, height: 350, width: 1,
            ));
          } else {
            RefreshApp.of(context)!.activeCampaignWidgets.add(CampaignItem(

              mycampagin: element, height: 555, width: 1,
            ));
          }
        });
        MyApp.refreshApp(context);
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //fetchData();

    {
   //   EasyLoading.dismiss();
      print("Token MainFragment-------"+RefreshApp.of(context)!.apiHeaders.toJson().toString());
      print("apiAppVariables-------"+RefreshApp.of(context)!.apiAppVariables.toJson().toString());
      double width=MediaQuery.of(context).size.width;
      if(kIsWeb){
        width=1500;

      }
      return
      Container(

        width: width,
        child: ListView(
          controller: RefreshApp.of(context)!.main_fragment_scroll_controller,
          children: [
            RefreshApp.of(context)!.bannersLayout,
            RefreshApp.of(context)!.closingSoonCampaignLayout,
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container( child: TitleText(text: "Active Campaigns", onPressed: (){}, clickable: false)),
                ],),),
          //  Container(height: 200,child: ListView( children: [Wrap(children:activeCampaginsWidgets!)])),
            Wrap(children:  RefreshApp.of(context)!.activeCampaignWidgets),
            RefreshApp.of(context)!.soldoutLayout,
            Container(

              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container( child: TitleText(text: "Winners", onPressed: (){}, clickable: false)),
                  //     Flexible(
                  //       flex: 1,
                  //   child: Container(
                  //
                  //       alignment: Alignment.bottomRight,
                  //       margin: EdgeInsets.only(bottom: 10),
                  //       child: FooterText(text: "View More", onPressed: (){}, clickable: true)),
                  // )
                ],),),
        Wrap(children:RefreshApp.of(context)!.winnersWidgets)
          //  RefreshApp.of(context)!.winnersLayout,
          ],
        ),
      );
    }



  }

}

