import 'dart:math';

import 'package:flutter/material.dart';

class Linhatexto extends StatelessWidget {
  // const Linhatexto({ Key? key }) : super(key: key);
  String texto;

Linhatexto(this.texto);

  @override
  Widget build(BuildContext context) {
    return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Container(
                    height: 1,
                    width: 450,
                    color: Colors.grey[200],
                  ),
                  
                  Container(
                    width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200])
                  ),
                  Container(
                    width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200])
                  ),
                  Container(
                    width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200])
                  ),
                  Container(
                    height: 1,
                    width: 450,
                    color: Colors.grey[200],
                  )
                ],)
              );
  }
}