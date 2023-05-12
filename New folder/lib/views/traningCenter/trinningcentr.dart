import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class train extends StatefulWidget {
  const train({Key? key}) : super(key: key);

  @override
  State<train> createState() => _trainState();
}

class _trainState extends State<train> {
  final Uri url = Uri.parse("https://6manina.com/");
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text("تراجع", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget ceter() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(right: 5, left: 70, top: 50, bottom: 50),
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
                  padding: const EdgeInsets.only(right: 5, left: 10, top: 20, bottom: 50),
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
                            padding: const EdgeInsets.all(15),
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
                        Text("عيادات طمأنينة",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[200],
                            )),
                        ElevatedButton(
                          onPressed: () {
                            // launchUrl(url);
                          },
                          child: Text('انقر للتسجيل'),
                          style: TextButton.styleFrom(backgroundColor: Colors.pink[200], shape: StadiumBorder()),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 10, top: 20, bottom: 50),
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
                            padding: const EdgeInsets.all(15),
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
                        Text("عيادات طمأنينة",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[200],
                            )),
                        ElevatedButton(
                          onPressed: () {
                            // launchUrl(url);
                          },
                          child: Text('انقر للتسجيل'),
                          style: TextButton.styleFrom(backgroundColor: Colors.pink[200], shape: StadiumBorder()),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 10, top: 20, bottom: 50),
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
                            padding: const EdgeInsets.all(15),
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
                        Text("عيادات طمأنينة",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[200],
                            )),
                        ElevatedButton(
                          onPressed: () {
                            // launchUrl(url);
                          },
                          child: Text('انقر للتسجيل'),
                          style: TextButton.styleFrom(backgroundColor: Colors.pink[200], shape: StadiumBorder()),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 5, left: 10, top: 20, bottom: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                            width: 2,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5), color: Theme.of(context).primaryColor.withOpacity(.2), spreadRadius: 2, blurRadius: 5)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15),
                              child: Icon(
                                Icons.child_care_outlined,
                                color: Colors.orange[200],
                              )
                              //Icon( CupertinoIcons.card, color: Colors.lime,size: 100,),
                              ),
                          const SizedBox(
                            height: 5,
                            width: 300,
                          ),
                          Text("عيادات طمأنينة",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange[200],
                              )),
                          ElevatedButton(
                            onPressed: () {
                              // launchUrl(url);
                            },
                            child: Text('انقر للتسجيل'),
                            style: TextButton.styleFrom(backgroundColor: Colors.orange[200], shape: StadiumBorder()),
                          )
                        ],
                      ),
                    ))
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
          // Positioned(top: -height * .15, right: -MediaQuery.of(context).size.width * .4, child: BezierContainer()),
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
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
