import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'be.dart';



String? gender;
class trainn extends StatefulWidget {
  trainn({Key ?key, this.title}) : super(key: key);

  final String? title;

  @override
  _trainnState createState() => _trainnState();
}

class _trainnState extends State<trainn> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child:  Positioned(top: 0,left: 100,
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              ),
              Text('تراجع',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
            ],
          ),
        ),
      ),
    );
  }

  Widget radio(){
    return Column(
        children: [

          Container(
            // decoration: const BoxDecoration(
            //       gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
            //
            //           colors: [Colors.transparent])),

              child: Column(

                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:  Positioned( top: 40, left: 0,
                        child: Container(

                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[


                            ],
                          ),
                        ),
                      ),

                    ),
                    Divider(color: Colors.transparent,height: 50,),


                    Directionality( textDirection: TextDirection.rtl,
                      child:Text('اذا كان لديك 7 اقلام وقمت ببيع 3 كم تبقى قلم لديك؟',style: GoogleFonts.almarai(textStyle: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 30,color: Colors.brown),)),
                    ),
                    Divider(color: Colors.transparent,height: 5,),
                    Directionality(
                      textDirection: TextDirection.rtl,

                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange,width: 5), borderRadius: BorderRadius.all(
                            Radius.circular(30.0))
                        ),
                        child: RadioListTile(
                          title: Text("7",style: GoogleFonts.almarai(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 20,color: Colors.orange),)),
                          value: "احمر",
                          groupValue: gender,
                          onChanged: (value){
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Divider(color: Colors.transparent,height: 5,),


                    Directionality(
                      textDirection: TextDirection.rtl,

                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange,width: 5), borderRadius: BorderRadius.all(
                            Radius.circular(30.0))
                        ),
                        child: RadioListTile(
                          title: Text("5",style: GoogleFonts.almarai(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 20,color: Colors.orange),)),
                          value: "سماوي",
                          groupValue: gender,
                          onChanged: (value){
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Divider(color: Colors.transparent,height: 10,),


                    Directionality(
                      textDirection: TextDirection.rtl,

                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange,width: 5), borderRadius: BorderRadius.all(
                            Radius.circular(30.0))
                        ),
                        child: RadioListTile(
                          title: Text("3",style: GoogleFonts.almarai(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 20,color: Colors.orange),)),
                          value: "اسود",
                          groupValue: gender,
                          onChanged: (value){
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Divider(color: Colors.transparent,height: 10,),


                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green,width: 5), borderRadius: BorderRadius.all(
                            Radius.circular(30.0))
                        ),
                        child: RadioListTile(
                          title: Text("4",style: GoogleFonts.almarai(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 20,color: Colors.orange),)),
                          value: "اخضر",
                          groupValue: gender,
                          onChanged: (value){
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),


                      ),
                    ),


                  ] )
          )
        ]
    );
  }

  Widget move(){
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child:  Positioned(top: 0,left: 100,
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              ),
              Text('انتقال',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .09),

                    SizedBox(
                      height:10,
                    ),
                    SizedBox(height: height *.05),
                    radio(),


                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),

            Positioned(top: 650, left: 200, child: move()),
          ],
        ),
      ),
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
//
//
//
//
// String? gender;
// class hj extends StatefulWidget {
//   hj({Key ?key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   _hjState createState() => _hjState();
// }
//
// class _hjState extends State<hj> {
//   Widget _backButton() {
//     return InkWell(
//       onTap: () {
//         Navigator.pop(context);
//       },
//       child:  Positioned(top: 0,left: 100,
//         child: Container(
//
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: Row(
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
//                 child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
//               ),
//               Text('تراجع',
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget radio(){
//     return Column(
//         children: [
//
//           Container(
//             // decoration: const BoxDecoration(
//             //       gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
//             //
//             //           colors: [Colors.transparent])),
//
//               child: Column(
//
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child:  Positioned( top: 40, left: 0,
//                         child: Container(
//
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           child: Row(
//                             children: <Widget>[
//
//
//                             ],
//                           ),
//                         ),
//                       ),
//
//                     ),
//                     Divider(color: Colors.transparent,height: 50,),
//
//
//                     Directionality( textDirection: TextDirection.rtl,
//                       child:Text('اذا كان لديك 7 اقلام وقمت ببيع 3 كم تبقى قلم لديك؟',style: GoogleFonts.almarai(textStyle: TextStyle(
//                           fontWeight: FontWeight.bold,fontSize: 30,color: Colors.brown),)),
//                     ),
//                     Divider(color: Colors.transparent,height: 5,),
//                     Directionality(
//                       textDirection: TextDirection.rtl,
//
//                       child: Container(
//                         margin: const EdgeInsets.all(15.0),
//                         padding: const EdgeInsets.all(3.0),
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white,width: 5), borderRadius: BorderRadius.all(
//                             Radius.circular(30.0))
//                         ),
//                         child: RadioListTile(
//                           title: Text("7",style: GoogleFonts.almarai(textStyle: TextStyle(
//                               fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
//                           value: "احمر",
//                           groupValue: gender,
//                           onChanged: (value){
//                             setState(() {
//                               gender = value.toString();
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     Divider(color: Colors.transparent,height: 5,),
//
//
//                     Directionality(
//                       textDirection: TextDirection.rtl,
//
//                       child: Container(
//                         margin: const EdgeInsets.all(15.0),
//                         padding: const EdgeInsets.all(3.0),
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white,width: 5), borderRadius: BorderRadius.all(
//                             Radius.circular(30.0))
//                         ),
//                         child: RadioListTile(
//                           title: Text("5",style: GoogleFonts.almarai(textStyle: TextStyle(
//                               fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
//                           value: "سماوي",
//                           groupValue: gender,
//                           onChanged: (value){
//                             setState(() {
//                               gender = value.toString();
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     Divider(color: Colors.transparent,height: 10,),
//
//
//                     Directionality(
//                       textDirection: TextDirection.rtl,
//
//                       child: Container(
//                         margin: const EdgeInsets.all(15.0),
//                         padding: const EdgeInsets.all(3.0),
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white,width: 5), borderRadius: BorderRadius.all(
//                             Radius.circular(30.0))
//                         ),
//                         child: RadioListTile(
//                           title: Text("3",style: GoogleFonts.almarai(textStyle: TextStyle(
//                               fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
//                           value: "اسود",
//                           groupValue: gender,
//                           onChanged: (value){
//                             setState(() {
//                               gender = value.toString();
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     Divider(color: Colors.transparent,height: 10,),
//
//
//                     Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: Container(
//                         margin: const EdgeInsets.all(15.0),
//                         padding: const EdgeInsets.all(3.0),
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white,width: 5), borderRadius: BorderRadius.all(
//                             Radius.circular(30.0))
//                         ),
//                         child: RadioListTile(
//                           title: Text("4",style: GoogleFonts.almarai(textStyle: TextStyle(
//                               fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
//                           value: "اخضر",
//                           groupValue: gender,
//                           onChanged: (value){
//                             setState(() {
//                               gender = value.toString();
//                             });
//                           },
//                         ),
//
//
//                       ),
//                     ),
//
//
//                   ] )
//           )
//         ]
//     );
//   }
//
//
//
//
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(5)),
//             boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)],
//             gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xfffbb448), Color(0xffe46b10)])),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//
//             SizedBox(
//               height:10,
//             ),
//
//             radio(),
//
//
//             Positioned(top: 40, left: 0, child: _backButton()),
//             // _label()
//           ],
//         ),
//
//       ),
//
//
//     ),
//   );
// }
// }
