import 'package:flutter/material.dart';
import 'package:portalhigia/header.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/drawer.dart';
import 'package:portalhigia/floatActionButton.dart';
import 'package:portalhigia/responsive.dart';
import 'package:portalhigia/rodape.dart';
import 'package:portalhigia/screens/planos/componentes/cardPlanos.dart';

class Planos extends StatefulWidget {
  //const Planos({ Key? key }) : super(key: key);

  @override
  _PlanosState createState() => _PlanosState();
}

class _PlanosState extends State<Planos> {
  final List<Map> planoGratis = [
    {
      "titulo": "HIGIA PRO",
      "descricao": "Versão de Teste",
      "item": [
        "Agenda intuitiva",
        "Gestão Cínica",
        "Prontuário Eletônico",
        "Informações Gráficas",
        "Financeiro",
        "Sala de Espera",
        "Histórico de Consultas",
        "Relatórios"
      ],
      "preco": "Grátis*",
      "botao": "      Consultar      ",
      "rodape": "*Pelo período de 15 dias"
    }
  ];

  final List<Map> planoMensal = [
    {
      "titulo": "HIGIA PRO",
      "descricao": "Mensal",
      "item": [
        "Agenda intuitiva",
        "Gestão Cínica",
        "Prontuário Eletônico",
        "Informações Gráficas",
        "Financeiro",
        "Sala de Espera",
        "Histórico de Consultas",
        "Relatórios"
      ],
      "preco": "Consulte*",
      "botao": "      Consultar      ",
      "rodape": "*Entre em contato para valores"
    }
  ];

  final List<Map> planoAnual = [
    {
      "titulo": "HIGIA PRO",
      "descricao": "Anual",
      "item": [
        "Agenda intuitiva",
        "Gestão Cínica",
        "Prontuário Eletônico",
        "Informações Gráficas",
        "Financeiro",
        "Sala de Espera",
        "Histórico de Consultas",
        "Relatórios"
      ],
      "preco": "Consulte*",
      "botao": "      Consultar      ",
      "rodape": "*Entre em contato para valores"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBgLightColor,
        floatingActionButton: FloatActionButton(),
        drawer: DrawerItens(),
        appBar: PreferredSize(
            preferredSize: Responsive.isMobile(context)
                ? Size.fromHeight(50.0)
                : (Responsive.isTablet(context)
                    ? Size.fromHeight(75.0)
                    : Size.fromHeight(100)), // here the desired height
            child: Header()),
        body: Scrollbar(
          isAlwaysShown: true,
          child: SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      //minHeight: viewportConstraints.maxHeight,
                      ),
                  child:
        
        
        
        Column(children: [
          Text(
            "\nComeçe agora uma\nexperiência Higia.com",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: Responsive.getFontSize(context, 30, 60)),
          ),
          Text(
            "\nContrate nosso plano\n\n",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kGrey,
                fontSize: Responsive.getFontSize(context, 15, 25)),
          ),
          Center(
              child: Responsive.isMobile(context)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          CardPlanos(planoGratis),
                          CardPlanos(planoMensal),
                          CardPlanos(planoAnual)
                        ])
                  : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      CardPlanos(planoGratis),
                      CardPlanos(planoMensal),
                      CardPlanos(planoAnual)
                    ])),
          SizedBox(
            height: 150,
          ),
          Rodape()
        ])))));
  }

   
}
