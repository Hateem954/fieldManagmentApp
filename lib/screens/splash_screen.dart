// import 'package:field_service_app/utils/customimage.dart';
// import 'package:field_service_app/utils/images.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background Image
//           Image.asset(AppImages.backsplash, fit: BoxFit.cover),

//           // Center Content
//           Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Logo Box
//                 Transform.rotate(
//                   angle: -0.12,
//                   child: Container(
//                     width: 100,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(22),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.15),
//                           blurRadius: 12,
//                           offset: const Offset(0, 5),
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(18),
//                       child: 
//                       // Image.asset(AppImages.logo, fit: BoxFit.contain),
                      // CustomImageContainer(
                      //   height: 99,
                      //   width: 99,
                      //   imageUrl: AppImages.logo,
                      //   borderRadius: 12,
                      // ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 const Text(
//                   'Job Field Software',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.w700,
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:async';

import 'package:field_service_app/screens/welcomw_screen.dart';
import 'package:field_service_app/utils/customimage.dart';
import 'package:field_service_app/utils/images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// Background Image
          // Image.asset('assets/images/splash_bg.png', fit: BoxFit.cover),
Image.asset(AppImages.backsplash, fit: BoxFit.cover),
          /// Center Content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child:
                    //  Image.asset(
                    //   'assets/images/logo.png',
                    //   fit: BoxFit.contain,
                    // ),
                    CustomImageContainer(
                          height: 99,
                          width: 99,
                          imageUrl: AppImages.logo,
                          borderRadius: 12,
                        ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Job Field Software',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
