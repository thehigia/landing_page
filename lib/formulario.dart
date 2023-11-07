import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';
import 'package:http/http.dart' as http;

class FormularioPage extends StatefulWidget {
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _telefone = TextEditingController();
  final _mensagem = TextEditingController();
  final _nomeFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _telefoneFocus = FocusNode();
  final _mensagemFocus = FocusNode();

  _setCadastro(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
              child: Center(
                  child: SizedBox(
            child: CircularProgressIndicator(),
            width: 60,
            height: 60,
          ))),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: kWhite,
        padding: EdgeInsets.only(
          left: 0.02 * width,
          right: 0.02 * width,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.close,
                    color: kGrey,
                  )),
            ),
            Text(
              "Formulário de contato",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: Responsive.getFontSize(context, 30, 50)),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                autovalidateMode: _autoValidate,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite o nome';
                          }
                          return null;
                        },
                        style: TextStyle(
                            fontSize: Responsive.getFontSize(context, 15, 20)),
                        keyboardType: TextInputType.text,
                        controller: _nome,
                        focusNode: _nomeFocus,
                        decoration: InputDecoration(
                          labelText: "Nome",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: Responsive.getFontSize(context, 15, 20),
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite o email';
                          }
                          if (!validateEmail(value)) {
                            return 'Email inválido';
                          }

                          return null;
                        },
                        style: TextStyle(
                            fontSize: Responsive.getFontSize(context, 15, 20)),
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        focusNode: _emailFocus,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: Responsive.getFontSize(context, 15, 20),
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite seu telefone';
                          }

                          return null;
                        },
                        style: TextStyle(
                            fontSize: Responsive.getFontSize(context, 15, 20)),
                        keyboardType: TextInputType.phone,
                        controller: _telefone,
                        focusNode: _telefoneFocus,
                        decoration: InputDecoration(
                          labelText: "Telefone",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: Responsive.getFontSize(context, 15, 20),
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite uma mensagem';
                          }

                          return null;
                        },
                        style: TextStyle(
                            fontSize: Responsive.getFontSize(context, 15, 20)),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        controller: _mensagem,
                        focusNode: _mensagemFocus,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          // contentPadding: EdgeInsets.zero,
                          labelText: "Mensagem",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: Responsive.getFontSize(context, 15, 20),
                          ),
                        ),
                      ),
                    ])),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 40,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Enviar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: Responsive.getFontSize(context, 15, 20),
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            child: Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                            height: 28,
                            width: 28,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      setState(() {
                        _autoValidate = AutovalidateMode.always;
                      });

                      if (_formKey.currentState.validate()) {
                        sendEmail(
                            name: _nome.text,
                            telefone: _telefone.text,
                            email: _email.text,
                            subject: _nome.text,
                            message: _mensagem.text);
                      } else {
                        if (_nome.text == "") {
                          _nomeFocus.requestFocus();
                        } else if (_email.text == "") {
                          _emailFocus.requestFocus();
                        } else if (_telefone.text == "") {
                          _telefoneFocus.requestFocus();
                        } else if (_mensagem.text == "") {
                          _mensagemFocus.requestFocus();
                        }
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  Future sendEmail({
    String name,
    String telefone,
    String email,
    String subject,
    String message,
  }) async {
    //final serviceId = 'service_azwy544';
    final serviceId = 'service_a2a3vcc';
    final templateId = 'template_qsodcll';
    final userId = 'user_vmYFqPd3pdU7PCEu65Qic';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'to_email': 'thehigia@gmail.com',
            'user_name': name,
            'user_telefone': telefone,
            'user_email': email,
            'user_subject': subject,
            'user_message': message
          }
        }));

    print(response.body);

    if (response.body == "OK") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Email enviado!"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }else{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Falha no envio!"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }
}
