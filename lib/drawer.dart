import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'formulario.dart';
import 'responsive.dart';

class DrawerItens extends StatelessWidget {
  //const itemDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 0.6 * MediaQuery.of(context).size.width,
        child: Drawer(
            child: Container(
          padding: EdgeInsets.only(top: 10),
          color: kPrimaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // UserAccountsDrawerHeader(
              //   accountEmail: Text("user@mail.com"),
              //   accountName: Text("Seu zé"),
              //   currentAccountPicture: CircleAvatar(
              //     child: Text("SZ"),
              //   ),

              // ),
              Image.asset(
                "assets/icons/logo_vertical.png",
                scale: 5,
              ),
              InkWell(
                  onTap: () {
                    abrirLink("http://thehigia.com");
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.input,
                          color: kWhite,
                        ),
                        Text("   Entrar",
                            style: TextStyle(
                                fontWeight: FontWeight.w200, color: kWhite))
                      ])),

              SizedBox(
                height: 50,
              ),
              ListTile(
                leading: Icon(Icons.contacts_outlined, color: kWhite),
                title: text("Quem Somos"),
                onTap: () {
                  Navigator.pushNamed(context, "/quemsomos");
                },
              ),
              ListTile(
                leading: Icon(Icons.dvr_outlined, color: kWhite),
                title: text("O Sistema"),
                onTap: () {
                  Navigator.pushNamed(context, "/osistema");
                },
              ),
              ListTile(
                leading: Icon(Icons.fact_check_outlined, color: kWhite),
                title: text("Planos"),
                onTap: () {
                  Navigator.pushNamed(context, "/planos");
                },
              ),
              ListTile(
                leading: Icon(Icons.send_outlined, color: kWhite),
                title: text("Contate-nos"),
                onTap: () {
                  AlertDialog alert = AlertDialog(
                    content: Container(
                        height: Responsive.getValue(context, 500, 600, 600),
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: FormularioPage()),
                  );

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
              ),
            ],
          ),
        )));
  }

  Widget text(String txt) {
    return Text(
      txt,
      textAlign: TextAlign.start,
      style: TextStyle(fontWeight: FontWeight.normal, color: kWhite),
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
