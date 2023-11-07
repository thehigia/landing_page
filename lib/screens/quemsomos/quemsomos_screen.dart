import 'package:flutter/material.dart';
import 'package:portalhigia/floatActionButton.dart';
import 'package:portalhigia/header.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/drawer.dart';
import 'package:portalhigia/responsive.dart';
import 'package:portalhigia/rodape.dart';
import 'package:portalhigia/screens/quemsomos/componentes/bannerBoxTexto.dart';
import 'package:portalhigia/screens/quemsomos/componentes/carrosel.dart';
import 'package:portalhigia/screens/quemsomos/componentes/equipe.dart';
import 'package:url_launcher/url_launcher.dart';

class QuemSomos extends StatelessWidget {
  //const QuemSomos({ Key? key }) : super(key: key);

  final _controller = ScrollController();

  Widget surgimento = BannerBoxTexto(
                    backgroundColor: Colors.transparent,
                    titulo: "Surgimento do Higia",
                    descricao:
                        "O projeto nasceu devido o crescimento da demanda por serviços virtuais de saúde e aprendizagem sobre saúde e qualidade de vida após a crise sanitária do novo coronavirus",
                  );
  Widget proposito = BannerBoxTexto(
                    titulo: "Nosso Propósito",
                    descricao:
                        "Gerar uma melhor experiência no relacionamento médico-paciente, resgatando o conceito de médico da família",
                  );  

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

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
        body: ListView(
          controller: _controller,
          children: [
            //Carousel(),
            Container(
              height: Responsive.getValue(context, 150, 250, 300),
              child: Image.asset("assets/images/trabalho.jpg", fit: BoxFit.fitWidth,),
            ),
            Responsive.isMobile(context)?Column(children: [
              surgimento,
              proposito
            ],):
            Row(
              children: [
                Expanded(
                  child: surgimento
                ),
                Expanded(
                  child: proposito
                ),
              ],
            ),
            Equipe(),
            Rodape()
          ],
        ));
  }

  abrirLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
