import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body:
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage('images/rain.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.8), BlendMode.dstATop),
                    ),
                  ),
                  constraints: const BoxConstraints.expand(),

                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: WaveClipperTwo(
                      reverse: true
                    ),
                    child: GlassmorphicContainer(
                      width: double.infinity,
                      height: 300,
                      blur: 5,
                      border: 0,

                      borderRadius: 20,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Color(0xFFFFFFFF).withOpacity(0.05),
                          ],
                          stops: [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(0.5),
                          Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                         Padding(
                           padding: const EdgeInsets.only(left: 25, right: 8, top: 8, bottom:8),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom:8),
                                 child: Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20),
                                     color: Color(0xFFEB1555),
                                   ),

                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Icon(Icons.favorite_border_outlined,
                                     color: Colors.black,
                                       size: 18,
                                     ),
                                   ),
                                 ),
                               ),

                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20),
                                     color: Color(0xFFEB1555),
                                   ),

                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Icon(Icons.comment_outlined,
                                       color: Colors.black,
                                       size:18,
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),

                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 8, bottom:8),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12, right: 8, bottom:8),
                                  child: Row(
                                    children: [
                                      Icon(Icons.remove_red_eye_outlined,
                                      color: Colors.white,
                                      size: 12,),
                                      SizedBox(width: 5,),
                                      Text('2.2k',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                ),
              ],

            ),



      ),
    );
  }
}

class CustomWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0, size.height * 0.5);

    final controlPoint1 = Offset(size.width / 4, size.height * 0.6);
    final endPoint1 = Offset(size.width / 2, size.height * 0.5);
    path.quadraticBezierTo(
        controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy);

    final controlPoint2 = Offset(size.width - (size.width / 4), size.height * 0.4);
    final endPoint2 = Offset(size.width, size.height * 0.5);
    path.quadraticBezierTo(
        controlPoint2.dx, controlPoint2.dy, endPoint2.dx, endPoint2.dy);

    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    //
    //  path.lineTo(0, size.height); //starting point
    // var firstStart = Offset(size.width/2, size.height);
    // var firstEnd = Offset(size.width/2.25, size.height-70);
    // path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    // var secondStart = Offset(size.width/2, size.height-70);
    // var secondEnd = Offset(size.width/1.6, size.height-30);
    // path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    // path.lineTo(size.width, size.height);
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}