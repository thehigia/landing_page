import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';

import 'responsive.dart';

class Rodape extends StatelessWidget {
  //const Rodape({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: Responsive.getValue(context, 90, 120, 120),
      padding:  EdgeInsets.only(left:0.05*_width, right: 0.05*_width),
      color: kGreyColor,
      child:Row(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(context, "Termos e Condições"),
            text(context,  "Privacidade da Conta"),
            text(context, "contato@higia.com.br")

          ],
        )),
        Container(
          margin: EdgeInsets.only(top:10, bottom: 10),
          width: 1,
          color: kWhite,
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset("assets/icons/logo.png", scale: 5,),
            text(context,"Higia - Gestão Clínica e Médica")
          ],
        )),
        
      ],
    ));
  }

  Text text(context, String txt){
    return Text(
      txt,
      style: TextStyle(color: kWhite, height: 1.5, fontSize: Responsive.getFontSize(context, 10, 12))

    );
  }

}
