// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class TechniciansScreen extends StatefulWidget {
//   const TechniciansScreen({super.key});

//   @override
//   State<TechniciansScreen> createState() => _TechniciansScreenState();
// }

// class _TechniciansScreenState extends State<TechniciansScreen> {
//   Future<void> updateStatus(String uid, String status) async {
//     try {
//       await FirebaseFirestore.instance.collection('users').doc(uid).update({
//         'status': status,
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Technician $status successfully")),
//       );
//     } catch (e) {
//       print(e);
//     }
//   }

//   Color getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'accepted':
//         return Colors.green;

//       case 'rejected':
//         return Colors.red;

//       default:
//         return Colors.orange;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Technicians"), centerTitle: true),

//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('users')
//             .where('role', isEqualTo: 'Technician')
//             .snapshots(),

//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(
//               child: Text(
//                 "No Technicians Found",
//                 style: TextStyle(fontSize: 18),
//               ),
//             );
//           }

//           final technicians = snapshot.data!.docs;

//           return ListView.builder(
//             padding: const EdgeInsets.all(15),
//             itemCount: technicians.length,

//             itemBuilder: (context, index) {
//               final tech = technicians[index];

//               String status = tech['status'] ?? 'pending';

//               return Card(
//                 margin: const EdgeInsets.only(bottom: 15),

//                 elevation: 4,

//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),

//                 child: Padding(
//                   padding: const EdgeInsets.all(15),

//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 28,
//                             backgroundColor: Colors.blue.shade100,

//                             child: const Icon(Icons.person, size: 30),
//                           ),

//                           const SizedBox(width: 15),

//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,

//                               children: [
//                                 Text(
//                                   tech['fullName'] ?? 'No Name',

//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                   ),
//                                 ),

//                                 const SizedBox(height: 5),

//                                 Text("Email: ${tech['email'] ?? ''}"),

//                                 Text("Phone: ${tech['contact'] ?? ''}"),

//                                 Text("Role: ${tech['role']}"),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 15),

//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 6,
//                             ),

//                             decoration: BoxDecoration(
//                               color: getStatusColor(status),

//                               borderRadius: BorderRadius.circular(20),
//                             ),

//                             child: Text(
//                               status.toUpperCase(),

//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),

//                           const Spacer(),

//                           /// Accept Button
//                           if (status == 'pending')
//                             ElevatedButton(
//                               onPressed: () {
//                                 updateStatus(tech.id, 'accepted');
//                               },

//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.green,
//                               ),

//                               child: const Text(
//                                 "Accept",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),

//                           const SizedBox(width: 8),

//                           /// Reject Button
//                           if (status == 'pending')
//                             ElevatedButton(
//                               onPressed: () {
//                                 updateStatus(tech.id, 'rejected');
//                               },

//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.red,
//                               ),

//                               child: const Text(
//                                 "Reject",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),

//                           /// Assign Button
//                           if (status == 'accepted')
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Navigate to Assign Task Screen

//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //     builder: (_) =>
//                                 //         AssignTaskScreen(
//                                 //       technicianId:
//                                 //           tech.id,
//                                 //       technicianName:
//                                 //           tech[
//                                 //               'fullName'],
//                                 //     ),
//                                 //   ),
//                                 // );
//                               },

//                               child: const Text("Assign Task"),
//                             ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class TechniciansScreen extends StatefulWidget {
//   const TechniciansScreen({super.key});

//   @override
//   State<TechniciansScreen> createState() => _TechniciansScreenState();
// }

// class _TechniciansScreenState extends State<TechniciansScreen> {
//   Future<void> updateStatus(String uid, String status) async {
//     try {
//       await FirebaseFirestore.instance.collection('users').doc(uid).update({
//         'status': status,
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Technician $status successfully")),
//       );
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

//   void showTechnicianDetails(DocumentSnapshot tech) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Technician Details"),

//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Name: ${tech['fullName'] ?? ''}"),

//               const SizedBox(height: 10),

//               Text("Email: ${tech['email'] ?? ''}"),

//               const SizedBox(height: 10),

//               Text("Phone: ${tech['contact'] ?? ''}"),

//               const SizedBox(height: 10),

//               Text("Role: ${tech['role'] ?? ''}"),

//               const SizedBox(height: 10),

//               Text("Status: ${tech['status'] ?? ''}"),
//             ],
//           ),

//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },

//               child: const Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Technicians"), centerTitle: true),

//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),

//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text("No Users Found"));
//           }

//           // Get all technicians
//           final allTechnicians = snapshot.data!.docs.where((doc) {
//             final data = doc.data() as Map<String, dynamic>;

//             return data['role'] == 'Technician';
//           }).toList();

//           // Pending technicians
//           final pendingTechnicians = allTechnicians.where((doc) {
//             final data = doc.data() as Map<String, dynamic>;

//             return data['status'] == 'pending';
//           }).toList();

//           // Accepted technicians
//           final acceptedTechnicians = allTechnicians.where((doc) {
//             final data = doc.data() as Map<String, dynamic>;

//             return data['status'] == 'accepted' || data['status'] == 'accept';
//           }).toList();

//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16),

//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,

//               children: [
//                 /// Pending Requests
//                 const Text(
//                   "Pending Requests",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),

//                 const SizedBox(height: 10),

//                 if (pendingTechnicians.isEmpty)
//                   const Card(
//                     child: Padding(
//                       padding: EdgeInsets.all(15),
//                       child: Text("No Pending Requests"),
//                     ),
//                   ),

//                 ...pendingTechnicians.map((tech) {
//                   return Card(
//                     margin: const EdgeInsets.only(bottom: 10),

//                     child: ListTile(
//                       leading: const CircleAvatar(child: Icon(Icons.person)),

//                       title: Text(tech['fullName'] ?? 'No Name'),

//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,

//                         children: [
//                           IconButton(
//                             icon: const Icon(
//                               Icons.visibility,
//                               color: Colors.blue,
//                             ),

//                             onPressed: () {
//                               showTechnicianDetails(tech);
//                             },
//                           ),

//                           IconButton(
//                             icon: const Icon(
//                               Icons.check_circle,
//                               color: Colors.green,
//                             ),

//                             onPressed: () {
//                               updateStatus(tech.id, 'accepted');
//                             },
//                           ),

//                           IconButton(
//                             icon: const Icon(Icons.cancel, color: Colors.red),

//                             onPressed: () {
//                               updateStatus(tech.id, 'rejected');
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),

//                 const SizedBox(height: 30),

//                 const Divider(),

//                 const SizedBox(height: 20),

//                 /// Accepted Technicians
//                 const Text(
//                   "Accepted Technicians",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),

//                 const SizedBox(height: 10),

//                 if (acceptedTechnicians.isEmpty)
//                   const Card(
//                     child: Padding(
//                       padding: EdgeInsets.all(15),
//                       child: Text("No Accepted Technicians"),
//                     ),
//                   ),

//                 ...acceptedTechnicians.map((tech) {
//                   return Card(
//                     margin: const EdgeInsets.only(bottom: 10),

//                     child: ListTile(
//                       leading: const CircleAvatar(child: Icon(Icons.person)),

//                       title: Text(tech['fullName'] ?? ''),

//                       subtitle: Text(tech['email'] ?? ''),

//                       onTap: () {
//                         showTechnicianDetails(tech);
//                       },

//                       trailing: ElevatedButton(
//                         onPressed: () {
//                           // Navigate to Assign Task Screen
//                         },

//                         child: const Text("Assign Task"),
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:field_service_app/utils/images.dart';
// import 'package:flutter/material.dart';

// class TechniciansScreen extends StatefulWidget {
//   const TechniciansScreen({super.key});

//   @override
//   State<TechniciansScreen> createState() => _TechniciansScreenState();
// }

// class _TechniciansScreenState extends State<TechniciansScreen> {
//   /// Update Status
//   Future<void> updateStatus(String uid, String status) async {
//     try {
//       await FirebaseFirestore.instance.collection('users').doc(uid).update({
//         'status': status,
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Technician $status successfully")),
//       );
//     } catch (e) {
//       print("Error updating status: $e");
//     }
//   }

//   /// Show Technician Details
//   void showTechnicianDetails(DocumentSnapshot tech) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Technician Details"),

//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,

//             children: [
//               Text("Name: ${tech['fullName'] ?? 'N/A'}"),

//               const SizedBox(height: 10),

//               Text("Email: ${tech['email'] ?? 'N/A'}"),

//               const SizedBox(height: 10),

//               Text("Contact: ${tech['contact'] ?? 'N/A'}"),

//               const SizedBox(height: 10),

//               Text("Role: ${tech['role'] ?? 'N/A'}"),

//               const SizedBox(height: 10),

//               Text("Status: ${tech['status'] ?? 'N/A'}"),
//             ],
//           ),

//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },

//               child: const Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// @override
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

//           /// White Overlay
//           Container(color: Colors.white.withOpacity(0.25)),

//           SafeArea(
//             child: Column(
//               children: [
//                 /// Custom AppBar
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 10,
//                   ),

//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const Icon(Icons.arrow_back, color: Colors.black),
//                       ),

//                       const Expanded(
//                         child: Text(
//                           "Technicians",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),

//                       const SizedBox(width: 48),
//                     ],
//                   ),
//                 ),

//                 /// Body
//                 Expanded(
//                   child: StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection('users')
//                         .snapshots(),

//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(child: CircularProgressIndicator());
//                       }

//                       if (snapshot.hasError) {
//                         return Center(child: Text("Error: ${snapshot.error}"));
//                       }

//                       if (!snapshot.hasData) {
//                         return const Center(child: Text("No Data Found"));
//                       }

//                       /// Filter only technicians
//                       final allTechnicians = snapshot.data!.docs.where((doc) {
//                         final data = doc.data() as Map<String, dynamic>;

//                         String role = (data['role'] ?? '')
//                             .toString()
//                             .trim()
//                             .toLowerCase();

//                         return role == 'technician';
//                       }).toList();

//                       if (allTechnicians.isEmpty) {
//                         return const Center(
//                           child: Text(
//                             "No Technicians Found",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         );
//                       }

//                       final pendingTechnicians = allTechnicians.where((doc) {
//                         final data = doc.data() as Map<String, dynamic>;

//                         String status = (data['status'] ?? '')
//                             .toString()
//                             .trim()
//                             .toLowerCase();

//                         return status == 'pending';
//                       }).toList();

//                       final acceptedTechnicians = allTechnicians.where((doc) {
//                         final data = doc.data() as Map<String, dynamic>;

//                         String status = (data['status'] ?? '')
//                             .toString()
//                             .trim()
//                             .toLowerCase();

//                         return status == 'accepted' || status == 'accept';
//                       }).toList();

//                       return SingleChildScrollView(
//                         padding: const EdgeInsets.all(16),

//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,

//                           children: [
//                             /// Pending Section
//                             const Text(
//                               "Pending Requests",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),

//                             const SizedBox(height: 10),

//                             if (pendingTechnicians.isEmpty)
//                               Card(
//                                 color: Colors.white.withOpacity(0.9),
//                                 child: const Padding(
//                                   padding: EdgeInsets.all(15),
//                                   child: Text("No Pending Requests"),
//                                 ),
//                               ),

//                             ...pendingTechnicians.map((tech) {
//                               return Card(
//                                 color: Colors.white.withOpacity(0.9),

//                                 margin: const EdgeInsets.only(bottom: 10),

//                                 child: ListTile(
//                                   leading: const CircleAvatar(
//                                     child: Icon(Icons.person),
//                                   ),

//                                   title: Text(tech['fullName'] ?? 'No Name'),

//                                   trailing: Row(
//                                     mainAxisSize: MainAxisSize.min,

//                                     children: [
//                                       IconButton(
//                                         icon: const Icon(
//                                           Icons.visibility,
//                                           color: Colors.blue,
//                                         ),

//                                         onPressed: () {
//                                           showTechnicianDetails(tech);
//                                         },
//                                       ),

//                                       IconButton(
//                                         icon: const Icon(
//                                           Icons.check_circle,
//                                           color: Colors.green,
//                                         ),

//                                         onPressed: () {
//                                           updateStatus(tech.id, 'accepted');
//                                         },
//                                       ),

//                                       IconButton(
//                                         icon: const Icon(
//                                           Icons.cancel,
//                                           color: Colors.red,
//                                         ),

//                                         onPressed: () {
//                                           updateStatus(tech.id, 'rejected');
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             }),

//                             const SizedBox(height: 30),

//                             const Divider(),

//                             const SizedBox(height: 20),

//                             const Text(
//                               "Accepted Technicians",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),

//                             const SizedBox(height: 10),

//                             if (acceptedTechnicians.isEmpty)
//                               Card(
//                                 color: Colors.white.withOpacity(0.9),
//                                 child: const Padding(
//                                   padding: EdgeInsets.all(15),
//                                   child: Text("No Accepted Technicians"),
//                                 ),
//                               ),

//                             ...acceptedTechnicians.map((tech) {
//                               return Card(
//                                 color: Colors.white.withOpacity(0.9),

//                                 margin: const EdgeInsets.only(bottom: 10),

//                                 child: ListTile(
//                                   leading: const CircleAvatar(
//                                     child: Icon(Icons.person),
//                                   ),

//                                   title: Text(tech['fullName'] ?? ''),

//                                   subtitle: Text(tech['email'] ?? ''),

//                                   onTap: () {
//                                     showTechnicianDetails(tech);
//                                   },

//                                   trailing: ElevatedButton(
//                                     onPressed: () {},

//                                     child: const Text("Assign Task"),
//                                   ),
//                                 ),
//                               );
//                             }),
//                           ],
//                         ),
//                       );
//                     },
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:field_service_app/adminwork/assign_task.dart';
import 'package:field_service_app/utils/images.dart';
import 'package:flutter/material.dart';

class TechniciansScreen extends StatefulWidget {
  const TechniciansScreen({super.key});

  @override
  State<TechniciansScreen> createState() => _TechniciansScreenState();
}

class _TechniciansScreenState extends State<TechniciansScreen> {
  /// Update Status
  Future<void> updateStatus(String uid, String status) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'status': status,
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("User $status successfully")));
    } catch (e) {
      print("Error updating status: $e");
    }
  }

  /// Show User Details
  void showUserDetails(DocumentSnapshot user) {
    final data = user.data() as Map<String, dynamic>;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("User Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: ${data['fullName'] ?? 'N/A'}"),

              const SizedBox(height: 10),

              Text("Email: ${data['email'] ?? 'N/A'}"),

              const SizedBox(height: 10),

              Text("Contact: ${data['contact'] ?? 'N/A'}"),

              const SizedBox(height: 10),

              Text("Role: ${data['role'] ?? 'N/A'}"),

              const SizedBox(height: 10),

              Text("Status: ${data['status'] ?? 'N/A'}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  /// Reusable Accepted Section
  Widget buildRoleSection(String title, List<DocumentSnapshot> users) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        if (users.isEmpty)
          Card(
            color: Colors.white.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text("No $title"),
            ),
          ),

        ...users.map((user) {
          final data = user.data() as Map<String, dynamic>;

          return Card(
            color: Colors.white.withOpacity(0.9),
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),

              title: Text(data['fullName'] ?? ''),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['email'] ?? ''),
                  Text("Role: ${data['role'] ?? 'N/A'}"),
                ],
              ),

              onTap: () {
                showUserDetails(user);
              },

              trailing: ElevatedButton(
                onPressed: () {
                  // Assign Task Code Here
                 AssignTaskDialog.show(context, user, assignTask);
                },
                child: const Text("Assign Task"),
              ),
            ),
          );
        }),

        const SizedBox(height: 30),
      ],
    );
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
            child: Column(
              children: [
                /// App Bar
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                      ),

                      const Expanded(
                        child: Text(
                          "Service Requests",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                /// Body
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .snapshots(),

                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      }

                      if (!snapshot.hasData) {
                        return const Center(child: Text("No Data Found"));
                      }

                      /// Get All Users Except None
                      final allUsers = snapshot.data!.docs.where((doc) {
                        final data = doc.data() as Map<String, dynamic>;

                        String role = (data['role'] ?? '')
                            .toString()
                            .trim()
                            .toLowerCase();

                        return role.isNotEmpty && role != 'none';
                      }).toList();

                      /// Pending Users
                      final pendingUsers = allUsers.where((doc) {
                        final data = doc.data() as Map<String, dynamic>;

                        String status = (data['status'] ?? '')
                            .toString()
                            .trim()
                            .toLowerCase();

                        return status == 'pending';
                      }).toList();

                      /// Accepted Users
                      final acceptedUsers = allUsers.where((doc) {
                        final data = doc.data() as Map<String, dynamic>;

                        String status = (data['status'] ?? '')
                            .toString()
                            .trim()
                            .toLowerCase();

                        return status == 'accepted' || status == 'accept';
                      }).toList();

                      /// Role Wise Accepted Users

                      // final acceptedTechnicians = acceptedUsers.where((doc) {
                      //   return (doc['role'] ?? '')
                      //           .toString()
                      //           .trim()
                      //           .toLowerCase() ==
                      //       'technician';
                      // }).toList();

                      final acceptedSweepers = acceptedUsers.where((doc) {
                        return (doc['role'] ?? '')
                                .toString()
                                .trim()
                                .toLowerCase() ==
                            'sweeper';
                      }).toList();

                      final acceptedElectricians = acceptedUsers.where((doc) {
                        return (doc['role'] ?? '')
                                .toString()
                                .trim()
                                .toLowerCase() ==
                            'electricians';
                      }).toList();

                      final acceptedPlumbers = acceptedUsers.where((doc) {
                        return (doc['role'] ?? '')
                                .toString()
                                .trim()
                                .toLowerCase() ==
                            'plumbers';
                      }).toList();

                      final acceptedISPs = acceptedUsers.where((doc) {
                        return (doc['role'] ?? '')
                                .toString()
                                .trim()
                                .toLowerCase() ==
                            'internet service providers';
                      }).toList();

                      final acceptedACCompanies = acceptedUsers.where((doc) {
                        return (doc['role'] ?? '')
                                .toString()
                                .trim()
                                .toLowerCase() ==
                            'ac repair companies';
                      }).toList();

                      final acceptedSupportCompanies = acceptedUsers.where((
                        doc,
                      ) {
                        return (doc['role'] ?? '')
                                .toString()
                                .trim()
                                .toLowerCase() ==
                            'technical support companies';
                      }).toList();

                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(16),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            /// Pending Requests
                            const Text(
                              "Pending Requests",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            if (pendingUsers.isEmpty)
                              Card(
                                color: Colors.white.withOpacity(0.9),
                                child: const Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text("No Pending Requests"),
                                ),
                              ),

                            ...pendingUsers.map((user) {
                              final data = user.data() as Map<String, dynamic>;

                              return Card(
                                color: Colors.white.withOpacity(0.9),

                                margin: const EdgeInsets.only(bottom: 10),

                                child: ListTile(
                                  leading: const CircleAvatar(
                                    child: Icon(Icons.person),
                                  ),

                                  title: Text(data['fullName'] ?? 'No Name'),

                                  subtitle: Text("Role: ${data['role']}"),

                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,

                                    children: [
                                      /// View
                                      IconButton(
                                        icon: const Icon(
                                          Icons.visibility,
                                          color: Colors.blue,
                                        ),

                                        onPressed: () {
                                          showUserDetails(user);
                                        },
                                      ),

                                      /// Accept
                                      IconButton(
                                        icon: const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),

                                        onPressed: () {
                                          updateStatus(user.id, 'accepted');
                                        },
                                      ),

                                      /// Reject
                                      IconButton(
                                        icon: const Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        ),

                                        onPressed: () {
                                          updateStatus(user.id, 'rejected');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),

                            const SizedBox(height: 30),

                            const Divider(),

                            const SizedBox(height: 20),

                            /// Accepted Users By Roles
                            // buildRoleSection(
                            //   " Technicians",
                            //   acceptedTechnicians,
                            // ),

                            buildRoleSection(
                              " Sweepers",
                              acceptedSweepers,
                            ),

                            buildRoleSection(
                              " Electricians",
                              acceptedElectricians,
                            ),

                            buildRoleSection(
                              " Plumbers",
                              acceptedPlumbers,
                            ),

                            buildRoleSection(
                              " Internet Service Providers",
                              acceptedISPs,
                            ),

                            buildRoleSection(
                              " AC Repair Companies",
                              acceptedACCompanies,
                            ),

                            buildRoleSection(
                              " Technical Support Companies",
                              acceptedSupportCompanies,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


// Future<void> assignTask(
//   DocumentSnapshot user,
//   String service,
//   String issue,
//   String date,
// ) async {
//   try {
//     await FirebaseFirestore.instance.collection('tasks').add({
//       'technicianId': user.id,
//       'technicianName': user['fullName'] ?? '',
//       'serviceType': service,
//       'issue': issue,
//       'date': date,
//       'status': 'assigned',
//       'createdAt': FieldValue.serverTimestamp(),
//     });

//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(const SnackBar(content: Text("Task Assigned Successfully")));
//   } catch (e) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text("Error: $e")));
//   }
// }
// }
Future<void> assignTask(
  DocumentSnapshot user,
  String issue,
  String date,
) async {
  try {
    await FirebaseFirestore.instance.collection('tasks').add({
      'technicianId': user.id, // UID
      'technicianName': user['fullName'] ?? '',
      'technicianRole': user['role'] ?? '', // ROLE USED HERE
      'issue': issue,
      'date': date,
      'status': 'assigned',
      'createdAt': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Task Assigned Successfully")),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: $e")),
    );
  }
}
}