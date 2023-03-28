import 'package:flutter/material.dart';
import 'library.dart' as lib;
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  List<bool> _isOpenList = [false, false];

  List<Map<String, String>> _faqList = [
    {
      'question': 'How long should I brush my teeth?',
      'answer': 'Two minutes. Here is a song that will help you time it:',
      'attatchment': 'audio/brushYourTheet.mp3'
    },
    {
      'question': 'What is dental hygiene?',
      'answer': 'Video',
      'attatchment': 'video/dentalHygiene.mp4'
    },
  ];

  VideoPlayerController videoController =
      VideoPlayerController.asset("video/dentalHygiene.mp4");
  final AudioPlayer audioPlayer = AudioPlayer();
  bool audioActive = false;

  void initState() {
    videoController.setLooping(true);
    videoController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: lib.colorBl,
        title: Text(
          'FAQ',
          style: lib.yellowText,
        ),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _isOpenList[index] = !isExpanded;
            });
          },
          children: _faqList.map((faq) {
            int index = _faqList.indexOf(faq);
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    faq['question']!,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
              body: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                child: Column(
                  children: [
                    Text(
                      faq['answer']!,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    faq['attatchment']!.isEmpty
                        ? SizedBox()
                        : faq['attatchment']!.substring(
                                    faq['attatchment']!.length - 3) ==
                                "mp4"
                            ? Column(children: [
                                AspectRatio(
                                    aspectRatio: 640 /
                                        360, // breedte gedeeld door hoogte
                                    child: VideoPlayer(videoController)),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      videoController.value.isPlaying
                                          ? videoController.pause()
                                          : videoController.play();
                                    });
                                  },
                                  child: videoController.value.isPlaying
                                      ? Icon(Icons.pause, size: 60)
                                      : Icon(Icons.play_arrow, size: 60),
                                  style: lib.styledButton,
                                ),
                              ]) /*videoPlayer*/
                            : ElevatedButton(
                                onPressed: () {
                                  if (!audioActive) {
                                    audioPlayer.play(
                                        AssetSource('audio/brushYourTheet.mp3'),
                                        volume: 1);
                                  } else {
                                    audioPlayer.stop();
                                  }
                                  audioActive = !audioActive;
                                  setState(() {});
                                },
                                child: audioActive
                                    ? Icon(
                                        Icons.pause,
                                        size: 60,
                                      )
                                    : Icon(Icons.play_arrow, size: 60),
                                style: lib.styledButton,
                              ) /*audioPlayer*/,
                  ],
                ),
              ),
              isExpanded: _isOpenList[index],
            );
          }).toList(),
        ),
      ),
    );
  }
}
