import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:my_news_app/screens/main_screen.dart';
import 'package:my_news_app/style/theme.dart';



class Splash_Screen extends StatefulWidget  {
  static const scid="Splash";
  const Splash_Screen({Key key}) : super(key: key);

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen>  {



  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(milliseconds: 5000),(){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) =>MainScreen ()),
            (Route<dynamic> route) => false,
      );


      //Navigator.of(context).pushNamed(Intro_Screen.scid);
    });




  }
  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;

    return Scaffold(

      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/80,),
                  child: Container(
                    height: height/6,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('assets/img/notizie-low-resolution-logo-color-on-transparent-background.png'),
                          fit: BoxFit.cover
                      ),
                    ),
                  )),
              SizedBox(height: height/10,),


              Opacity(
                  opacity:1 ,
                  child: Container(
                    height: height/8,
                    width: width/4,
                    child: Opacity(
                      opacity: 1,
                      child: LoadingIndicator(
                          indicatorType: Indicator.ballPulseRise, /// Required, The loading type of the widget
                          colors:[Color.fromRGBO(230, 81, 0, 1)],       /// Optional, The color collections
                          strokeWidth: 1,

                          backgroundColor: Color.fromRGBO(255, 255, 255, 1),      /// Optional, Background of the widget
                          pathBackgroundColor: Color.fromRGBO(255, 255, 255, 1)   /// Optional, the stroke backgroundColor
                      ),
                    ),
                  )
              ),
            ],
          )


        ],
      ),
    );
  }
}
