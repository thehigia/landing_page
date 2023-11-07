import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/drawer.dart';
import 'package:portalhigia/floatActionButton.dart';
import 'package:portalhigia/header.dart';
import 'package:portalhigia/responsive.dart';
import 'package:portalhigia/rodape.dart';
import 'package:portalhigia/screens/osistema/componentes/bannerModulo.dart';


class OSistema extends StatelessWidget {
  final _controller = ScrollController();
  final List<Map> listaClinica= [
    {
      "icon": Icons.assignment_outlined,
      "titulo": "Agenda Intuitiva",
      "img": "assets/images/mod_clinica_agenda.png",
      "descricao": "Informações sobre número de consultas marcadas e horários disponíveis"
    },
    {
      "icon": Icons.group,
      "titulo": "Cadastro de Funcionários",
      "img": "assets/images/mod_clinica_cadFuncionarios.png",
      "descricao": "Controle e cadastro de funcionários e médicos da clínica"
    },
    {
      "icon": Icons.assessment_outlined,
      "titulo": "Controle Financeiro", 
      "img": "assets/images/mod_clinica_financeiro.png",
      "descricao": "Gráficos intuitivos com o informações relevantes ao financeiro"
    },
    {
      "icon": Icons.person_add_alt ,
      "titulo": "Cadastro de pacientes da clinica",
      "img": "assets/images/mod_clinica_cadPaciente.png",
      "descricao": "Para um maior controle o módulo possui também um cadastro de pacientes na clinica"
    },
    
    ];
          
    final List<Map> listaAtendente= [
    {
      "icon": Icons.event,
      "titulo": "Bloco de Anotações",
      "img": "assets/images/mod_atendente_bloco.png",
      "descricao": "Na caixa de anotações a atendente pode registrar lembretes"
    },
    {
      "icon": Icons.contact_phone_outlined ,
      "titulo": "Consultas Agendadas",
      "img": "assets/images/mod_atendente_consultas.png",
      "descricao": "A atendente é responsável por cadastrar ou remarcar consultas"
    },
    {
      "icon": Icons.contact_page_outlined,
      "titulo": "Perfil da atendente personalizado", 
      "img": "assets/images/mod_atendente_perfil.png",
      "descricao": "Como os demais perfis, o de atendente também possui o modo edição"
    },
    {
      "icon": Icons.free_breakfast_outlined,
      "titulo": "Sala de espera",
      "img": "assets/images/mod_atendente_salaespera.png",
      "descricao": "Esse recurso permite controlar e organizar a sala de espera atrávez do uso dessa fereramenta"
    },
    
    ];

    final List<Map> listaPaciente= [
    {
      "icon": Icons.event,
      "titulo": "Detalhes de consultas",
      "img": "assets/images/mod_paciente.png",
      "descricao": "Detalhes de consultas realizadas e a realizar"
    },
    {
      "icon": Icons.group_add_outlined,
      "titulo": "Histórico de consultas",
      "img": "assets/images/mod_paciente_historico.png",
      "descricao": "Possibilita a busca de consultas anteriores"
    },
    {
      "icon": Icons.history_toggle_off,
      "titulo": "Acompanhamento médico", 
      "img": "assets/images/mod_paciente.png",
      "descricao": "Tela de acompanhamento para mensagens do médico"
    },
    {
      "icon": Icons.free_breakfast_outlined,
      "titulo": "Tela de assistência",
      "img": "assets/images/mod_paciente_assistencia.png",
      "descricao": "Assitente para dúvidas sobre consultas e/ou acesso"
    },
    
    ];

    final List<Map> listaMedico= [
    {
      "icon": Icons.event,
      "titulo": "Histórico de consultas",
      "img": "assets/images/mod_medico_historico.png",
      "descricao": "Buscar consultas por data, verificar consultas realizadas e finalizadas."
    },
    {
      "icon": Icons.group_add_outlined,
      "titulo": "Prontuário eletrônico",
      "img": "assets/images/mod_medico_prontuario.png",
      "descricao": "Prontuário do pacientes inserido pelo médico, separado por abas (consulta, Receita, atestado, exames)"
    },
    {
      "icon": Icons.history_toggle_off,
      "titulo": "Assistencia", 
      "img": "assets/images/mod_medico_assistencia.png",
      "descricao": "Essa aba permite que o médico faça um acompanhmento de contato entre o paciente"
    },
    
    ];

  @override
  Widget build(BuildContext context) {
    Size _size= MediaQuery.of(context).size;
    
    return Scaffold(
        backgroundColor: kBgLightColor,
        floatingActionButton: FloatActionButton(),
        drawer: DrawerItens(),
        appBar: PreferredSize(
            preferredSize: Responsive.isMobile(context)
                ? Size.fromHeight(50.0)
                : (Responsive.isTablet(context)
                    ? Size.fromHeight(75.0)
                    : Size.fromHeight(100)), // here the desired height
            child: Header()),
        body: ListView(
          controller: _controller,
          children: [
          Stack(
            alignment: Alignment.centerLeft,
            children:[
          Container(
            color: Colors.grey[200],
            height: Responsive.isDesktop(context)? 550:Responsive.isTablet(context)?400:350,
            alignment: Alignment.centerRight,
            child:Responsive.isMobile(context)?Opacity(opacity: 0.3, child: Image.asset("assets/images/estetoscopio.jpg", fit: BoxFit.fill, alignment: Alignment.centerRight,)):Image.asset("assets/images/estetoscopio.jpg", fit: BoxFit.fill, alignment: Alignment.centerRight,),),
        Container(
          margin: EdgeInsets.only( left: _size.width*0.1, right: _size.width*0.1),
          
          width: 
            Responsive.isMobile(context)? _size.width:
          _size.width*0.4,  
          child:Column(
            
                    children: [
                      
                      Text(
            "Higia.com",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                height: 1,
                color: kPrimaryColor,
                fontSize: Responsive.getFontSize(context, 30, 60)),
          
          
        ),
        Text(
              "\nÉ um software que oferece uma solução completa para o gerenciamento das atividades diárias de sua clínica, através de um sistema de gestão personalizado por módulos, de acordo com cada perfil de usuário. Confira abaixo todos os nossos recursos.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  height: 1.5,
                  color: kGrey,
                  fontSize: Responsive.getFontSize(context, 15, 20)),
            ),

            
                    ],
                  ),
        ),
        
        ]),
                Container(
                  color: kWhite,
                  padding: EdgeInsets.only( left: 0.05*_size.width, right: 0.05*_size.width),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: 70,
                      child: Row(
                        children: [
                          texto("Clínica", Responsive.getValue(context, 400, 650, 650)),
                          Container(
                            height: 40,
                            width: 1,
                            color: kGrey,
                          ),
                          texto("Atendente", Responsive.getValue(context, 800, 1300, 1300)),
                          Container(
                            height: 40,
                            width: 1,
                            color: kGrey,
                          ),
                          texto("Médico", Responsive.getValue(context, 1200, 1950, 1950)),
                          Container(
                            height: 40,
                            width: 1,
                            color: kGrey,
                          ),
                          texto("Paciente", Responsive.getValue(context, 1600, 2600, 2600)),
                        ],
                      ),
                    ),
                  ),
                ),

          
          BannerModulo( titulo:"\nMódulo Clínica\n", lista: listaClinica),
          BannerModulo( titulo:"\nMódulo Atendente\n", lista: listaAtendente, imgEsquerda: false,),
          BannerModulo( titulo:"\nMódulo Médico\n", lista: listaMedico),
          BannerModulo( titulo:"\nMódulo Paciente\n", lista: listaPaciente, imgEsquerda: false,),
          
          
          SizedBox(
            height: 250,
          ),
          Rodape()
        ]));
  }



  

  texto(String txt, double Offset){
    return Expanded(
      child: InkWell(
        onTap: (){
          _controller.animateTo(Offset, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
        },
        child: Container(
          height: 70,
          child: Center(
            child: Text(
                                    txt,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: kGrey,
                                      fontWeight: FontWeight.bold

                                    ),
                                  ),
          ),
        ),
      ),
    );
  }
}
