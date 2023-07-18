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
            GestureDetector(

              child: Stack(
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

                  Positioned(
                    top: MediaQuery.of(context).size.height *0.55,
                    left: MediaQuery.of(context).size.width*0.5,
                    child: FilledButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) => Color(0xFFFF6195)),),
                      onPressed: (){

                      },
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
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
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                 Padding(
                                   padding: const EdgeInsets.only(left: 25, right: 8, ),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(left: 8, right: 8, top: 8,),
                                         child: Container(
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(20),
                                             color: Color(0xFFFF6195),
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
                                         padding: const EdgeInsets.only(left: 8, right: 8, top: 8,),
                                         child: Container(
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(20),
                                             color: Color(0xFFFF6195),
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
                                          padding: const EdgeInsets.only(left: 8,top: 5, right: 8, bottom:8),
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
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 2,top: 5, right: 8, bottom:8),
                                          child: Row(
                                            children: [
                                              Icon(Icons.favorite_border_rounded,
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
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 2,top: 5, right: 8, bottom:8),
                                          child: Row(
                                            children: [
                                              Icon(Icons.comment,
                                                color: Colors.white,
                                                size: 12,),
                                              SizedBox(width: 5,),
                                              Text('900',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),),

                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25, ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Caption',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 15,
                                        ),),
                                        SizedBox(height: 10,),

                                        Text('Stargazing \nDuality',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        SizedBox(height: 10,),

                                        Text('Posted by',
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 15,
                                          ),),
                                        SizedBox(height: 10,),
                                        Text('Tyler',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                      ],
                                    ),
                                  )
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Container(
                                      decoration: BoxDecoration(

                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color(0xFFFF6195),
                                        ),

                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(child: Text('Try Now')),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                  ),
                ],

              ),
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
    path.lineTo(0, size.height); // Start from the bottom-left corner

    // Define the control points and endpoints of the wave
    final firstControlPoint = Offset(size.width / 4, size.height - 40);
    final firstEndPoint = Offset(size.width / 2, size.height - 20);
    final secondControlPoint = Offset(size.width * 3 / 4, size.height);
    final secondEndPoint = Offset(size.width, size.height - 40);

    // Draw the first curve of the wave using cubic bezier curve
    path.cubicTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
      size.width / 2,
      size.height - 20,
    );

    // Draw the second curve of the wave using cubic bezier curve
    path.cubicTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
      size.width,
      size.height - 40,
    );

    // Line to the bottom-right corner
    path.lineTo(size.width, size.height);

    // Line to the bottom-left corner
    path.lineTo(0, size.height);

    // path.lineTo(0, size.height * 0.5);
    //
    // final controlPoint1 = Offset(size.width / 4, size.height * 0.6);
    // final endPoint1 = Offset(size.width / 2, size.height * 0.5);
    // path.quadraticBezierTo(
    //     controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy);
    //
    // final controlPoint2 = Offset(size.width - (size.width / 4), size.height * 0.4);
    // final endPoint2 = Offset(size.width, size.height * 0.5);
    // path.quadraticBezierTo(
    //     controlPoint2.dx, controlPoint2.dy, endPoint2.dx, endPoint2.dy);
    //
    // path.lineTo(size.width, size.height * 0.5);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}