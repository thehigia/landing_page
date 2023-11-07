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
  String descricao =
      "\nAmbiente intuitivo e voltado para o perfil do usuário\n";
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
      "img": "assets/images/modulo_diretor.png",
      "titulo": "Clinica",
      "descricao": "Painel de usuário"
    },
    {
      "icon": Icons.support_agent_outlined,
      "img": "assets/images/modulo_atendente.png",
      "titulo": "Atendente",
      "descricao": "Painel de usuário"
    },
  ];

  Widget _Tela() {
    return Stack(alignment: AlignmentDirectional.topCenter, children: [
     
      Container(
        margin: EdgeInsets.only(
          top: scaleResponsive(18),
        ),
        width: scaleResponsive(468),
        height: scaleResponsive(273),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagemAtual), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(0)),
      ),
       Container(
        width: scaleResponsive(507),
        height: scaleResponsive(429),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/mac.png"), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(scaleResponsive(9))),
      ),
    ]);
  }

  Widget _Texto() {
    return Padding(
        padding: Responsive.isMobile(context)
            ? EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05)
            : EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: Responsive.isMobile(context)
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(titulo,
                textAlign: Responsive.isMobile(context)
                    ? TextAlign.center
                    : TextAlign.left,
                style: TextStyle(
                    color: kWhite,
                    fontSize: Responsive.getFontSize(context, 30, 60),
                    height: 1,
                    fontWeight: FontWeight.w600)),
            Text(descricao,
            textAlign: TextAlign.center,
                style: TextStyle(
                    color: kWhite,
                    fontSize: Responsive.getFontSize(context, 15, 25),
                    height: 1.3,
                    fontWeight: FontWeight.w200)),
          ],
        ));
  }

  Widget _Icones() {
    double _width = MediaQuery.of(context).size.width*0.9;
    double _widthListIcons = Responsive.isMobile(context)? _width :_width*3/5;
    return Container(
      
        padding: Responsive.isMobile(context)
            ? EdgeInsets.all(0)
            : EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
        alignment:
            Responsive.isMobile(context) ? Alignment.center : Alignment.topLeft,
        width: _widthListIcons,
        height: scaleResponsive(150),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: lista.length,
            itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () {
                  setState(() {
                    imagemAtual = lista[index]["img"];
                    hoverAtual = index;
                  });
                },
                onHover: (isHovering) {
                  if (isHovering) {
                    setState(() {
                      imagemAtual = lista[index]["img"];
                      hoverAtual = index;
                    });
                  }
                },
                child: AnimatedContainer(
                    padding: hoverAtual != index
                        ? EdgeInsets.only(top: 10, bottom: 10)
                        : EdgeInsets.all(0),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    child:  Container(
                        width: 0.70*_widthListIcons/lista.length,
                        margin: EdgeInsets.only(
                          right: scaleResponsive(20),
                        ),
                        decoration: BoxDecoration(
                            color: hoverAtual == index
                                ? kPrimaryColor.withOpacity(0.5)
                                : Colors.transparent,
                            borderRadius:
                                BorderRadius.circular(scaleResponsive(8)),
                            border: Border.all(width: 1, color: kWhite)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              lista[index]["icon"],
                              color: kWhite,
                              size: Responsive.getFontSize(context, 20, 50),
                            ),

                            Text(
                              lista[index]["titulo"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      Responsive.getFontSize(context, 8, 18),
                                  color: kWhite),
                            ),
                          ],
                        ),
                      ),
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
        // padding:
        //     EdgeInsets.only(left: 0.1 * _size.width, right: 0.1 * _size.width),
        alignment: Alignment.center,
        color: kGreyColor,

        height: Responsive.getValue(context, 500, 550, 550),
        child: Responsive.isMobile(context)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Texto(), _Tela(), _Icones()],
              )
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(flex:2,child:Padding(
                  padding:  EdgeInsets.only(left:0.01*_size.width),
                  child: _Tela(),
                )),
                Expanded(
                  flex: 3,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [_Texto(), _Icones()]),
                )
              ]));
  }

  double scaleResponsive(double value) {
    return Responsive.getFontSize(context, 0.5 * value, value);
  }
}
