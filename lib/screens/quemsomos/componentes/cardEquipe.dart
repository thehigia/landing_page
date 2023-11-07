import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';

class CardEquipe extends StatelessWidget {
  String nome;
  String foto;
  String funcao;

  CardEquipe({this.nome, this.foto, this.funcao});

  //const CardEquipe({ Key? key }) : sup//er(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipOval(
                      child: Image.asset(
                    foto,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )),
                ),
                    Text(
                      nome.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: Responsive.getFontSize(context, 15, 20)),
                    ),
                    Text(
                      funcao,
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: kGrey,
                          fontSize: Responsive.getFontSize(context, 10, 15)),
                    )
                  ],
                ),
                
              ])
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      nome.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: Responsive.getFontSize(context, 15, 20)),
                    ),
                    Text(
                      funcao,
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: kGrey,
                          fontSize: Responsive.getFontSize(context, 10, 15)),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipOval(
                      child: Image.asset(
                    foto,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )),
                )
              ]);
  }
}
