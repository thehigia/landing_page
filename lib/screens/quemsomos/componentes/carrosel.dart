import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';



class Carousel extends StatefulWidget {
  //const Carousel({ Key? key }) : super(key: key);
 
  @override
  _CarouselState createState() => _CarouselState();
}


class _CarouselState extends State<Carousel> {
  
  //var itens = [1, 2];
  int _current = 0;





  final List<Map> lista = [
    {
      "titulo": "Surgimento do Higia.com",
      "descricao": "\nO projeto nasceu devido o crescimento da demanda por serviços virtuais de saúde e aprendizagem sobre saúde e qualidade de vida após a crise sanitária do novo coronavirus",
      
    },
    {
      "titulo": "Nosso Propósito",
      "descricao": "\nGerar uma melhor experiência no relacionamento médico - paciente, resgatando o conceito de médico da família",
      
    },
     
  ];
  final CarouselController _controller = CarouselController();
  

  @override
  Widget build(BuildContext context) {
  Size _size = MediaQuery.of(context).size;  
  return 
      Stack(
        
          children:[
            Container(
        height:350,color: kSecondaryColor,),
             Padding(
               padding: EdgeInsets.only(
                 left: Responsive.getValue(context, 0.05*_size.width, 0.1*_size.width, 0.15*_size.width),
               right: Responsive.getValue(context, 0.05*_size.width, 0.1*_size.width, 0.15*_size.width)
               ),
               child: CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 350,
            aspectRatio: 16/9,
            viewportFraction: 1,
            
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
            ),
          items: lista.map((i) {
            return Builder(
                builder: (BuildContext context) {
                  
                  return Container(
                     width: _size.width,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                   Text(
                  lista[_current]["titulo"], style: TextStyle(color:kWhite,fontSize: Responsive.getFontSize(context, 20, 50)),
                ),
                Container(
                  width: _size.width/2,
                  child: Text(lista[_current]["descricao"], style: TextStyle(color: kWhite, fontSize: Responsive.getFontSize(context, 10, 20)),))
                ])
            ));
                      
                      
                      
                },
            );
          }).toList(),
      ),
             ),
      
      ]
        );
  }

}
