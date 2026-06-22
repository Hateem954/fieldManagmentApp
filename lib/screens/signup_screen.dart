// import 'package:field_service_app/utils/customimage.dart';
// import 'package:field_service_app/utils/images.dart';
// import 'package:flutter/material.dart';

// class SignupScreen extends StatelessWidget {
//   const SignupScreen({super.key});

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

//           /// Overlay
//           Container(color: Colors.white.withOpacity(0.25)),

//           SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),

//                   /// Logo
//                   Container(
//                     height: 60,
//                     width: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                     child: CustomImageContainer(
//                       height: 99,
//                       width: 99,
//                       imageUrl: AppImages.logo,
//                       borderRadius: 12,
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   const Text(
//                     "Create Account",
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
//                   ),

//                   const SizedBox(height: 10),

//                   const Text(
//                     "Create your account and start\nmanaging your field work.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 15,
//                       height: 1.5,
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   _buildLabel("Full Name"),
//                   _buildTextField(
//                     hint: "Enter your full name",
//                     icon: Icons.person_outline,
//                   ),

//                   const SizedBox(height: 18),

//                   _buildLabel("Email"),
//                   _buildTextField(
//                     hint: "Enter your email",
//                     icon: Icons.mail_outline,
//                   ),

//                   const SizedBox(height: 18),

//                   _buildLabel("Phone Number"),
//                   _buildTextField(
//                     hint: "Enter your phone number",
//                     icon: Icons.phone_outlined,
//                   ),

//                   const SizedBox(height: 18),

//                   // _buildLabel("Password"),
//                   // _buildTextField(
//                   //   hint: "Enter your password",
//                   //   icon: Icons.lock_outline,
//                   //   isPassword: true,
//                   // ),

//                   // const SizedBox(height: 18),

//                   _buildLabel("Confirm Password"),
//                   _buildTextField(
//                     hint: "Confirm your password",
//                     icon: Icons.lock_outline,
//                     isPassword: true,
//                   ),

//                   const SizedBox(height: 25),

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
//                         "Create Account",
//                         style: TextStyle(fontSize: 17, color: Colors.white),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 25),

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

//                   /// Social Login
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _socialButton(
//                           icon: Icons.g_mobiledata,
//                           text: "Google",
//                         ),
//                       ),

//                       const SizedBox(width: 15),

//                       Expanded(
//                         child: _socialButton(icon: Icons.apple, text: "Apple"),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 30),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Already have an account?",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Log In"),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   static Widget _buildLabel(String text) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         text,
//         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//       ),
//     );
//   }

//   static Widget _buildTextField({
//     required String hint,
//     required IconData icon,
//     bool isPassword = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8),
//       child: TextField(
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
//           prefixIcon: Icon(icon, color: Colors.grey),
//           suffixIcon: isPassword
//               ? const Icon(Icons.visibility_off_outlined, color: Colors.grey)
//               : null,
//           filled: true,
//           fillColor: Colors.white.withOpacity(.9),
//           contentPadding: const EdgeInsets.symmetric(vertical: 18),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }

//   static Widget _socialButton({required IconData icon, required String text}) {
//     return Container(
//       height: 58,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 28),
//           const SizedBox(width: 8),
//           Text(text, style: const TextStyle(fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }


import 'package:field_service_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:field_service_app/utils/customimage.dart';
import 'package:field_service_app/utils/images.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  Future<void> signUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Optional: update display name
      await FirebaseAuth.instance.currentUser
          ?.updateDisplayName(_nameController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully")),
      );

      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Signup failed")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bg),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(color: Colors.white.withOpacity(0.25)),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: CustomImageContainer(
                      height: 60,
                      width: 60,
                      imageUrl: AppImages.logo,
                      borderRadius: 12,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 30),

                  _buildLabel("Full Name"),
                  _buildTextField(_nameController, "Enter your full name", Icons.person_outline),

                  const SizedBox(height: 18),

                  _buildLabel("Email"),
                  _buildTextField(_emailController, "Enter your email", Icons.mail_outline),

                  const SizedBox(height: 18),

                  // _buildLabel("Phone Number"),
                  // _buildTextField(_phoneController, "Enter your phone number", Icons.phone_outlined),

                  const SizedBox(height: 18),

                  _buildLabel("Password"),
                  _buildTextField(_passwordController, "Enter password", Icons.lock_outline, isPassword: true),

                  const SizedBox(height: 18),

                  _buildLabel("Confirm Password"),
                  _buildTextField(_confirmPasswordController, "Confirm password", Icons.lock_outline, isPassword: true),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0B1320),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Create Account",
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    IconData icon, {
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.grey),
          filled: true,
          fillColor: Colors.white.withOpacity(.9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}