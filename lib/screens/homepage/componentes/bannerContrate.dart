import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/formulario.dart';
import 'package:portalhigia/responsive.dart';

class BannerContrate extends StatefulWidget {
  // const BannerA({ Key? key }) : super(key: key);
  double scale;

  @override
  _BannerContrateState createState() => _BannerContrateState();
}

class _BannerContrateState extends State<BannerContrate> {
  String titulo = "Contrate\nnossos Serviços";
  String descricao = "Proporcione uma experiência exclusiva no atendimento, e torne-se referência para seus pacientes e funcionários";
  
  String imagem = "assets/images/contrate.jpg";
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      height: Responsive.getValue(context, 250, 450, 550),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              "\n$descricao",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  height: 1.3,
                  color: kGrey,
                  fontSize: Responsive.getFontSize(context, 15, 25)),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: Responsive.getValue(context, 20, 20, 30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    
                    Navigator.of(context).pushNamed("/planos");
                  },
                  child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1, color: kPrimaryColor)),
                      child: Text(
                        "Contrate-nos",
                        style: TextStyle(
                            color: kWhite,
                            fontSize: Responsive.getFontSize(context, 15, 25),
                            fontWeight: FontWeight.w200),
                      )),
                ),
                SizedBox(width: Responsive.getFontSize(context, 10, 20),),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/osistema");
                  },
                  child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1, color: kPrimaryColor)),
                      child: Text(
                        "Saiba mais",
                        style: TextStyle(
                            fontSize: Responsive.getFontSize(context, 15, 25),
                            fontWeight: FontWeight.w200,
                            color: kPrimaryColor),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


}
