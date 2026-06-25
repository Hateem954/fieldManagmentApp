import 'package:flutter/material.dart';
import 'package:field_service_app/utils/images.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController fullNameController = TextEditingController(
    text: "John William",
  );

  final TextEditingController emailController = TextEditingController(
    text: "johnwilliam@gmail.com",
  );

  final TextEditingController contactController = TextEditingController(
    text: "+92 300 1234567",
  );

  List<String> roles = ["Technician", "Supervisor", "Admin"];

  String selectedRole = "Technician";

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xffBE8A3D);
    const Color bgColor = Color(0xffF8F2E9);

    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),

        /// Edit Button
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

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            /// Profile Image
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: primaryColor,
                    backgroundImage: const AssetImage(AppImages.logo),
                  ),

                  if (isEditing)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            // Add image picker here
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            /// Full Name
            buildLabel("Full Name"),

            buildTextField(
              controller: fullNameController,
              icon: Icons.person_outline,
              enabled: isEditing,
            ),

            const SizedBox(height: 20),

            /// Email
            buildLabel("Email Address"),

            buildTextField(
              controller: emailController,
              icon: Icons.email_outlined,
              enabled: isEditing,
            ),

            const SizedBox(height: 20),

            /// Contact Number
            buildLabel("Contact Number"),

            buildTextField(
              controller: contactController,
              icon: Icons.phone_outlined,
              enabled: isEditing,
            ),

            const SizedBox(height: 20),

            /// Role Dropdown
            buildLabel("Role"),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedRole,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),

                  items: roles.map((role) {
                    return DropdownMenuItem(value: role, child: Text(role));
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

            const SizedBox(height: 50),

            /// Save Button
            if (isEditing)
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing = false;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Profile Updated Successfully"),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: const Text(
                    "Save Changes",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
          ],
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
  }) {
    return TextField(
      controller: controller,
      enabled: enabled,

      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xffBE8A3D)),

        filled: true,
        fillColor: enabled ? Colors.white : Colors.grey.shade100,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
