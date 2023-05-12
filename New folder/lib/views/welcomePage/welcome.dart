import 'package:flutter/material.dart';
import 'package:flutter_quiz/views/loginScreen/login_screen.dart';
import 'package:flutter_quiz/views/signupScreen/signup_screen.dart';
import 'package:flutter_quiz/views/testQuizPage/rest-quiz_page.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[BoxShadow(color: Color(0xffdf8e33).withAlpha(100), offset: Offset(2, 4), blurRadius: 8, spreadRadius: 2)],
            color: Colors.white),
        child: Text(
          'تسجيل الدخول',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TestQuizPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'تسجيل حساب جديد',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  // Widget _label() {
  //   return Container(
  //       margin: EdgeInsets.only(top: 40, bottom: 20),
  //       child: Column(
  //         children: <Widget>[
  //           Text(
  //             'Quick login with Touch ID',
  //             style: TextStyle(color: Colors.white, fontSize: 17),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Icon(Icons.fingerprint, size: 90, color: Colors.white),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Text(
  //             'Touch ID',
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 15,
  //               decoration: TextDecoration.underline,
  //             ),
  //           ),
  //         ],
  //       ));
  // }
  // Widget _label() {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => hj()));
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       decoration: new BoxDecoration(
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.orange,
  //             blurRadius: 10.0,
  //           ),
  //         ],
  //       ),
  //       child: Card(
  //         color: Colors.white,
  //         shape: RoundedRectangleBorder(
  //           side: BorderSide(color: Colors.orange, width: 1),
  //           borderRadius: BorderRadius.circular(20.0),
  //         ),
  //         child: SizedBox(
  //           width: 30,
  //           height: 50,
  //           child: Center(
  //             child: Text('اختبار تجريبي ',
  //                 style: GoogleFonts.almarai(
  //                   textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.orange),
  //                 )),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'اختبار',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'الذكاء',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: '\nللاطفال ',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)],
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 80,
              ),
              _submitButton(),
              SizedBox(
                height: 20,
              ),
              _signUpButton(),
              SizedBox(
                height: 20,
              ),
              // _label()
            ],
          ),
        ),
      ),
    );
  }
}
