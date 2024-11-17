import 'package:flutter/material.dart';
import 'package:flutter_cd/Messages.dart';
import 'package:flutter_cd/about.dart';
import 'package:flutter_cd/msg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pretty_animated_buttons/enums/slide_positions.dart';
import 'package:pretty_animated_buttons/widgets/pretty_color_slide_button.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _userInput = TextEditingController();
  final player = AudioPlayer(); //audio player obj that will play audio
  bool _isLoadingVoice = false; //for the progress indicator

  static const apiKey = "AIzaSyBfb7QaTGLx1zOYIWhTj2H59DdLE2y7KDU";

  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  final List<Message> _messages = [];

  @override
  void dispose() {
    // _textFieldController.dispose();
    player.dispose();

    super.dispose();
  }

  Future<void> sendMessage() async {
    final message = _userInput.text;
    _userInput.clear();

    setState(() {
      _messages.add(
        Message(
          isUser: true,
          message: message,
          date: DateTime.now(),
        ),
      );
    });

    final content = [Content.text(message)];
    final response = await model.generateContent(content);

    setState(() {
      _messages.add(Message(
          isUser: false, message: response.text ?? "", date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(right: 1, left: 2),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.red.withOpacity(0.8), BlendMode.dstATop),
            image: const NetworkImage(
                'https://img.freepik.com/free-vector/fairytale-castle-pile-books_23-2148481791.jpg?t=st=1729973016~exp=1729976616~hmac=45c1d9a3e61e0ce4cac56092d5e33f8ace868e65dd20448bba0ca30bb8160e87&w=740'),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 30,
                    icon: const Icon(
                      Icons.refresh,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 400),
                              child: ChatScreen()));
                    },
                  ),
                  Text(
                    'FAIRY.AI',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Color.fromARGB(255, 50, 78, 84),
                          letterSpacing: .2,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                    // style: goo(
                    //   textStyle: TextStyle(color: Colors.blue, letterSpacing: .5),
                    // ),
                  ),
                  IconButton(
                    iconSize: 30,
                    icon: const Icon(
                      Icons.home,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: about()));
                    },
                  ),
                ],
              ),
              Text(
                'Convert your Imagination into AI  ',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Color.fromARGB(255, 50, 78, 84),
                      letterSpacing: .5,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 15,
                      child: TextFormField(
                        // style: TextStyle(color: Colors.black),

                        controller: _userInput,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            fillColor: Color.fromARGB(255, 253, 242, 242),
                            filled: true,
                            focusColor: Colors.grey,
                            label: Text(
                              'Create your Idea..',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 125, 125, 125)),
                            )),
                      ),
                    ),
                    // Spacer(),
                    SizedBox(
                      width: 15,
                    ),

                    PrettyColorSlideButton(
                      label: 'Generate',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      onPressed: () {
                        sendMessage();
                      },
                      bgColor: Color.fromARGB(255, 159, 226, 191),
                      foregroundColor: Color.fromARGB(255, 64, 130, 109),
                      // foregroundColor: Color.fromARGB(255, 236, 255, 220),
                      position: SlidePosition.left,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        return Messages(
                            isUser: message.isUser,
                            message: message.message,
                            date: DateFormat('HH:mm').format(message.date));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
