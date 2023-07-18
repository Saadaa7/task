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
    return const MaterialApp(
     
      home: MyHomePage(),
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
                      image:  const AssetImage('images/rain.jpg'),
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
                            const Color(0xFFFFFFFF).withOpacity(0.05),
                          ],
                          stops: [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
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
                                           color: const Color(0xFFFF6195),
                                         ),

                                         child: const Padding(
                                           padding: EdgeInsets.all(8.0),
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
                                           color: const Color(0xFFFF6195),
                                         ),

                                         child: const Padding(
                                           padding: EdgeInsets.all(8.0),
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

                                const Padding(
                                  padding: EdgeInsets.only(left: 25, right: 8, bottom:8),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 8,top: 5, right: 8, bottom:8),
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
                                        padding: EdgeInsets.only(left: 2,top: 5, right: 8, bottom:8),
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
                                        padding: EdgeInsets.only(left: 2,top: 5, right: 8, bottom:8),
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
                                      const SizedBox(height: 10,),

                                      const Text('Stargazing \nDuality',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      const SizedBox(height: 10,),

                                      Text('Posted by',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 15,
                                        ),),
                                      const SizedBox(height: 10,),
                                      const Text('Tyler',
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
                              padding: const EdgeInsets.only(left: 30 , top:20, right: 8, bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Stack(

                                    children: [


                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: 100,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(2),
                                            image: const DecorationImage(
                                              image:  AssetImage('images/cloud.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Positioned(
                                      //   left: 0,
                                      //   child: ClipRRect(
                                      //     borderRadius: BorderRadius.circular(10),
                                      //     child: Image.asset(
                                      //       'images/cloud.jpg',    // Replace with your image path
                                      //       width: 60,             // Set the desired width
                                      //       height: 100,
                                      //       fit: BoxFit.cover,
                                      //       // Set the desired height
                                      //     ),
                                      //   ),
                                      // ),
                                      //
                                      // Positioned(
                                      //   right: 0,
                                      //   child: ClipRRect(
                                      //     borderRadius: BorderRadius.circular(10),
                                      //     child: Image.asset(
                                      //       'images/cloud.jpg',    // Replace with your image path
                                      //       width: 60,             // Set the desired width
                                      //       height: 150,
                                      //       fit: BoxFit.cover,
                                      //       // Set the desired height
                                      //     ),
                                      //   ),
                                      // ),

                                      Container(
                                        height: 100,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          image: const DecorationImage(
                                            image:  AssetImage('images/location_background.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: 150,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: const Color(0xFFFF6195),
                                            ),

                                            child: const Center(child: Text('Try Now')),
                                          ),
                                        ),
                                      ),


                                    ],
                                  )
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

  
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}