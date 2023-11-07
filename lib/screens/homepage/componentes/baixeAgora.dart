import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class BaixeAgora extends StatefulWidget {
  //const BaixeAgora({ Key? key }) : super(key: key);

  @override
  _BaixeAgoraState createState() => _BaixeAgoraState();
}

Widget celular(context){
  return  Stack(
    
    children: [
          Container(
            width: Responsive.getValue(context, 250, 300, 400),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(45),
          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset("assets/images/login_mobile.png", fit: BoxFit.fitHeight,))),
        Container(
          width: Responsive.getValue(context, 250, 300, 400),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(30),
          child:Image.asset("assets/images/iphone.png", fit: BoxFit.fitHeight,)),
        
        ],);
}

Widget textos(context){
  double _width= MediaQuery.of(context).size.width;

  return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: Responsive.isMobile(context)? CrossAxisAlignment.center: CrossAxisAlignment.start,
          children: [
          Text("Baixe agora\nHigia Way", 
          textAlign: Responsive.isMobile(context)? TextAlign.center: TextAlign.start,
          style: TextStyle(height: 1, color: kPrimaryColor, fontSize: Responsive.getFontSize(context, 30, 60), fontWeight: FontWeight.w600 )),
          Container(
            width: Responsive.getValue(context, 0.8*_width, 0.4*_width, 0.4*_width),
            child: Text("\nConheça também nosso App Higia Way, desenvolvido para ajudar futuras mamães de uma forma divertida a aprender cada vez mais sobre assuntos maternos ao longo de todas as fases da gravidez\n", 
              textAlign: Responsive.isMobile(context)? TextAlign.center: TextAlign.start,
            style: TextStyle(color: kGrey, fontSize: Responsive.getFontSize(context, 15, 25), fontWeight: FontWeight.w200 )),
          ),
          InkWell(
                  onTap: () {
                    abrirLink("http://higia.doctraining.com.br");
                  },
                  child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1, color: kPrimaryColor)),
                      child: Text(
                        "Saiba mais",
                        style: TextStyle(
                            fontSize: Responsive.getFontSize(context, 15, 25),
                            fontWeight: FontWeight.w200,
                            color: kPrimaryColor),
                      )),
                ),
          Container(
            width: Responsive.getValue(context, 0.8*_width, 0.4*_width, 0.4*_width),
            child: Text("\nDisponível na versão\nAndroid e IOS\n\n", 
              textAlign: Responsive.isMobile(context)? TextAlign.center: TextAlign.start,
            style: TextStyle(color: kGrey, fontSize: Responsive.getFontSize(context, 15, 25), fontWeight: FontWeight.w200 )),
          ),
          
           Row(
             mainAxisAlignment: Responsive.isMobile(context)?MainAxisAlignment.center:MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Responsive.getValue(context, 125, 150, 150),
                  child:Image.asset("assets/images/app_store.png", ),),
                SizedBox(
                  width: 10,
                ),
                SizedBox(width:Responsive.getValue(context, 125, 150, 150), 
                child:  
                Image.asset("assets/images/play_store.png", ),),
                  
                
              ],)]
            );
}

class _BaixeAgoraState extends State<BaixeAgora> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double scala = 1;
    return  Container(
      padding: EdgeInsets.only(right: Responsive.getValue(context, 0.05*_size.width, 0.1*_size.width, 0.15*_size.width) , left: Responsive.getValue(context, 0.05*_size.width, 0.1*_size.width, 0.2*_size.width) ),
      height: Responsive.getValue(context, 810, 650, 650),
      decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1],
                colors: [
                  kWhite,
                  kWhite,
                ],
                tileMode: TileMode.clamp),
          ),
      width: _size.width,
      child: Responsive.isMobile(context)? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        celular(context)
        ,
        textos(context)
      ],): 
      
      Stack(
        alignment: Alignment.center,
        children: [

        Container(
          alignment: Alignment.centerRight,
          child:celular(context)),
        textos(context) 
        
      ],)
    );
  }


  
}

abrirLink(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}