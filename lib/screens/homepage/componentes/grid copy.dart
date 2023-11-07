import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';

class Grid extends StatefulWidget {
  // const Grid({ Key? key }) : super(key: key);

  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  String titulo = "Módulos\nPersonalizados";
  String descricao = "Ambiente intuitivo e voltado para o perfil do usuário";
  int hoverAtual = 0;
  String imagemAtual = "assets/images/modulo_medico.png";
  final List<Map> lista = [
    {
      "icon": Icons.account_circle_outlined,
      "img": "assets/images/modulo_medico.png",
      "titulo": "Médico",
      "descricao": "Medicos qualificados"
    },
    {
      "icon": Icons.account_circle_outlined,
      "img": "assets/images/modulo_diretor.png",
      "titulo": "Diretor",
      "descricao": "diretor dfdf"
    },
    {
      "icon": Icons.group,
      "img": "assets/images/modulo_paciente.png",
      "titulo": "Paciente",
      "descricao": "Painel de usuário"
    },
    {
      "icon": Icons.add_business_outlined,
      "img": "assets/images/modulo_clinica.png",
      "titulo": "Clinica",
      "descricao": "Painel de usuário"
    },
    {
      "icon": Icons.support_agent_outlined ,
      "img": "assets/images/modulo_atendente.png",
      "titulo": "Atendente",
      "descricao": "Painel de usuário"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return 
      Container(
      alignment: Alignment.center,
      color: kGreyColor,
      width: MediaQuery.of(context).size.width,
      height: 650*scaleResponsive(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
      
      Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          
         Container(
          //padding: EdgeInsets.only(bottom: 200), 
          width: 507*scaleResponsive(),
          height: 429*scaleResponsive(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/mac.png"), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(9*scaleResponsive())),
        ),
         
         
         Container(
          margin: EdgeInsets.only(top:18*scaleResponsive(),),
          width: 468*scaleResponsive(),
          height: 273*scaleResponsive(),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagemAtual), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(0)),
        ),
        
       
      ]
      
      
      ),
      SizedBox(
        height: 10*scaleResponsive(),
      ),
      Padding(padding: EdgeInsets.only(left:50),child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(titulo, style:TextStyle(color:kWhite, fontSize: 60*scaleResponsive(), height: 0.8, fontWeight: FontWeight.w600)),
        Text(descricao, style:TextStyle(color:kWhite, fontSize: 20*scaleResponsive(),height: 1.5, fontWeight: FontWeight.w200)),
        Container(
          margin: EdgeInsets.only(top:40*scaleResponsive()),
          width: 700*scaleResponsive(),
          height: 120*scaleResponsive(),
          
          
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              shrinkWrap: true,
                  itemCount: lista.length,
                  itemBuilder: (BuildContext context, int index) =>
                InkWell(
                    onTap: () {
                      setState(() {
                          imagemAtual = lista[index]["img"];
                          hoverAtual = index;
                            //print(imagemAtual);
                        });
                    },
                    onHover: (isHovering) {
                      if (isHovering) {
                        setState(() {
                          imagemAtual = lista[index]["img"];
                          hoverAtual = index;
                            //print(imagemAtual);
                        });

                      }
                     
                    },
                   
                      child: AnimatedContainer(
                          padding: hoverAtual != index
                                        ? EdgeInsets.only(top: 10, bottom: 10)
                                        : EdgeInsets.all(0),
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn,
                        child:Container(
                        width: (500/lista.length)*scaleResponsive(),
                      margin: EdgeInsets.only(left:10*scaleResponsive(), right:10*scaleResponsive(),),
                      padding: EdgeInsets.only(left:10*scaleResponsive(), right: 10*scaleResponsive()),
                      decoration: BoxDecoration(
                        color: hoverAtual==index?kPrimaryColor.withOpacity(0.5):Colors.transparent,
            borderRadius: BorderRadius.circular(8*scaleResponsive()),
            border: Border.all(width: 1, color: kWhite)

          ),
                      
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         
                          Icon(lista[index]["icon"], color: kWhite, size: 40,),
                          Text(lista[index]["titulo"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15*scaleResponsive(), color: kWhite),),
                         ],
                      ),

                    ))))
              ),
      
      ],))
      
      
      ]));
  }

  double scaleResponsive(){
    if(Responsive.isMobile(context)){
      return 0.5;

    }
    else if(Responsive.isTablet(context)){
      return 0.75;

    }
    else{
      return 1;
    }
  }
}
