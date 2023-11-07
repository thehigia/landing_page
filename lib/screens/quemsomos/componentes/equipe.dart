import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';

import 'cardEquipe.dart';

class Equipe extends StatelessWidget {
  //const Equipe({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
     
              padding: EdgeInsets.only(
                  left: Responsive.getValue(context, 0.05 * _size.width,
                      0.1 * _size.width, 0.2 * _size.width),
                  right: Responsive.getValue(context, 0.05 * _size.width,
                      0.1 * _size.width, 0.2 * _size.width)),
              child: Column(children: [
                Text(
                  "\nNossa Equipe\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: Responsive.getFontSize(context, 30, 60),
                      color: kPrimaryColor),
                ),
                Responsive.isMobile(context)?Column(children: [
                      CardEquipe(
                            foto: "assets/images/milton.gif",
                            nome: "Dr. Milton Mendes",
                            funcao: "Coordenador",
                          ),
                          CardEquipe(
                            foto: "assets/images/bruno.jpeg",
                            nome: "Dr. Bruno Monteiro",
                            funcao: "Vice-Coordenador",
                          ),
                        
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                          "+3 Doutorandos\n+ 1 mestre\n+ 1 mestrando\n+ 2 desenvolvedores de software",
                         textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kGrey, fontSize: Responsive.getFontSize(context, 15, 25))),
                    
                ],):Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          CardEquipe(
                            foto: "assets/images/milton.gif",
                            nome: "Dr. Milton Mendes",
                            funcao: "Coordenador",
                          ),
                          CardEquipe(
                            foto: "assets/images/bruno.jpeg",
                            nome: "Dr. Bruno Monteiro",
                            funcao: "Vice-Coordenador",
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color: kGrey,
                        height: 250,
                        width: 1,
                        margin: EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                      ),
                    
                    Expanded(
                      flex: 5,
                      child: Text(
                          "+3 Doutorandos\n+ 1 mestre\n+ 1 mestrando\n+ 2 desenvolvedores de software",
                          style: TextStyle(color: kGrey, fontSize: 25)),
                    )
                  ],
                ),
            
                SizedBox(
                  height: 150,
                )
              ]));
  }
}