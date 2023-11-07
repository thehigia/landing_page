import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/formulario.dart';
import 'package:portalhigia/responsive.dart';

class CardPlanos extends StatefulWidget {
  // const Card({ Key? key }) : super(key: key);
  final List<Map> lista;

  CardPlanos(this.lista);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<CardPlanos> {
  bool hoverAtual = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onExit: (onExit) => setState(() => hoverAtual = false),
        onEnter: (onEnter) => setState(() => hoverAtual = true),
        child: AnimatedContainer(
            
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            child: Card(
                elevation: hoverAtual ? 15 : 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 30, left: 20, right: 20),
                    //height: 450,
                    width: Responsive.getValue(context, 300, 230, 300),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(widget.lista[0]["titulo"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Responsive.getFontSize(
                                        context, 20, 35)))),
                        Center(
                            child: Text(widget.lista[0]["descricao"],
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w200,
                                    fontSize: Responsive.getFontSize(
                                        context, 15, 25)))),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.lista[0]["item"].length,
                            itemBuilder: (BuildContext context, int index) {
                              return itemlista(widget.lista[0]["item"][index]);
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          widget.lista[0]["preco"],
                          style:
                              TextStyle(fontSize: 30, color: kSecondaryColor),
                        ),
                        Text(
                          widget.lista[0]["rodape"],
                          style: TextStyle(
                              fontSize: 12,
                              color: kGrey,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            showFormulario(context);
                          },
                          child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      width: 1, color: kPrimaryColor)),
                              child: Text(
                                widget.lista[0]["botao"],
                                style: TextStyle(
                                    color: kWhite,
                                    fontSize:
                                        Responsive.getFontSize(context, 15, 20),
                                    fontWeight: FontWeight.w200),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )))));
  }

  itemlista(txt) {
    return Padding(
        padding: EdgeInsets.only(left: Responsive.getValue(context, 30, 10, 30), right: Responsive.getValue(context, 30, 10, 30)),
        child: Row(
          children: [
            Icon(
              Icons.check,
              size: 18,
              color: kSecondaryColor,
            ),
            Text("  $txt")
          ],
        ));
  }

   showFormulario(context) {
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
  }
}
