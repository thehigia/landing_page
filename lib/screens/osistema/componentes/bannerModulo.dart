import 'dart:html';

import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';

class BannerModulo extends StatefulWidget {
  String titulo;
  bool imgEsquerda;
  final List<Map> lista;

  BannerModulo({this.titulo, this.lista, this.imgEsquerda = true});

  @override
  _BannerModuloState createState() => _BannerModuloState();
}

class _BannerModuloState extends State<BannerModulo> {
  int hoverAtual = 0;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
        color: kWhite,
        padding: EdgeInsets.only(
            top: 40, bottom: 20, left: Responsive.getValue(context, 0.05, 0.1, 0.15) * _size.width, right: Responsive.getValue(context, 0.05, 0.1, 0.15) * _size.width),
        child: Column(children: [
          Text(
            widget.titulo,
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 0.8,
                color: kPrimaryColor,
                fontSize: Responsive.getFontSize(context, 30, 60)),
          ),
          Row(children: [
            (widget.imgEsquerda && !Responsive.isMobile(context))? Flexible(child: imagem()) : Container(),
            Flexible(child: lista()),
            (!widget.imgEsquerda && !Responsive.isMobile(context))? Flexible(child: imagem()) : Container(),
          ])
        ]));
  }

  Widget item(IconData icone, String titulo, String descricao) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: kSecondaryColor),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    icone,
                    color: kWhite,
                    size: Responsive.getValue(context, 25, 30, 35),
                  ),
                )),
            SizedBox(
              width: 20,
            ),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: Responsive.getFontSize(context, 15, 25),
                      height: 1),
                ),
                Text(
                  descricao,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: Responsive.getFontSize(context, 10, 15),
                      color: Colors.grey[400],
                      height: 1.3),
                ),
              ],
            )),
            SizedBox(
              width: 20,
            ),
          ],
        ));
  }

  Widget imagem() {
    return Container(
        height: 400,
        // decoration: BoxDecoration(
        //     shape: BoxShape.circle, color: kSecondaryColor),
        margin: EdgeInsets.all(10),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
               widget.lista[hoverAtual]["img"],
                 
              fit: BoxFit.fill,
            )));
  }

  Widget lista() {
    return Container(

        // padding: EdgeInsets.only(left: 0),

        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.lista.length,
            itemBuilder: (BuildContext context, int index) => MouseRegion(
                // onExit: (onExit) => setState(() => hoverAtual = -1),
                onEnter: (onEnter) => setState(() => hoverAtual = index),
                child: AnimatedContainer(
                    padding: hoverAtual != index
                        ? EdgeInsets.only(
                            left: Responsive.getValue(context, 5, 10, 20),
                            right: Responsive.getValue(context, 5, 10, 20))
                        : EdgeInsets.all(0),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color:
                                hoverAtual == index ? Colors.grey[50] : kWhite,
                            elevation: hoverAtual == index ? 5 : 0,
                            child: item(
                                widget.lista[index]["icon"],
                                widget.lista[index]["titulo"],
                                widget.lista[index]["descricao"])))))));
  }
}
