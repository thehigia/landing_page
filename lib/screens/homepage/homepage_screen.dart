import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portalhigia/drawer.dart';
import 'package:portalhigia/floatActionButton.dart';
import 'package:portalhigia/responsive.dart';

import 'package:portalhigia/screens/homepage/componentes/baixeAgora.dart';
import 'package:portalhigia/screens/homepage/componentes/bannerContrate.dart';
import 'package:portalhigia/screens/homepage/componentes/gridFuncionalidades.dart';
import 'package:portalhigia/screens/homepage/componentes/videoPlayer.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../header.dart';
import '../../constants.dart';
import '../../rodape.dart';
import 'componentes/bannerInicial.dart';

import 'componentes/bannerBoxTexto.dart';
import 'componentes/grid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: Scrollbar(
          isAlwaysShown: true,
          child: SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      //minHeight: viewportConstraints.maxHeight,
                      ),
                  child: Column(
                    children: [
                      BannerInicial(),

                      VideoPlay(),
                      GridFuncionalidades(),

                      Grid(),
                      BannerBoxTexto(
                          backgroundColor: Colors.transparent,
                         
                          titulo: "+ Produtividade",
                          descricao:
                              "Proporcione uma experiência exclusiva no atendimento, e torne-se referência para seus pacientes e funcionários. "),

                     
                      
                      BaixeAgora(),
                      
                      BannerContrate(),
                      Rodape()
                    ],
                  ))),
        ));
  }

  Widget espaco() {
    return SizedBox(
      height: 30,
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
