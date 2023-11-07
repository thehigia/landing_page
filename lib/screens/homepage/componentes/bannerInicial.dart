import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';
import 'package:portalhigia/screens/homepage/componentes/playerAudio.dart';


class BannerInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String titulo = "Sistema de\nGestão clinica\nSimplificada\n";
    String subTitulo =
        "Construa uma gestão clínica otimizada de forma descomplicada com a plataforma Higia ";
    String botao = "Conheça Mais";
    String rota = "/osistema";
    String imagem = "assets/images/clinica.jpg";

    return Stack(children: <Widget>[
      Container(
        height: Responsive.getValue(context, 350, 420, 520),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imagem), fit: BoxFit.cover),
        ),
      ),
      Container(
        height: Responsive.getValue(context, 350, 420, 520),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 1],
              colors: [
                Colors.white.withOpacity(0),
                Colors.white.withOpacity(0.8)
              ],
              tileMode: TileMode.clamp),
        ),
      ),
      Container(
          height: Responsive.getValue(context, 350, 420, 520),
          padding: EdgeInsets.all(50),
          color: kSecondaryColor
              .withAlpha(Responsive.getValue(context, 220, 255, 255).toInt()),
          width: Responsive.getValue(
              context, size.width, size.width * 0.5, size.width * 0.45),
          margin:
              EdgeInsets.only(left: Responsive.getValue(context, 0, 50, 100)),
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    height: 1,
                    color: Colors.white,
                    fontSize: Responsive.getFontSize(context, 30, 50)),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: subTitulo,
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          height: 1.3,
                          color: Colors.white,
                          fontSize: Responsive.getFontSize(context, 15, 20)),
                    ),
                    WidgetSpan(
                      child: InkWell(
                          onTap: () {
                            showAudioPlayer(context);
                          },
                          child: Icon(Icons.play_circle_fill_outlined,
                              color: kWhite,
                              size: Responsive.getFontSize(context, 15, 20))),
                    ),
                    TextSpan(text: "\n")
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(rota);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: kWhite,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: TextStyle(
                          fontSize: Responsive.getFontSize(context, 15, 25),
                          fontWeight: FontWeight.bold)),
                  child: Text(
                    botao.toUpperCase(),
                    style: TextStyle(color: kPrimaryColor),
                  ))
            ],
          ))
    ]);
  }

  showAudioPlayer(context) async {
    

    AlertDialog alert = AlertDialog(
      content: PlayerAudio()
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
