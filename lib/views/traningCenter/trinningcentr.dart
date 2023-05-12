import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/views/welcomePage/be.dart';
import 'package:url_launcher/url_launcher.dart';

class train extends StatefulWidget {
  const train({Key? key}) : super(key: key);

  @override
  State<train> createState() => _trainState();
}

class _trainState extends State<train> {
  final Uri url = Uri.parse("https://motamn.com/ar");
  final Uri url2 = Uri.parse("https://altawsul.com/");
  final Uri url3 = Uri.parse("https://motmaina.com/service/2");

  Widget ceter() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(right: 5, left: 70, bottom: 10),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(
                    CupertinoIcons.home,
                    color: Colors.lime,
                    size: 100,
                  ),
                ),
                const SizedBox(
                  height: 5,
                  width: 300,
                ),
                Text("مراكز اختبار الذكاء",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.lime[700],
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 10, top: 20, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.pink,
                          width: 2,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(offset: const Offset(0, 5), color: Theme.of(context).primaryColor.withOpacity(.2), spreadRadius: 2, blurRadius: 5)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Icon(
                              Icons.child_care_outlined,
                              color: Colors.pink[200],
                            )
                            //Icon( CupertinoIcons.card, color: Colors.lime,size: 100,),
                            ),
                        const SizedBox(
                          height: 5,
                          width: 300,
                        ),
                        Text("مركز مؤتمن",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            )),
                        ElevatedButton(
                          onPressed: () => setState(
                            () {
                              launchUrl(url);
                            },
                          ),
                          child: Text('لمزيد من المعلومات '),
                          style: TextButton.styleFrom(backgroundColor: Colors.pink[200], shape: StadiumBorder()),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 10, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.pink,
                          width: 2,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(offset: const Offset(0, 5), color: Theme.of(context).primaryColor.withOpacity(.2), spreadRadius: 2, blurRadius: 5)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Icon(
                              Icons.child_care_outlined,
                              color: Colors.pink[200],
                            )
                            //Icon( CupertinoIcons.card, color: Colors.lime,size: 100,),
                            ),
                        const SizedBox(
                          height: 5,
                          width: 300,
                        ),
                        Text(" مركز التواصل الشامل ",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                        ElevatedButton(
                          onPressed: () {
                            launchUrl(url2);
                          },
                          child: Text('لمزيد من المعلومات'),
                          style: TextButton.styleFrom(backgroundColor: Colors.pink[200], shape: StadiumBorder()),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 10, bottom: 50),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.pink,
                          width: 2,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(offset: const Offset(0, 5), color: Theme.of(context).primaryColor.withOpacity(.2), spreadRadius: 2, blurRadius: 5)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Icon(
                              Icons.child_care_outlined,
                              color: Colors.pink[200],
                            )
                            //Icon( CupertinoIcons.card, color: Colors.lime,size: 100,),
                            ),
                        const SizedBox(
                          height: 5,
                          width: 300,
                        ),
                        Text(" مركز مطمئنة ",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[200],
                            )),
                        ElevatedButton(
                          onPressed: () {
                            launchUrl(url3);
                          },
                          child: Text('لمزيد من المعلومات'),
                          style: TextButton.styleFrom(backgroundColor: Colors.pink[200], shape: StadiumBorder()),
                        )
                      ],
                    ),
                  ),
                ),
                // Padding(
                //     padding: const EdgeInsets.only(right: 5, left: 10, top: 20, bottom: 50),
                //     child: Container(
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Colors.orange,
                //             width: 2,
                //           ),
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(10),
                //           boxShadow: [
                //             BoxShadow(
                //                 offset: const Offset(0, 5), color: Theme.of(context).primaryColor.withOpacity(.2), spreadRadius: 2, blurRadius: 5)
                //           ]),
                //
                //     ))
              ],
            ),
          ),
        ),
      ),

//Center(child: Text('للتواصل مع',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(top: -height * .15, right: -MediaQuery.of(context).size.width * .4, child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  ceter(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
