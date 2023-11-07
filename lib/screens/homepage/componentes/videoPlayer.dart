import 'package:flutter/material.dart';
import 'package:portalhigia/constants.dart';
import 'package:portalhigia/responsive.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';


class VideoPlay extends StatefulWidget {
  // const VideoPlay({ Key? key }) : super(key: key);

  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: 'Hz2cR3dG2B0',
      params: YoutubePlayerParams(
        //playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
        startAt: Duration(seconds: 30),
        showControls: true,
        showFullscreenButton: true,
      ),
    );
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    String titulo = "Higia.com";
    String descricao =
        "\nNossa plataforma foi desenvolvida para que você possa proporcionar praticidade e simplicidade a todos os pacientes e colaboradores da sua clínica.";
    Size _size = MediaQuery.of(context).size;

    var _itens = <Widget>[
              
               Expanded(
                 flex: Responsive.isMobile(context)?6:1,
                    child:  Padding(
                      padding: Responsive.isMobile(context)?EdgeInsets.only(bottom: 50):EdgeInsets.all(0),
                      child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: YoutubePlayerIFrame(
                              controller: _controller,
                              aspectRatio: 16/9,
                            )),
                    ),
                    
                  ),
              
              
               Expanded(
                 flex:Responsive.isMobile(context)?5:1,
                 child:Padding(
                      padding: EdgeInsets.only(left:0.05*_size.width, top:30, bottom: 30),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: Responsive.isMobile(context)?CrossAxisAlignment.center: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titulo,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                  color: kPrimaryColor,
                                  fontSize: Responsive.getFontSize(context, 30, 60)),
                            ),
                            Text(
                              descricao,
                              textAlign: Responsive.isMobile(context)?TextAlign.center:TextAlign.justify,
                              style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  height: 1.3,
                                  color: kGrey,
                                  fontSize: Responsive.getFontSize(context, 15, 25)),
                            )
                          ])))
            ];
    return Container(
        height: Responsive.getValue(context, 500, 450, 550),
        padding: EdgeInsets.only(right: 0.1*_size.width, left: 0.1*_size.width),
        child: Responsive.isMobile(context)?
         Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [_itens[1], _itens[0]]): 
         Row(
            children: _itens));
  }
}
