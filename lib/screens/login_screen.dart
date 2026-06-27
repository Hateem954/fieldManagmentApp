// import 'package:field_service_app/utils/customimage.dart';
// import 'package:field_service_app/utils/images.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           /// Background Image
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(AppImages.bg),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           /// White transparent overlay
//           Container(
//             decoration: BoxDecoration(color: Colors.white.withOpacity(0.25)),
//           ),

//           SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 30),

//                   /// Logo
//                   Container(
//                     height: 60,
//                     width: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                     child:
//                     //  const Icon(
//                     //   Icons.auto_awesome,
//                     //   color: Colors.purpleAccent,
//                     //   size: 35,
//                     // ),
//                      CustomImageContainer(
//                           height: 99,
//                           width: 99,
//                           imageUrl: AppImages.logo,
//                           borderRadius: 12,
//                         ),
//                   ),

//                   const SizedBox(height: 20),

//                   const Text(
//                     "Get Started Today",
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
//                   ),

//                   const SizedBox(height: 10),

//                   const Text(
//                     "Sign up in just a few steps and take\ncontrol of your field.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 15,
//                       height: 1.5,
//                     ),
//                   ),

//                   const SizedBox(height: 35),

//                   /// Email label
//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Email",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 8),

//                   /// Email field
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: "Enter your email",
//                       hintStyle: const TextStyle(
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                       prefixIcon: const Icon(
//                         Icons.mail_outline,
//                         color: Colors.grey,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(.9),
//                       contentPadding: const EdgeInsets.symmetric(vertical: 18),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   /// Password Label
//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Password",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 8),

//                   /// Password field
//                   TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: "Enter your password",
//                       hintStyle: const TextStyle(
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                       prefixIcon: const Icon(
//                         Icons.lock_outline,
//                         color: Colors.grey,
//                       ),
//                       suffixIcon: const Icon(
//                         Icons.visibility_off_outlined,
//                         color: Colors.grey,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(.9),
//                       contentPadding: const EdgeInsets.symmetric(vertical: 18),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   /// Remember me + forgot password
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 22,
//                         height: 22,
//                         child: Checkbox(
//                           value: false,
//                           onChanged: (value) {},
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       const Text("Remember me", style: TextStyle(fontSize: 13)),
//                       const Spacer(),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           "Forgot Password?",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 15),

//                   /// Continue button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 58,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xff0B1320),
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                       ),
//                       child: const Text(
//                         "Continue",
//                         style: TextStyle(fontSize: 17, color: Colors.white),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 25),

//                   /// Divider
//                   Row(
//                     children: [
//                       Expanded(child: Divider(color: Colors.grey.shade300)),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         child: Text(
//                           "or",
//                           style: TextStyle(color: Colors.grey.shade600),
//                         ),
//                       ),
//                       Expanded(child: Divider(color: Colors.grey.shade300)),
//                     ],
//                   ),

//                   const SizedBox(height: 25),

//                   /// Social buttons
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 58,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(16),
//                             border: Border.all(color: Colors.grey.shade300),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Icon(Icons.g_mobiledata, size: 30),
//                               SizedBox(width: 5),
//                               Text("Google", style: TextStyle(fontSize: 16)),
//                             ],
//                           ),
//                         ),
//                       ),

//                       const SizedBox(width: 15),

//                       Expanded(
//                         child: Container(
//                           height: 58,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(16),
//                             border: Border.all(color: Colors.grey.shade300),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Icon(Icons.apple, size: 24),
//                               SizedBox(width: 8),
//                               Text("Apple", style: TextStyle(fontSize: 16)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 35),

//                   RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                         fontSize: 12,
//                       ),
//                       children: const [
//                         TextSpan(
//                           text: 'By tapping "Continue", you agree to our\n',
//                         ),
//                         TextSpan(
//                           text: 'Privacy Policy & Terms of Service',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:field_service_app/login_credentials.dart';
import 'package:field_service_app/screens/home_screen.dart';
import 'package:field_service_app/screens/profile_screen.dart';
import 'package:field_service_app/screens/welcomw_screen.dart';
import 'package:field_service_app/utils/customimage.dart';
import 'package:field_service_app/utils/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  bool rememberMe = false;
  bool isLoading = false;

// Future<void> loginUser() async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//             email: emailController.text.trim(),
//             password: passwordController.text.trim(),
//           );

//       User user = userCredential.user!;

//       SharedPreferences prefs = await SharedPreferences.getInstance();

//       await prefs.setString('uid', user.uid);
//       await prefs.setString('email', user.email ?? '');

//       print("Login Successful");
//       print("UID: ${user.uid}");
//       print("Email: ${user.email}");

//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Login Successful")));

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const HomeScreen()),
//       );
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(e.message ?? "Login Failed")));
//     }
//   }


Future<void> loginUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      User user = userCredential.user!;

      print("Login Successful");
      print("UID: ${user.uid}");

      // Save data locally
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('uid', user.uid);
      await prefs.setString('email', user.email ?? '');

      // Check profile in Firestore
      DocumentSnapshot profileDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login Successful")));

      // If profile does not exist
      if (!profileDoc.exists) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        return;
      }

      // If document exists, check required fields
      Map<String, dynamic>? data = profileDoc.data() as Map<String, dynamic>?;

      bool profileCompleted =
          data != null && (data['fullName'] ?? '').toString().isNotEmpty;

      if (profileCompleted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });

      String message = "Login Failed";

      if (e.code == 'user-not-found') {
        message = "No user found with this email";
      } else if (e.code == 'wrong-password') {
        message = "Incorrect password";
      } else if (e.code == 'invalid-email') {
        message = "Invalid email address";
      } else {
        message = e.message ?? "Login Failed";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bg),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Overlay
          Container(color: Colors.white.withOpacity(0.25)),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  /// Logo
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: CustomImageContainer(
                      height: 99,
                      width: 99,
                      imageUrl: AppImages.logo,
                      borderRadius: 12,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Get Started Today",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Sign in to continue managing\nyour field work.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 35),

                  /// Email Label
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// Email Field
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(.9),
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Password Label
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// Password Field
                  TextField(
                    controller: passwordController,
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(.9),
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Remember Me
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                      ),
                      const Text("Remember me", style: TextStyle(fontSize: 13)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // Forgot Password Screen
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  /// Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : loginUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0B1320),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "or",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// Social Buttons
                  Row(
                    children: [
                      Expanded(
                        child: _socialButton(Icons.g_mobiledata, "Google"),
                      ),
                      const SizedBox(width: 15),
                      Expanded(child: _socialButton(Icons.apple, "Apple")),
                    ],
                  ),

                  const SizedBox(height: 35),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                      children: const [
                        TextSpan(
                          text: 'By tapping "Continue", you agree to our\n',
                        ),
                        TextSpan(
                          text: 'Privacy Policy & Terms of Service',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialButton(IconData icon, String text) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
