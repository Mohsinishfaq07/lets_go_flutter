import 'package:flutter/material.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';

class DriveSplashScreen extends StatelessWidget {
  const DriveSplashScreen({Key? key}) : super(key: key);
  @override  Widget build(BuildContext context) {
    return const DriveSplashScreenContent();
  }
}
class DriveSplashScreenContent extends StatefulWidget {
  const DriveSplashScreenContent({Key? key}) : super(key: key);
  @override  State<DriveSplashScreenContent> createState() => _DriveSplashScreenContentState();
}
class _DriveSplashScreenContentState extends State<DriveSplashScreenContent> {
  DriveSplashServices splashScreen = DriveSplashServices();
  @override  void initState() {
    super.initState();
    // TODO: implement initState    super.initState();
    splashScreen.isLogin(context);
  }
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Text('Driver',style: TextStyle(color: Colors.grey,fontSize: 80,fontWeight: FontWeight.bold),),
        ) ,
      ),
    );
  }
}
class DriveSplashServices{
  void isLogin(BuildContext context){
    Future.delayed(const Duration(seconds: 2), () {
      AppState appState = sl();
      appState.goToNext(PageConfigs.earnByDrivingPageConfig);
    });
     // Navigator.push(context, MaterialPageRoute(builder: (context) => IntroductionScreenContent()))    );
  }
}