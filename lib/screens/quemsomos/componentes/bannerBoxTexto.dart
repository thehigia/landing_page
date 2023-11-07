import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';

class BannerBoxTexto extends StatelessWidget {
  //const BoxTexto({ Key? key }) : super(key: key);

  String titulo;
  String descricao;
  Color backgroundColor;
  Color tituloColor;
  Color descricaoColor;
  String botao;
  String rota;
  

  BannerBoxTexto({this.titulo="", this.descricao="", this.backgroundColor=kWhite,this.tituloColor=kPrimaryColor,this.descricaoColor = kGrey, this.botao="", this.rota=""});

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
        color: backgroundColor,
        height: Responsive.getValue(context, 250, 320, 350),
        padding: EdgeInsets.only(top:Responsive.getValue(context, 60, 50, 60)),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Text(
            titulo,
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1,
                color: tituloColor,
                fontSize: Responsive.getFontSize(context, 30, 40)),
          ),
        
        Padding(
            padding: EdgeInsets.only(
                left: Responsive.isMobile(context)? 0.1 * _size.width: 0.05*_size.width, right: Responsive.isMobile(context)?0.1 * _size.width: 0.05*_size.width),
            child:  Text(
              descricao!=""?"\n$descricao":"",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kGrey,
                fontSize: Responsive.getFontSize(context, 15, 25)),
            ),),
             botao!=""? Padding(
               padding:  EdgeInsets.only(top:Responsive.getValue(context, 20, 20, 30)),
               child: InkWell(
                 onTap: (){
                   Navigator.of(context).pushNamed(rota);
                 },
                 child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color:  Colors.transparent,
                                borderRadius:
                                    BorderRadius.circular(10),
                                border: Border.all(width: 1, color: kPrimaryColor)),
                            child: Text("Contrate-nos", style: TextStyle(fontSize: Responsive.getFontSize(context, 15, 25), fontWeight: FontWeight.w200, color: kPrimaryColor),)),
               ),
             ):Container()
            
      ],
        ),
    
    );
  }
}
