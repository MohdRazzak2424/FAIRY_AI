// import 'package:ai_app/assets/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 130, 136, 158),
        shadowColor: Colors.grey,
        elevation: 2.0,
        title: Text(
          'ABOUT DEVELOPERS',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 53, 51, 51),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.red.withOpacity(0.8), BlendMode.dstATop),
          // https://img.freepik.com/free-vector/minimal-doodle-frame-background-social-story-highlight-vector_53876-161537.jpg?t=st=1730047992~exp=1730051592~hmac=b400a5871e413b81e867276504437474332207a9c5a8f500045c8d81f0d6f8f3&w=360'
          image: const NetworkImage(
              'https://img.freepik.com/free-vector/vector-hanging-hearts-cloud-wavy-blue-background_53876-162015.jpg?t=st=1730048855~exp=1730052455~hmac=bd07ec94c108f86fd6589f18e86e2512c8952aaa30864cfe0f7b1ed33eb4ae8a&w=360'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  // color: Colors.greenAccent[100],
                  color: Color.fromARGB(255, 176, 186, 206),
                  child: SizedBox(
                      width: 300,
                      height: 220,
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            Container(
                              height: 100,
                              // color: white,
                              width: 100,
                              // color: Colors.amber,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'lib/assets/me.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'MOHD RAZZAK',
                              style: GoogleFonts.aBeeZee(color: Colors.black),
                            ),
                            Text(
                              'PYTHON & Dapp DEVELOPER',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'TRUBA INSTITUTE OF ENGINEERING & INFORMATION TECHNOLOGY',
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.black, fontSize: 7),
                            ),
                            Text(
                              'B.TECH:- ARTIFICIAL INTELIGENCE AND DATA SCIENCE',
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.black, fontSize: 7),
                            ),
                          ]))) //Padding
                  ),
              SizedBox(
                height: 10,
              ),
              Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: const Color.fromARGB(130, 185, 246, 202),
                  child: SizedBox(
                      width: 300,
                      height: 220,
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            Container(
                              height: 100,
                              // color: white,
                              width: 100,
                              // color: Colors.amber,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'lib/assets/nodp.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'SUBHANA MAROOF KHAN',
                              style: GoogleFonts.aBeeZee(color: Colors.black),
                            ),
                            Text(
                              'PYTHON  DEVELOPER',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'TRUBA INSTITUTE OF ENGINEERING & INFORMATION TECHNOLOGY',
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.black, fontSize: 7),
                            ),
                            Text(
                              'B.TECH:- ARTIFICIAL INTELIGENCE AND DATA SCIENCE',
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.black, fontSize: 7),
                            ),
                          ]))) //Padding
                  ),
              SizedBox(
                height: 10,
              ),
              Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Color.fromARGB(255, 176, 201, 206),
                  child: SizedBox(
                      width: 300,
                      height: 220,
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            Container(
                              height: 100,
                              // color: white,
                              width: 100,
                              // color: Colors.amber,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'lib/assets/sajid.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'SAJID KHAN',
                              style: GoogleFonts.aBeeZee(color: Colors.black),
                            ),
                            Text(
                              'PYTHON DEVELOPER ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'TRUBA INSTITUTE OF ENGINEERING & INFORMATION TECHNOLOGY',
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.black, fontSize: 7),
                            ),
                            Text(
                              'B.TECH:- ARTIFICIAL INTELIGENCE AND DATA SCIENCE',
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.black, fontSize: 7),
                            ),
                          ]))) //Padding
                  ), //S//S
            ],
          ),
        ),
      ),
    );
  }
}
