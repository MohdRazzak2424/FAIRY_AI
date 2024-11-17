import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cd/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Messages extends StatefulWidget {
  final bool isUser;
  final String message;
  final String date;

  const Messages(
      {super.key,
      required this.isUser,
      required this.message,
      required this.date});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final player = AudioPlayer(); //audio player obj that will play audio
  bool _isLoadingVoice = false; //for the progress indicator
  bool _isLoadingVoice1 = false; //for the progress indicator
  bool _isLoadingVoice2 = false; //for the progress indicator

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> playTextToSpeech1(String text) async {
    //display the loading icon while we wait for request
    setState(() {
      _isLoadingVoice = true;
    });

    String Neal =
        'nPczCjzI2devNBz1zQrb'; //voicechange if you know another Voice ID

    String url1 = 'https://api.elevenlabs.io/v1/text-to-speech/$Neal';
    final response1 = await http.post(
      Uri.parse(url1),
      headers: {
        'accept': 'audio/mpeg',
        'xi-api-key': EL_API_KEY,
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "text": text,
        // "model_id": "eleven_monolingual_v1",
        "model_id": "eleven_multilingual_v2",

        "voice_settings": {"stability": .15, "similarity_boost": .75}
      }),
    );

    setState(() {
      _isLoadingVoice = false; //progress indicator turn off now
    });

    if (response1.statusCode == 200) {
      final bytes = response1.bodyBytes; //get the bytes ElevenLabs sent back
      await player.setAudioSource(MyCustomSource(
          bytes)); //send the bytes to be read from the JustAudio library
      player.play(); //play the audio
    } else {
      // throw Exception('Failed to load audio');
      return;
    }
  }

  //For the Text To Speech
  Future<void> playTextToSpeech(String text) async {
    //display the loading icon while we wait for request
    setState(() {
      _isLoadingVoice1 = true; //progress indicator turn on now
    });

    // String voiceRachel = 'cgSgspJ2msm6clMCkdW9';
    String sarah = 'EXAVITQu4vr4xnSDxMaL';
    // String voiceRachel = '21m00Tcm4TlvDq8ikWAM';

    // String Neal =
    //     'Xb7hH8MSUJpSbSDYk0k2'; //Rachel voice - change if you know another Voice ID

    String url = 'https://api.elevenlabs.io/v1/text-to-speech/$sarah';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'accept': 'audio/mpeg',
        'xi-api-key': EL_API_KEY,
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "text": text,
        // "model_id": "eleven_monolingual_v1",
        "model_id": "eleven_multilingual_v2",

        "voice_settings": {"stability": .15, "similarity_boost": .75}
      }),
    );

    setState(() {
      _isLoadingVoice1 = false; //progress indicator turn off now
    });

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes; //get the bytes ElevenLabs sent back
      await player.setAudioSource(MyCustomSource(
          bytes)); //send the bytes to be read from the JustAudio library
      player.play(); //play the audio
    } else {
      // throw Exception('Failed to load audio');
      return;
    }
  }

  Future<void> playTextToSpeech2(String text) async {
    //display the loading icon when we will wait for request
    setState(() {
      _isLoadingVoice2 = true; //progress indicator turn on now
    });

    // String voiceRachel = 'cgSgspJ2msm6clMCkdW9';
    // String charlie = 'IKne3meq5aSn9XLyUdCD';
    String charlie = 'pqHfZKP75CvOlQylNhV4';
    // String voiceRachel = '21m00Tcm4TlvDq8ikWAM';

    // String Neal =
    //     'Xb7hH8MSUJpSbSDYk0k2'; //Rachel voice - change if you know another Voice ID

    String url2 = 'https://api.elevenlabs.io/v1/text-to-speech/$charlie';

    final response2 = await http.post(
      Uri.parse(url2),
      headers: {
        'accept': 'audio/mpeg',
        'xi-api-key': EL_API_KEY,
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "text": text,
        // "model_id": "eleven_monolingual_v1",
        "model_id": "eleven_multilingual_v2",

        "voice_settings": {"stability": .15, "similarity_boost": .75}
      }),
    );

    setState(() {
      _isLoadingVoice2 = false; // for progress indicator turn off now
    });

    if (response2.statusCode == 200) {
      final bytes = response2.bodyBytes; //get the bytes ElevenLabs sent back
      await player.setAudioSource(MyCustomSource(
          bytes)); //send the bytes to be read from the JustAudio library
      player.play(); //play the audio
    } else {
      // throw Exception('Failed to load audio');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 15).copyWith(
          left: widget.isUser ? 10 : 10, right: widget.isUser ? 10 : 10),
      decoration: BoxDecoration(
          color: widget.isUser
              ? const Color.fromARGB(255, 242, 210, 189)
              : const Color.fromARGB(255, 248, 200, 220),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: widget.isUser ? Radius.circular(10) : Radius.zero,
              topRight: Radius.circular(10),
              bottomRight: widget.isUser ? Radius.zero : Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   widget.message,
          //   style: TextStyle(
          //       fontSize: 16,
          //       color: widget.isUser ? Colors.black : Colors.black),
          // ),
          Text(
            widget.message,
            style: GoogleFonts.bonaNova(
                color: widget.isUser ? Colors.black : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),

          Text(
            widget.date,
            style: GoogleFonts.bonaNova(
                color: widget.isUser ? Colors.white : Colors.black),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    playTextToSpeech(widget.message);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Color.fromARGB(192, 255, 88, 51)),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.deepPurple),
                    padding:
                        WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                    elevation: WidgetStateProperty.all<double>(3),
                    shadowColor: WidgetStateProperty.all<Color>(Colors.red),
                  ),
                  child: _isLoadingVoice1

                      // ? const LinearProgressIndicator()
                      // ? const LinearProgressIndicator()

                      ? LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.black,
                          size: 30,
                        )
                      // : const Icon(
                      //     Icons.volume_up,
                      //     color: Colors.black,
                      //   ),
                      : RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "SARAH ",
                                  style: GoogleFonts.dosis(fontSize: 16)),
                              WidgetSpan(
                                child: Icon(
                                  Icons.volume_up_rounded,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )),
              // Spacer(),
              ElevatedButton(
                  onPressed: () {
                    playTextToSpeech1(widget.message);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Color.fromARGB(192, 255, 88, 51)),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.deepPurple),
                    padding:
                        WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                    elevation: WidgetStateProperty.all<double>(3),
                    shadowColor: WidgetStateProperty.all<Color>(Colors.red),
                  ),
                  child: _isLoadingVoice

                      // ? const LinearProgressIndicator()
                      // ? const LinearProgressIndicator()

                      ? LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.black,
                          size: 30,
                        )
                      // : const Icon(
                      //     Icons.volume_up,
                      //     color: Colors.black,
                      //   ),
                      : RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "BRIAN ",
                                  style: GoogleFonts.dosis(fontSize: 16)),
                              WidgetSpan(
                                child: Icon(
                                  Icons.volume_up_rounded,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )),
              ElevatedButton(
                  onPressed: () {
                    playTextToSpeech2(widget.message);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Color.fromARGB(192, 255, 88, 51)),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.deepPurple),
                    padding:
                        WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                    elevation: WidgetStateProperty.all<double>(3),
                    shadowColor: WidgetStateProperty.all<Color>(Colors.red),
                  ),
                  child: _isLoadingVoice2

                      // ? const LinearProgressIndicator()
                      // ? const LinearProgressIndicator()

                      ? LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.black,
                          size: 30,
                        )
                      // : const Icon(
                      //     Icons.volume_up,
                      //     color: Colors.black,
                      //   ),
                      : RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: " BILL ",
                                  style: GoogleFonts.dosis(fontSize: 16)),
                              WidgetSpan(
                                child: Icon(
                                  Icons.volume_up_rounded,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )),
            ],
          ),
        ],
      ),
    );
  }
}

// Feed your own stream of bytes into the player
class MyCustomSource extends StreamAudioSource {
  final List<int> bytes;
  MyCustomSource(this.bytes);

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    start ??= 0;
    end ??= bytes.length;
    return StreamAudioResponse(
      sourceLength: bytes.length,
      contentLength: end - start,
      offset: start,
      stream: Stream.value(bytes.sublist(start, end)),
      contentType: 'audio/mpeg',
    );
  }
}
