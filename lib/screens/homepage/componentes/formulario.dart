import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';

import 'bannerBoxTexto.dart';


class Formulario extends StatefulWidget {
  // const Formulario({ Key? key }) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();
  final TextEditingController _controladorMensagem = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      child:  Column(
            children: <Widget>[
              BannerBoxTexto(
                        backgroundColor: kWhite,
                          titulo: "\nFormulário de Contato",
                          descricao:
                              "\nEntre em contato pelo formulario abaixo que retornaremos suas dúvidas."),

              Row(
                children: [
                  Expanded(flex:1,
                  child:Padding(
                    padding: EdgeInsets.only(left:50),
                    child:Column(
                    children: [
                      TextField(
                controller: _controladorNome,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorEmail,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorTelefone,
                  decoration: InputDecoration(labelText: 'Telefone'),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorMensagem,
                  decoration: InputDecoration(labelText: 'Mensagem'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: kGrey)),
                            color: Colors.transparent,
                            textColor: kGrey,
                            padding: EdgeInsets.all(13.0),
                            onPressed: () {},
                            child: Text(
                              "Enviar",
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                            ),
                          ),
              ),
                    ],
                  ))),
                  Expanded(
                    
                    flex:2,
                    child: Container(
                      color: kSecondaryColor,
                    ))

                ],
              ),
              SizedBox(height: 20,)
              
            ],
         
        ),
      
    );
  }
}