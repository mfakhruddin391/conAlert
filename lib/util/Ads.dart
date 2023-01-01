import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';

const izitScamAppID = 'ca-app-pub-3938226316313331~7742492213';

const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['investment', 'invest','forex','rich','bitcoin','coin','business','trader','scammer','scam','quick-rich','scheme'],
  contentUrl: 'https://flutter.io',
  childDirected: false,
  nonPersonalizedAds: true,

  testDevices: <String>[
    //'9D3605279A9477F4DC228C121BA3176E',
  ], // Android emulators are considered test devices
);





Future adsInit() async {

   WidgetsFlutterBinding.ensureInitialized();
   await FirebaseAdMob.instance.initialize(appId:izitScamAppID);
 }

 bannerAd() {
   const izitScamBannerAdUnitID = 'ca-app-pub-3938226316313331/6697019765';

   BannerAd myBanner = BannerAd(
     // Replace the testAdUnitId with an ad unit id from the AdMob dash.
     // https://developers.google.com/admob/android/test-ads
     // https://developers.google.com/admob/ios/test-ads
     //Wait 24 hours first before display Ad .
     adUnitId: izitScamBannerAdUnitID,

     size: AdSize.banner,
      targetingInfo: targetingInfo,
       listener: (MobileAdEvent event) {
         print("BannerAd event is $event");
       },
   );


   return  myBanner
   // typically this happens well before the ad is shown
     ..load()
     ..show(
       // Positions the banner ad 60 pixels from the bottom of the screen
       anchorOffset: 60.0,
       // Positions the banner ad 10 pixels from the center of the screen to the right
       horizontalCenterOffset: 10.0,
       // Banner Position
       anchorType: AnchorType.bottom,

     );
 }

