  import 'package:camera/camera.dart';
  import 'package:flutter/foundation.dart';
  import 'package:flutter/material.dart';
  import 'package:glassmorphism/glassmorphism.dart';
  import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
  import 'CameraView.dart';
  import 'package:like_button/like_button.dart';

  void main() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
       const MyApp()

    );


  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        // useInheritedMediaQuery: true,
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
    AssetImage _currentImage = const AssetImage('images/rain.jpg');
     CameraDescription?  firstCamera;
    Future<bool> getCamera() async {
      // Obtain a list of the available cameras on the device.
      final cameras = await availableCameras();
      // Get a specific camera from the list of available cameras.
      firstCamera = cameras.first;
      return Future.value(true);
    }
   void changeImage(){
     setState(() {
       // Change the image upon button tap
       if (_currentImage == const AssetImage('images/rain.jpg')) {
         _currentImage = const AssetImage('images/cloud.jpg');
       } else if(_currentImage == const AssetImage('images/cloud.jpg')){
         _currentImage = const AssetImage('images/location_background.jpg');
       }
       else{
         _currentImage = const AssetImage('images/rain.jpg');
       }
     });
   }
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }


    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onVerticalDragUpdate: (details)async{
              if (details.delta.dy < 0) {
                await getCamera() ;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraView(camera: firstCamera)));

              }
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _currentImage,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.8), BlendMode.dstATop),
                    ),
                  ),
                  constraints: const BoxConstraints.expand(),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.54,
                  left: MediaQuery.of(context).size.width * 0.4,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => const Color(0xFFFF6195)),
                    ),
                    onPressed: () async {
                      await getCamera() ;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraView(camera: firstCamera)));

                    },
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: CustomWaveClipper(),
                    // WaveClipperTwo(reverse: true),
                    child: GlassmorphicContainer(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*0.4,
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
                          padding: const EdgeInsets.only(top: 40, bottom: 13, right: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 8,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 8,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xFFFF6195),
                                              ),
                                              child:  Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child:
                                                LikeButton(
                                                  size: 18,
                                                  circleColor:
                                                  CircleColor(start: Colors.black26, end: Colors.black),
                                                  bubblesColor: BubblesColor(
                                                    dotPrimaryColor: Colors.black,
                                                    dotSecondaryColor: Colors.black12,
                                                  ),
                                                  likeBuilder: (bool isLiked) {
                                                    return Icon(
                                                      isLiked ?Icons.favorite : Icons.favorite_border_outlined,
                                                      color:  Colors.black,
                                                      size: 18,
                                                    );
                                                  },
                                                  likeCount: 0,

                                                ),
                                                // Icon(
                                                //   Icons.favorite_border_outlined,
                                                //   color: Colors.black,
                                                //   size: 18,
                                                // ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 8,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xFFFF6195),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.comment_outlined,
                                                  color: Colors.black,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 25, right: 8, bottom: 8),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8,
                                                top: 5,
                                                right: 8,
                                                bottom: 8),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '2.2k',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 2,
                                                top: 5,
                                                right: 8,
                                                bottom: 8),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '2.2k',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 2,
                                                top: 5,
                                                right: 8,
                                                bottom: 8),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.comment,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '900',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Caption',
                                            style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            'Stargazing \nDuality',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Posted by',
                                            style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            'Tyler',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: ()=>changeImage(),

                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Container(
                                    height:  MediaQuery.of(context).size.height*0.21 ,
                                    child: Stack(
                                      // fit: StackFit.,
                                      children: [

                                        Positioned(
                                          // alignment: Alignment.center,
                                          top: 5,
                                          left: 35,
                                          child: Transform.rotate(
                                            angle: -0.4,
                                            child: Container(
                                              height: 100,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'images/cloud.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          // alignment: Alignment.center,
                                          top: 5,
                                          left: 70,
                                          child: Transform.rotate(
                                            angle: 0.5, //(in radians)
                                            child: Container(
                                              height: 100,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'images/location_background.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          // top: 10,
                                          // left: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom:20, top: 8, left: 8, right: 8),
                                            child: Container(

                                              width: 150,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xFFFF6195),
                                              ),
                                              child:
                                                  const Center(child: Text('Try Now',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  ),)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  class CustomWaveClipper extends CustomClipper<Path> {
    @override
    Path getClip(Size size) {
      // TODO: implement getClip
      Path path_0 = Path();
      path_0.moveTo(0,0);
      path_0.lineTo(size.width*0.0012500,size.height*0.9987500);
      path_0.lineTo(size.width*1.0025000,size.height);
      path_0.lineTo(size.width,size.height*0.0012500);
      path_0.quadraticBezierTo(size.width*0.7277500,size.height*-0.0238000,size.width*0.6850000,size.height*0.0025000);
      path_0.cubicTo(size.width*0.6483750,size.height*0.0213750,size.width*0.5791250,size.height*0.1171250,size.width*0.4805000,size.height*0.1460000);
      path_0.cubicTo(size.width*0.3966250,size.height*0.1446250,size.width*0.3188750,size.height*0.0078750,size.width*0.2750000,size.height*0.0005000);
      path_0.quadraticBezierTo(size.width*0.2822500,size.height*-0.0256250,0,0);
      path_0.close();
      path_0.close();
      return path_0;
    }

    @override
    bool shouldReclip(covariant CustomClipper<Path> oldClipper)=>false;

  }
