// import 'package:flutter/material.dart';
// import 'package:field_service_app/utils/images.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final TextEditingController fullNameController = TextEditingController(
//     text: "John William",
//   );

//   final TextEditingController emailController = TextEditingController(
//     text: "johnwilliam@gmail.com",
//   );

//   final TextEditingController contactController = TextEditingController(
//     text: "+92 300 1234567",
//   );

//   List<String> roles = ["Technician", "User", "Admin"];

//   String selectedRole = "Technician";

//   bool isEditing = false;

//   @override
//   Widget build(BuildContext context) {
//     const Color primaryColor = Color(0xffBE8A3D);
//     const Color bgColor = Color(0xffF8F2E9);

//     return Scaffold(
//       backgroundColor: bgColor,

//       appBar: AppBar(
//         backgroundColor: bgColor,
//         elevation: 0,
//         centerTitle: true,

//         title: const Text(
//           "Profile",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//         ),

//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),

//         /// Edit Button
//         actions: [
//           IconButton(
//             icon: Icon(
//               isEditing ? Icons.close : Icons.edit,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               setState(() {
//                 isEditing = !isEditing;
//               });
//             },
//           ),
//         ],
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 10),

//             /// Profile Image
//             Center(
//               child: Stack(
//                 children: [
//                  CircleAvatar(
//                     radius: 60,
//                     backgroundColor: primaryColor,
//                     child: const Icon(
//                       Icons.person,
//                       size: 60,
//                       color: Colors.white,
//                     ),
//                   ),

//                   if (isEditing)
//                     Positioned(
//                       right: 0,
//                       bottom: 0,
//                       child: Container(
//                         height: 38,
//                         width: 38,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(.1),
//                               blurRadius: 5,
//                             ),
//                           ],
//                         ),
//                         child: IconButton(
//                           padding: EdgeInsets.zero,
//                           onPressed: () {
//                             // Add image picker here
//                           },
//                           icon: const Icon(
//                             Icons.camera_alt,
//                             color: primaryColor,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 40),

//             /// Full Name
//             buildLabel("Full Name"),

//             buildTextField(
//               controller: fullNameController,
//               icon: Icons.person_outline,
//               enabled: isEditing,
//             ),

//             const SizedBox(height: 20),

//             /// Email
//             buildLabel("Email Address"),

//             buildTextField(
//               controller: emailController,
//               icon: Icons.email_outlined,
//               enabled: isEditing,
//             ),

//             const SizedBox(height: 20),

//             /// Contact Number
//             buildLabel("Contact Number"),

//             buildTextField(
//               controller: contactController,
//               icon: Icons.phone_outlined,
//               enabled: isEditing,
//             ),

//             const SizedBox(height: 20),

//             /// Role Dropdown
//             buildLabel("Role"),

//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 15),

//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//               ),

//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<String>(
//                   value: selectedRole,
//                   isExpanded: true,
//                   icon: const Icon(Icons.arrow_drop_down),

//                   items: roles.map((role) {
//                     return DropdownMenuItem(value: role, child: Text(role));
//                   }).toList(),

//                   onChanged: isEditing
//                       ? (value) {
//                           setState(() {
//                             selectedRole = value!;
//                           });
//                         }
//                       : null,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 50),

//             /// Save Button
//             if (isEditing)
//               SizedBox(
//                 width: double.infinity,
//                 height: 55,

//                 child: ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       isEditing = false;
//                     });

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("Profile Updated Successfully"),
//                       ),
//                     );
//                   },

//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: primaryColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),

//                   child: const Text(
//                     "Save Changes",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildLabel(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Text(
//         text,
//         style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//       ),
//     );
//   }

//   Widget buildTextField({
//     required TextEditingController controller,
//     required IconData icon,
//     required bool enabled,
//   }) {
//     return TextField(
//       controller: controller,
//       enabled: enabled,

//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: const Color(0xffBE8A3D)),

//         filled: true,
//         fillColor: enabled ? Colors.white : Colors.grey.shade100,

//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:field_service_app/screens/home_screen.dart';
import 'package:field_service_app/utils/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController contactController = TextEditingController();

  List<String> roles = ["None","Sweeper", "Internet Service Providers","AC Repair Companies","Electricians","Plumbers","Technical Support Companies"];
  String selectedRole = "None";

  bool isEditing = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  /// Fetch User Data from Firestore using UID from SharedPreferences
Future<void> getUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? uid = prefs.getString('uid');
      String? email = prefs.getString('email');

      print("Stored UID: $uid");
      print("Stored Email: $email");

      // Display email from local storage
      emailController.text = email ?? '';

      if (uid == null || uid.isEmpty) {
        setState(() {
          isLoading = false;
        });
        return;
      }

      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      print("Document exists: ${doc.exists}");

      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        fullNameController.text = data['fullName'] ?? '';

        contactController.text = data['contact'] ?? '';

        selectedRole = data['role'] ?? 'Technician';
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");

      setState(() {
        isLoading = false;
      });
    }
  }
  /// Update Profile
 Future<void> updateProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? uid = prefs.getString('uid');
      String? email = prefs.getString('email');

      if (uid == null) return;

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'fullName': fullNameController.text.trim(),
        'email': emailController.text.trim(),
        'contact': contactController.text.trim(),
        'role': selectedRole,
        'status': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile Updated Successfully")),
      );
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      setState(() {
        isEditing = false;
      });
    } catch (e) {
      print("Update Error: $e");
    }
  }
  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    contactController.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.black;
    const Color piccolor = Colors.transparent;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isEditing ? Icons.close : Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.bg,
            ), // or AssetImage("assets/images/bg.png")
            fit: BoxFit.cover,
          ),
        ),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    // Center(
                    //   child: Stack(
                    //     children: [
                    //       const CircleAvatar(
                    //         radius: 60,
                    //         backgroundColor: piccolor,
                    //         child: Icon(
                    //           Icons.person,
                    //           size: 60,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //       if (isEditing)
                    //         Positioned(
                    //           right: 0,
                    //           bottom: 0,
                    //           child: Container(
                    //             height: 38,
                    //             width: 38,
                    //             decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               shape: BoxShape.circle,
                    //               boxShadow: [
                    //                 BoxShadow(
                    //                   color: Colors.black26,
                    //                   blurRadius: 5,
                    //                 ),
                    //               ],
                    //             ),
                    //             child: IconButton(
                    //               padding: EdgeInsets.zero,
                    //               onPressed: () {},
                    //               icon: const Icon(
                    //                 Icons.camera_alt,
                    //                 size: 20,
                    //                 color: primaryColor,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //     ],
                    //   ),
                    // ),

                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xffBE8A3D),
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 60,
                              backgroundColor: Color(0xffF5F5F5),
                              child: Icon(
                                Icons.person,
                                size: 70,
                                color: Color(0xffBE8A3D),
                              ),
                            ),
                          ),

                          if (isEditing)
                            GestureDetector(
                              onTap: () {
                                // Pick image here
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xffBE8A3D),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    buildLabel("Full Name"),
                    buildTextField(
                      controller: fullNameController,
                      icon: Icons.person_outline,
                      enabled: isEditing,
                      hintText: "Enter Full Name",
                    ),

                    const SizedBox(height: 20),

                    buildLabel("Email Address"),
                    buildTextField(
                      controller: emailController,
                      icon: Icons.email_outlined,
                      enabled: false,
                      hintText: "Email Address",
                    ),

                    const SizedBox(height: 20),

                    buildLabel("Contact Number"),
                    buildTextField(
                      controller: contactController,
                      icon: Icons.phone_outlined,
                      enabled: isEditing,
                      hintText: "Enter Contact Number",
                    ),

                    const SizedBox(height: 20),

                    buildLabel("Role"),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: roles.contains(selectedRole)
                              ? selectedRole
                              : "None",
                          isExpanded: true,
                          items: roles.map((role) {
                            return DropdownMenuItem<String>(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                          onChanged: isEditing
                              ? (value) {
                                  setState(() {
                                    selectedRole = value!;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    if (isEditing)
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: updateProfile,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Save Changes",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
      ),
    );
  }
  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required bool enabled,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      enabled: enabled,
      readOnly: !enabled,

      decoration: InputDecoration(
        hintText: hintText,

        prefixIcon: Icon(icon, color: const Color(0xffBE8A3D)),

        filled: true,
        fillColor: enabled ? Colors.white : Colors.grey.shade100,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xffBE8A3D)),
        ),
      ),
    );
  }
}
