
import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatefulWidget {
  // const Header({ Key? key }) : super(key: key);
    
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String logo ="assets/icons/logo.png";
  final List<Map> itensMenu = [
    {
      "titulo": "Quem Somos",
      "rota": "/quemsomos"
    },
    {
      "titulo": "O Sistema",
      "rota": "/osistema"
    },
    {
      "titulo": "Planos",
      "rota": "/planos"
    },
  ];

  
  @override
  Widget build(BuildContext context) {
    return AppBar(
              leading: Container(),
              flexibleSpace: Container(
                padding: EdgeInsets.only(left: Responsive.getValue(context, 10, 50, 50), right: Responsive.getValue(context, 10, 50, 50)),
                
                child: Responsive.isMobile(context)?Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Flexible(
                      flex:1,
                      child:InkWell(child:
                    Icon(Icons.menu, color: kWhite,),
                    onTap: (){
                      Scaffold.of(context).openDrawer();
                    },),),
                    Flexible(
                      flex:8,
                      child: 
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed("/home");
                        },
                        child:Center(
                          child:Image.asset(
                      logo,
                      fit: BoxFit.fill,
                      scale: 5,
                    ),),),)
                    
                  ]): Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(child: Container(
                      width: 200,
                      child:Image.asset(logo, fit: BoxFit.fitWidth,)),
                      onTap: (){
                        Navigator.of(context).pushNamed("/home");
                      },
                    ),
                    Expanded(
                        flex: Responsive.getValue(context, 1, 6, 5).toInt(),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ListView.builder(

                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,    
                          itemCount: itensMenu.length,
                          itemBuilder: (BuildContext context, int index) =>
                              textoButtonHeader(itensMenu[index]["titulo"], itensMenu[index]["rota"]),
                                                        
                    ))),
                    entrarHigia()
                  ],
                )),
              elevation: 5,
              backgroundColor: kPrimaryColor,

              
            ); 
    
  }

  Widget textoButtonHeader(String txt, String rota) {
    return Container(
      
        alignment: Alignment.center,
      padding: EdgeInsets.only(right: 20, left: 20),
      child: InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(rota);
      },
      child:Text(
            txt,
            style: TextStyle(color: kWhite, fontWeight: FontWeight.normal, fontSize: 15),
      ),
    ));
  }

Widget entrarHigia(){
  return  Padding(padding:EdgeInsets.only(left:20), child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      InkWell(
                        onTap: (){
                          abrirLink("http://thehigia.com");
                        },
                        child:Icon(Icons.input, color: kWhite,),),
                      InkWell(
                        onTap: (){
                          abrirLink("http://thehigia.com");
                        },
                        child:Text("   Entrar no Higia", style: TextStyle(fontWeight: FontWeight.w200, color: kWhite)))]));
}

  abrirLink(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


}
