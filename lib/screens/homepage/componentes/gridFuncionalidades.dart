import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';

class GridFuncionalidades extends StatelessWidget {
  //const GridFuncionalidades({ Key? key }) : super(key: key);
  String titulo = "Mais agilidade e confiança, onde quer que você esteja";
  String descricao =
      "Veja como é possível implantar uma gestão otimizada para cada área de sua clínica";
  final List<Map> lista = [
    {
      "icon": Icons.devices_outlined,
      "titulo": "Acesso Rápido",
      "descricao":
          "\nCompativel com todos dispositivo, acesse de qualquer lugar."
    },
    {
      "icon": Icons.dvr_rounded,
      "titulo": "Prescrição Digital",
      "descricao":
          "\nGeração de receitas e exames digitais integradas ao módulo médico e as informações do paciente."
    },
    {
      "icon": Icons.event_note,
      "titulo": "Sistema de Agenda",
      "descricao":
          "\nControle o agendamento de consultas e retornos programados dos seus pacientes."
    },
    {
      "icon": Icons.sms_outlined,
      "titulo": "Chat",
      "descricao":
          "\nChat dedicado, para atender pacientes e funcionários on-line. "
    },
    {
      "icon": Icons.monetization_on_outlined,
      "titulo": "Financeiro",
      "descricao":
          "\nControle financeiro apresentado por gráficos e relatórios, possibilitando uma visão unificada. "
    },
    {
      "icon": Icons.subtitles_outlined,
      "titulo": "Prontuário Médico",
      "descricao":
          "\n Acesse informações referente ao atendimento do seu paciente, em qualquer lugar. "
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        padding:
            EdgeInsets.only(left: _size.width * 0.1, right: _size.width * 0.1),
        color: kWhite,
        height: Responsive.getValue(context, 800, 650, 750),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                height: 1,
                color: kPrimaryColor,
                fontSize: Responsive.getFontSize(context, 30, 60)),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: 0.1 * _size.width, right: 0.1 * _size.width),
              child: Text(
                "\n$descricao\n\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    height: 1.3,
                    color: kGrey,
                    fontSize: Responsive.getFontSize(context, 15, 25)),
              )),
          GridView.count(
              physics: ScrollPhysics(),
              childAspectRatio: Responsive.getValue(
                  context,
                  2*_size.width/750 ,
                  1.7*_size.width /1100,
                  1.6*_size.width/1100),
              shrinkWrap: true,
              crossAxisCount: Responsive.getValue(context, 2, 3, 3).toInt(),
              children: List.generate(lista.length, (index) {
                return Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        Icon(
                          lista[index]["icon"],
                          size: Responsive.getValue(context, 40, 55, 70),
                          color: kPrimaryColor,
                        ),
                        Text(
                          lista[index]["titulo"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              height: 0.9,
                              color: kPrimaryColor,
                              fontSize:
                                  Responsive.getFontSize(context, 15, 25)),
                        ),
                        Text(
                          lista[index]["descricao"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w200,
                              height: 1.3,
                              color: kGrey,
                              fontSize:
                                  Responsive.getFontSize(context, 10, 15)),
                        )
                      ],
                    ));
              })),
        ]));
  }
}
