// import 'package:field_service_app/utils/images.dart';
// import 'package:flutter/material.dart';

// class JobManagementScreen extends StatefulWidget {
//   const JobManagementScreen({super.key});

//   @override
//   State<JobManagementScreen> createState() => _JobManagementScreenState();
// }

// class _JobManagementScreenState extends State<JobManagementScreen> {
//   List<Map<String, dynamic>> jobs = [
//     {
//       "customer": "Alex Johnson",
//       "service": "AC Installation",
//       "time": "09:00 AM",
//       "status": "Pending",
//       "notes": "",
//     },
//     {
//       "customer": "Smith David",
//       "service": "Electrical Repair",
//       "time": "11:30 AM",
//       "status": "Accepted",
//       "notes": "",
//     },
//     {
//       "customer": "Robert Lee",
//       "service": "Machine Inspection",
//       "time": "02:00 PM",
//       "status": "Completed",
//       "notes": "Inspection completed successfully.",
//     },
//   ];

//   void updateStatus(int index, String status) {
//     setState(() {
//       jobs[index]["status"] = status;
//     });
//   }

//   void addNotes(int index) {
//     TextEditingController noteController = TextEditingController(
//       text: jobs[index]["notes"],
//     );

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Service Notes"),
//         content: TextField(
//           controller: noteController,
//           maxLines: 4,
//           decoration: const InputDecoration(
//             hintText: "Enter service notes",
//             border: OutlineInputBorder(),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 jobs[index]["notes"] = noteController.text;
//               });

//               Navigator.pop(context);
//             },
//             child: const Text("Save"),
//           ),
//         ],
//       ),
//     );
//   }

//   Color getStatusColor(String status) {
//     switch (status) {
//       case "Accepted":
//         return Colors.blue;

//       case "Completed":
//         return Colors.green;

//       case "Rejected":
//         return Colors.red;

//       default:
//         return Colors.orange;
//     }
//   }


// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.transparent,
//     appBar: AppBar(
//       title: const Text("Job Management", style: TextStyle(color: Colors.black,backgroundColor: Colors.transparent),),
//       centerTitle: true,
//       elevation: 0,
//     ),

//     body: Stack(
//       children: [

//         /// Background Image
//        Positioned.fill(child: Image.asset(AppImages.bg, fit: BoxFit.cover)),

//         /// Dark Overlay
//         Positioned.fill(
//           child: Container(
//             color: Colors.black.withOpacity(0.5),
//           ),
//         ),

//         /// Job List
//         ListView.builder(
//           padding: const EdgeInsets.all(16),
//           itemCount: jobs.length,
//           itemBuilder: (context, index) {
//             final job = jobs[index];

//             return Card(
//               elevation: 8,
//               color: Colors.white.withOpacity(0.25),
//               margin: const EdgeInsets.only(bottom: 18),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),

//               child: Padding(
//                 padding: const EdgeInsets.all(18),
//                 child: Column(
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start,
//                   children: [

//                     /// Service Title
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.home_repair_service,
//                           color: Colors.blue,
//                         ),

//                         const SizedBox(width: 10),

//                         Expanded(
//                           child: Text(
//                             job["service"],
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     const Divider(height: 25),

//                     Row(
//                       children: [
//                         const Icon(Icons.person),
//                         const SizedBox(width: 8),
//                         Text(
//                           "Customer: ${job["customer"]}",
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 8),

//                     Row(
//                       children: [
//                         const Icon(Icons.access_time),
//                         const SizedBox(width: 8),
//                         Text(
//                           "Time: ${job["time"]}",
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 15),

//                     Container(
//                       padding:
//                           const EdgeInsets.symmetric(
//                         horizontal: 15,
//                         vertical: 8,
//                       ),
//                       decoration: BoxDecoration(
//                         color: getStatusColor(
//                           job["status"],
//                         ).withOpacity(0.15),
//                         borderRadius:
//                             BorderRadius.circular(25),
//                       ),
//                       child: Text(
//                         job["status"],
//                         style: TextStyle(
//                           color: getStatusColor(
//                             job["status"],
//                           ),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 15),

//                     // Keep your existing buttons here
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     ),
//   );
// }
// }

//7878878778787878788788787878788878887887878787878787877887787888787788787878787878787878787878787877878787878788787787878
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:field_service_app/utils/images.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class TaskManagementScreen extends StatefulWidget {
//   const TaskManagementScreen({super.key});

//   @override
//   State<TaskManagementScreen> createState() => _TaskManagementScreenState();
// }

// class _TaskManagementScreenState extends State<TaskManagementScreen> {
//   String? uid;

//   @override
//   void initState() {
//     super.initState();
//     loadUid();
//   }

//   /// Load logged-in technician UID from SharedPreferences
//   Future<void> loadUid() async {
//     final prefs = await SharedPreferences.getInstance();

//     setState(() {
//       uid = prefs.getString('uid');
//     });
//   }

//   /// Update Task Status
  // Future<void> updateTaskStatus(String taskId, String status) async {
  //   await FirebaseFirestore.instance.collection('tasks').doc(taskId).update({
  //     'status': status,
  //   });

//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text("Task $status successfully")));
//   }

//   /// Status Color
//   Color getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case "accepted":
//         return Colors.green;

//       case "rejected":
//         return Colors.red;

//       case "assigned":
//         return Colors.orange;

//       default:
//         return Colors.grey;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     /// Current Date Format -> 2026-6-27
//     final todayDate =
//         "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";

//     return Scaffold(
//       extendBodyBehindAppBar: true,

//       appBar: AppBar(
//         title: const Text(
//           "Today's Tasks",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),

//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(AppImages.bg),
//             fit: BoxFit.cover,
//           ),
//         ),

//         child: Container(
//           color: Colors.black.withOpacity(0.6),

//           child: SafeArea(
//             child: uid == null
//                 ? const Center(child: CircularProgressIndicator())
//                 /// TASK STREAM
//                 : StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection('tasks')
//                         /// Logged in technician tasks only
//                         .where('technicianId', isEqualTo: uid)
//                         /// Today's tasks only
//                         .where('date', isEqualTo: todayDate)
//                         .snapshots(),

//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(child: CircularProgressIndicator());
//                       }

//                       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                         return const Center(
//                           child: Text(
//                             "No Tasks For Today",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         );
//                       }

//                       final tasks = snapshot.data!.docs;

//                       return ListView.builder(
//                         padding: const EdgeInsets.all(16),

//                         itemCount: tasks.length,

//                         itemBuilder: (context, index) {
//                           final task = tasks[index];

//                           final data = task.data() as Map<String, dynamic>;

//                           final status = data['status'] ?? 'assigned';

//                           return Card(
//                             elevation: 8,
//                             margin: const EdgeInsets.only(bottom: 16),

//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(18),
//                             ),

//                             child: Padding(
//                               padding: const EdgeInsets.all(16),

//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,

//                                 children: [
//                                   /// Issue
//                                   Row(
//                                     children: [
//                                       const Icon(
//                                         Icons.report_problem,
//                                         color: Colors.red,
//                                       ),

//                                       const SizedBox(width: 10),

//                                       Expanded(
//                                         child: Text(
//                                           data['issue'] ?? 'No Issue',

//                                           style: const TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),

//                                   const Divider(height: 25),

//                                   /// Technician Name
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.person),

//                                       const SizedBox(width: 8),

//                                       Expanded(
//                                         child: Text(
//                                           "Technician: ${data['technicianName'] ?? ''}",
//                                         ),
//                                       ),
//                                     ],
//                                   ),

//                                   const SizedBox(height: 8),

//                                   /// Role
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.work),

//                                       const SizedBox(width: 8),

//                                       Text(
//                                         "Role: ${data['technicianRole'] ?? ''}",
//                                       ),
//                                     ],
//                                   ),

//                                   const SizedBox(height: 8),

//                                   /// Date
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.calendar_today),

//                                       const SizedBox(width: 8),

//                                       Text("Date: ${data['date'] ?? ''}"),
//                                     ],
//                                   ),

//                                   const SizedBox(height: 15),

//                                   /// Status Badge
//                                   Align(
//                                     alignment: Alignment.centerLeft,

//                                     child: Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 14,
//                                         vertical: 7,
//                                       ),

//                                       decoration: BoxDecoration(
//                                         color: getStatusColor(
//                                           status,
//                                         ).withOpacity(0.15),

//                                         borderRadius: BorderRadius.circular(30),
//                                       ),

//                                       child: Text(
//                                         status.toUpperCase(),

//                                         style: TextStyle(
//                                           color: getStatusColor(status),

//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   const SizedBox(height: 20),

//                                   /// Buttons
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: ElevatedButton.icon(
//                                           icon: const Icon(Icons.check),

//                                           label: const Text("Accept"),

//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.green,
//                                           ),

//                                           onPressed: status == 'accepted'
//                                               ? null
//                                               : () => updateTaskStatus(
//                                                   task.id,
//                                                   'accepted',
//                                                 ),
//                                         ),
//                                       ),

//                                       const SizedBox(width: 12),

//                                       Expanded(
//                                         child: ElevatedButton.icon(
//                                           icon: const Icon(Icons.close),

//                                           label: const Text("Reject"),

//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.red,
//                                           ),

//                                           onPressed: status == 'rejected'
//                                               ? null
//                                               : () => updateTaskStatus(
//                                                   task.id,
//                                                   'rejected',
//                                                 ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:field_service_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:field_service_app/utils/images.dart';

class TaskManagementScreen extends StatefulWidget {
  const TaskManagementScreen({super.key});

  @override
  State<TaskManagementScreen> createState() => _TaskManagementScreenState();
}

class _TaskManagementScreenState extends State<TaskManagementScreen> {
  String? uid;

  @override
  void initState() {
    super.initState();
    loadUid();
  }

  Future<void> loadUid() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString('uid');
    });
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "accepted":
        return Colors.green;
      case "rejected":
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    String todayDate =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";

    return Scaffold(
      appBar: AppBar(title: const Text("Assigned Tasks"), centerTitle: true),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bg),
            fit: BoxFit.cover,
          ),
        ),

        child: uid == null
            ? const Center(child: CircularProgressIndicator())
            : StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('tasks')
                    .where('technicianId', isEqualTo: uid)
                    .where('status', isEqualTo: 'assigned')
                    .where('date', isEqualTo: todayDate)
                    .snapshots(),

                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Assigned Tasks",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    );
                  }

                  final tasks = snapshot.data!.docs;

                  return ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: tasks.length,

                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      final data = task.data() as Map<String, dynamic>;

                    return Card(
                        elevation: 8,
                        color: Colors.white.withOpacity(0.95),
                        margin: const EdgeInsets.only(bottom: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(18),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// ISSUE TITLE
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.report_problem,
                                      color: Colors.red,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Text(
                                      data['issue'] ?? "No Issue",
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 18),

                              /// TECHNICIAN
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person,
                                    color: Colors.blueGrey,
                                  ),

                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: Text(
                                      "Technician: ${data['technicianName'] ?? ''}",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              /// ROLE
                              Row(
                                children: [
                                  const Icon(
                                    Icons.work_outline,
                                    color: Colors.orange,
                                  ),

                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: Text(
                                      "Role: ${data['technicianRole'] ?? ''}",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              /// DATE
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: Colors.green,
                                  ),

                                  const SizedBox(width: 10),

                                  Text(
                                    "Date: ${data['date'] ?? ''}",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 18),

                              /// STATUS BADGE
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 8,
                                ),

                                decoration: BoxDecoration(
                                  color: getStatusColor(
                                    data['status'],
                                  ).withOpacity(0.15),

                                  borderRadius: BorderRadius.circular(30),
                                ),

                                child: Text(
                                  (data['status'] ?? 'assigned').toUpperCase(),

                                  style: TextStyle(
                                    color: getStatusColor(data['status']),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              /// BUTTONS
                              if (data['status'] == 'assigned')
                                Row(
                                  children: [
                                    /// ACCEPT
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        icon: const Icon(Icons.check),
                                        label: const Text("Accept"),

                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),

                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),

                                        onPressed: () => updateTaskStatus(
                                          task.id,
                                          'accepted',
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 12),

                                    /// REJECT
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        icon: const Icon(Icons.close),
                                        label: const Text("Reject"),

                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),

                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),

                                        onPressed: () => updateTaskStatus(
                                          task.id,
                                          'rejected',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }


  Future<void> updateTaskStatus(String taskId, String status) async {
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).update({
      'status': status,
  
    });
     Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => HomeScreen())));
  }
}

class AcceptedTasksScreen extends StatefulWidget {
  const AcceptedTasksScreen({super.key});

  @override
  State<AcceptedTasksScreen> createState() => _AcceptedTasksScreenState();
}

class _AcceptedTasksScreenState extends State<AcceptedTasksScreen> {
  String? uid;

  @override
  void initState() {
    super.initState();
    loadUid();
  }

  Future<void> loadUid() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      uid = prefs.getString('uid');
    });
  }

  @override
  Widget build(BuildContext context) {
    String todayDate =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";

    return Scaffold(
      appBar: AppBar(title: const Text("Accepted Tasks"), centerTitle: true),

      body:
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bg),
            fit: BoxFit.cover,
          ),
        ),
child: 
      
       uid == null
          ? const Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('tasks')
                  .where('technicianId', isEqualTo: uid)
                  .where('status', isEqualTo: 'accepted')
                  .where('date', isEqualTo: todayDate)
                  .snapshots(),

              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No Accepted Tasks"));
                }

                final tasks = snapshot.data!.docs;

                return ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: tasks.length,

                  itemBuilder: (context, index) {
                    final data = tasks[index].data() as Map<String, dynamic>;

                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.only(bottom: 15),

                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(Icons.check, color: Colors.white),
                        ),

                        title: Text(
                          data['issue'] ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Technician: ${data['technicianName']}"),
                            Text("Role: ${data['technicianRole']}"),
                            Text("Date: ${data['date']}"),
                          ],
                        ),

                        trailing: Chip(
                          backgroundColor: Colors.green.shade100,
                          label: const Text(
                            "ACCEPTED",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
      )
    );
  }
}
