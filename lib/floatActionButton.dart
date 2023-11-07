import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';
import 'formulario.dart';

class FloatActionButton extends StatelessWidget {
  //const FloatActionButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          right: 0.01 * _size.width, bottom: 0.01 * _size.height),
      alignment: Alignment.bottomRight,
      child: InkWell(
          child: Image.asset("assets/icons/whats.png", height: 60),
          onTap: () {
            abrirLink(
                "https://api.whatsapp.com/send?phone=558494114132&text=Ol%C3%A1%2C%20preciso%20de%20uma%20consultoria!");
            
          }),
    );
  }

  abrirLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
