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
      "img": "assets/images/1.png",
      "titulo": "Lorem Lorem",
      
    },
    {
      "img": "assets/images/2.png",
      "titulo": "Ipsum Ipsum",
      
    },
    {
      "img": "assets/images/trabalho.jpg",
      "titulo": "Praticidade no diagnóstico",
        
    },
     
  ];
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    
  return Container(
    height: 550*scaleResponsive(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
      Text(
            lista[_current]["titulo"],
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                height: 0.9,
                color: kSecondaryColor,
                fontSize: 60*scaleResponsive()),
          ),
          SizedBox(
          height: 30*scaleResponsive(),
        ),
      CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          height: 350*scaleResponsive(),
          aspectRatio: 17/8,
          viewportFraction: 0.5,
          //initialPage: 0,
          //enableInfiniteScroll: true,
          //reverse: false,
          autoPlay: true,
          //autoPlayInterval: Duration(seconds: 4),
          //autoPlayAnimationDuration: Duration(milliseconds: 1500),
          //autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
          //scrollDirection: Axis.horizontal,
        ),
        items: lista.map((i) {
          return Builder(
            builder: (BuildContext context) {
              
              return Container(
                  //width: 800, //MediaQuery.of(context).size.width,
                  //margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: kBgLightColor),
                  child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              lista[_current]["img"],
              fit: BoxFit.cover,
            ),
          ));
                  
                  
                  
            },
          );
        }).toList(),
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: lista.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? kBgLightColor
                            : kPrimaryColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      
    ]),
  );
  }

 double scaleResponsive(){
    if(Responsive.isMobile(context)){
      return 0.5;

    }
    else if(Responsive.isTablet(context)){
      return 0.75;

    }
    else{
      return 1;
    }
  }
}
