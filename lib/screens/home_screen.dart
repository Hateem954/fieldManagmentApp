// import 'package:field_service_app/screens/customer_information_screen.dart';
// import 'package:field_service_app/screens/notification_screen.dart';
// import 'package:field_service_app/screens/profile_screen.dart';
// import 'package:field_service_app/screens/service_report_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:field_service_app/screens/job_managment_screen.dart';
// import 'package:field_service_app/utils/images.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const JobManagementScreen()),
//       );
//     }
//     if (index ==2 ) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ServiceReportScreen()),
//       );
//     }
//      if (index == 3) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const CustomerInformationScreen()),
//       );
//     }
//        if (index == 4) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const ProfileScreen(),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: const Color(0xff10213D),
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.assignment_outlined),
//             label: "Jobs",
//           ),
//             BottomNavigationBarItem(
//             icon: Icon(Icons.report_outlined),
//             label: "service",
//           ),
//            BottomNavigationBarItem(
//             icon: Icon(Icons.person_pin),
//             label: "customer info",
//           ),
          
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: "Profile",
//           ),
//         ],
//       ),
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
//           Container(color: Colors.white.withOpacity(.15)),

//           SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// Header
//                   Row(
//                     children: [
//                       const CircleAvatar(
//                         radius: 28,
//                         child: Icon(Icons.person, size: 30),
//                       ),
//                       const SizedBox(width: 15),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text(
//                             "Welcome Back",
//                             style: TextStyle(color: Colors.grey, fontSize: 14),
//                           ),
//                           Text(
//                             "John Doe",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Spacer(),
//                       IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const NotificationScreen(),
//                             ),
//                           );
//                         },
//                         icon: const Icon(Icons.notifications_none, size: 30),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 30),

//                   /// Search
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: "Search jobs...",
//                       prefixIcon: const Icon(Icons.search),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(.9),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   const Text(
//                     "Dashboard",
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),

//                   const SizedBox(height: 20),

//                   GridView.count(
//                     crossAxisCount: 2,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     crossAxisSpacing: 15,
//                     mainAxisSpacing: 15,
//                     childAspectRatio: 1.15,
//                     children: [
//                       _dashboardCard(
//                         "Assigned Jobs",
//                         "12",
//                         Icons.assignment_outlined,
//                       ),
//                       _dashboardCard(
//                         "Completed Jobs",
//                         "08",
//                         Icons.check_circle_outline,
//                       ),
//                       _dashboardCard(
//                         "Pending Jobs",
//                         "03",
//                         Icons.pending_actions_outlined,
//                       ),
//                       _dashboardCard(
//                         "Service Stats",
//                         "92%",
//                         Icons.bar_chart_outlined,
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 30),

//                   const Text(
//                     "Daily Activity Overview",
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),

//                   const SizedBox(height: 15),

//                   Container(
//                     padding: const EdgeInsets.all(18),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(.9),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       children: [
//                         _activityTile("Jobs Assigned", "5", Icons.assignment),
//                         const Divider(),
//                         _activityTile(
//                           "Jobs Completed",
//                           "3",
//                           Icons.check_circle,
//                         ),
//                         const Divider(),
//                         _activityTile(
//                           "Hours Worked",
//                           "7.5 Hrs",
//                           Icons.access_time,
//                         ),
//                         const Divider(),
//                         _activityTile(
//                           "Customer Visits",
//                           "4",
//                           Icons.people_outline,
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   const Text(
//                     "Assigned Jobs",
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),

//                   const SizedBox(height: 15),

//                   _taskCard("AC Installation", "09:00 AM", "Status: Assigned"),

//                   _taskCard("Electrical Repair", "11:30 AM", "Status: Pending"),

//                   _taskCard(
//                     "Machine Inspection",
//                     "02:00 PM",
//                     "Status: Completed",
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _dashboardCard(String title, String value, IconData icon) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.9),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 35, color: const Color(0xff10213D)),
//           const SizedBox(height: 12),
//           Text(
//             value,
//             style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           Text(title, textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }

//   Widget _activityTile(String title, String value, IconData icon) {
//     return Row(
//       children: [
//         CircleAvatar(
//           backgroundColor: Colors.grey.shade200,
//           child: Icon(icon, color: const Color(0xff10213D)),
//         ),
//         const SizedBox(width: 15),
//         Expanded(
//           child: Text(
//             title,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//         ),
//         Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
//       ],
//     );
//   }

//   Widget _taskCard(String title, String time, String status) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 15),
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.9),
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Row(
//         children: [
//           const CircleAvatar(radius: 25, child: Icon(Icons.work_outline)),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 17,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(status, style: const TextStyle(color: Colors.grey)),
//                 const SizedBox(height: 5),
//                 Text(time, style: const TextStyle(color: Colors.grey)),
//               ],
//             ),
//           ),
//           const Icon(Icons.arrow_forward_ios, size: 18),
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:field_service_app/adminwork/assign_task_screen.dart';
import 'package:field_service_app/adminwork/complete_reports_screen.dart';
import 'package:field_service_app/adminwork/reports_screen.dart';
import 'package:field_service_app/adminwork/technition_screen.dart';
import 'package:field_service_app/screens/customer_information_screen.dart';
import 'package:field_service_app/screens/task_managment_screen.dart';
import 'package:field_service_app/screens/notification_screen.dart';
import 'package:field_service_app/screens/profile_screen.dart';
import 'package:field_service_app/screens/service_report_screen.dart';
import 'package:field_service_app/screens/welcomw_screen.dart';
import 'package:field_service_app/utils/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String userRole = "Technician";
  String userName = "User";
  int assignedJobsCount = 0;
  int acceptedJobsCount = 0;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUserData();
    getAssignedJobsCount();
    getAcceptedJobsCount();
  }

Future<String?> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

  Future<int> getCompletedJobsCount() async {
    final uid = await getUid();

    if (uid == null) return 0;

    final snapshot = await FirebaseFirestore.instance
        .collection('service_reports')
        .where('status', isEqualTo: 'Completed')
        .where('technicianId', isEqualTo: uid)
        .get();

    return snapshot.docs.length;
  }
  Future<void> getUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? uid = prefs.getString('uid');

      if (uid == null) {
        setState(() => isLoading = false);
        return;
      }

      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        setState(() {
          userRole = data['role'] ?? "Technician";
          userName = data['fullName'] ?? "User";
        });
      }

      setState(() => isLoading = false);
    } catch (e) {
      print(e);
      setState(() => isLoading = false);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    /// TECHNICIAN

    /// ADMIN
    if (userRole == "Admin") {
      switch (index) {
        case 9:
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Manage Users Screen")));
          break;

        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) =>  TechniciansScreen()),
          );
          break;

        case 4:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ServiceReportScreen()),
          );
          break;

        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProfileScreen()),
          );
          break;
      }
    }
   else  {
      switch (index) {
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const TaskManagementScreen()),
          );
          break;

        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ServiceReportScreen()),
          );
          break;

        case 3:
       
          break;

        case 4:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProfileScreen()),
          );
          break;
      }
    }
  }
    /// USER
  //   else {
  //     switch (index) {
  //       case 1:
  //         ScaffoldMessenger.of(
  //           context,
  //         ).showSnackBar(const SnackBar(content: Text("My Requests Screen")));
  //         break;

  //       case 2:
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text("Service History Screen")),
  //         );
  //         break;

  //       case 3:
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (_) => const ProfileScreen()),
  //         );
  //         break;
  //     }
  //   }
  // }

  List<BottomNavigationBarItem> getBottomItems() {
    if (userRole == "Admin") {
      return const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.people_outline),
        //   label: "Users",
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.request_page),
          label: "Requests",
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.analytics_outlined),
        //   label: "Reports",
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ];
    }

    if (userRole == "User") {
      return const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.build_outlined),
          label: "Requests",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ];
    }

    /// Technician
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_outlined),
        label: "Jobs",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.report_outlined),
        label: "Service",
      ),
     
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: "Profile",
      ),
    ];
  }



  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      (route) => false,
    );
  }
  
// @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: Drawer(
//         child: SafeArea(
//           child: Column(
//             children: [
//               UserAccountsDrawerHeader(
//                 accountName: Text(userName),
//                 accountEmail: Text(userRole),
//                 currentAccountPicture: const CircleAvatar(
//                   child: Icon(Icons.person, size: 40),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.settings),
//                 title: const Text("Settings"),
//                 onTap: () => Navigator.pop(context),
//               ),
//               const Divider(),
//               ListTile(
//                 leading: const Icon(Icons.logout, color: Colors.red),
//                 title: const Text(
//                   "Logout",
//                   style: TextStyle(color: Colors.red),
//                 ),
//                 onTap: () => logout(context),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: const Color(0xff10213D),
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//         items: getBottomItems(),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: () => _scaffoldKey.currentState?.openDrawer(),
//                   child: const CircleAvatar(
//                     child: Icon(Icons.person, size: 30),
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Welcome Back",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     Text(
//                       userName,
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       userRole,
//                       style: const TextStyle(color: Colors.blueGrey),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 IconButton(
//                   icon: const Icon(Icons.notifications_none),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const NotificationScreen(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Dashboard",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisSpacing: 15,
//               mainAxisSpacing: 15,
//               childAspectRatio: 1.15,
//               children: getDashboardCards(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

@override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      key: _scaffoldKey,

      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(userName),
                accountEmail: Text(userRole),
                currentAccountPicture: const CircleAvatar(
                  child: Icon(Icons.person, size: 40),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pop(context);

                  // TODO: Navigate to Settings Screen
                },
              ),

              const Divider(),

              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () => logout(context),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff10213D),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: getBottomItems(),
      ),

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

          /// White Overlay
          Container(color: Colors.white.withOpacity(0.15)),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: const CircleAvatar(
                          radius: 28,
                          child: Icon(Icons.person, size: 30),
                        ),
                      ),

                      const SizedBox(width: 15),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome Back",
                            style: TextStyle(color: Colors.grey),
                          ),

                          Text(
                            userName,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                         
                        ],
                      ),

                      const Spacer(),

                      IconButton(
                        icon: const Icon(Icons.notifications_none),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NotificationScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.15,
                    children: getDashboardCards(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  List<Widget> getDashboardCards() {
    // if (userRole == "Admin") {
    //   return [
    //     dashboardCard("Users", "25", Icons.people),
    //     dashboardCard("Jobs", "18", Icons.assignment),
    //     dashboardCard("Reports", "14", Icons.analytics),
    //     dashboardCard("Revenue", "\$4500", Icons.attach_money),
    //   ];
    // }
    if (userRole == "Admin") {
      return [
    StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return dashboardCard("Users", "0", Icons.people);
            }

            /// Count all users except Admin
            int totalUsers = snapshot.data!.docs.where((doc) {
              final data = doc.data() as Map<String, dynamic>;

              String role = (data['role'] ?? '')
                  .toString()
                  .trim()
                  .toLowerCase();

              return role != 'admin';
            }).length;

            return dashboardCard("Users", totalUsers.toString(), Icons.people);
          },
        ),

        // dashboardCard("Complete Tasks", "18", Icons.assignment),
StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('service_reports')
              .where('status', isEqualTo: 'Completed')
              .snapshots(),

          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return dashboardCard("Completed Tasks", "0", Icons.analytics);
            }

            int totalCompleted = snapshot.data!.docs.length;

            return dashboardCard(
              "Completed Tasks",
              totalCompleted.toString(),
              Icons.analytics,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CompletedReportsScreen()));
              },
            );
          },
        ),
        // dashboardCard("Reports", "14", Icons.analytics),

StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance
      .collection('service_reports')
      .snapshots(),

  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return dashboardCard(
        "Reports",
        "0",
        Icons.analytics,
      
      );
    }

    int totalReports = snapshot.data!.docs.length;

    return dashboardCard(
      "Reports",
      totalReports.toString(),
      Icons.analytics,
        onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportsScreen()),
                );
              },
    );
  },
),


        // dashboardCard("Assign Tasks", "\$4500", Icons.attach_money),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return dashboardCard("Assigned Tasks", "0", Icons.assignment);
            }

            final taskCount = snapshot.data!.docs.length;

            return dashboardCard(
              "Assigned Tasks",
              taskCount.toString(),
              Icons.assignment,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AssignedTasksScreen()));
              },
            );
          },
        )
      ];
    }

    // if (userRole == "User") {
    //   return [
    //     dashboardCard("My Requests", "05", Icons.build),
    //     dashboardCard("Completed", "03", Icons.check_circle),
    //     dashboardCard("Pending", "02", Icons.pending),
    //     dashboardCard("Feedback", "04", Icons.feedback),
    //   ];
    // }

    return [
      dashboardCard(
        "Assigned Jobs",
        assignedJobsCount.toString(),
        Icons.assignment,
        onTap: () {
          
          Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskManagementScreen()));
        },
      ),
      // dashboardCard("Completed Jobs", "08", Icons.check_circle),
      FutureBuilder<int>(
        future: getCompletedJobsCount(),
        builder: (context, snapshot) {
          final count = snapshot.data ?? 0;

          return dashboardCard(
            "Completed Jobs",
            count.toString().padLeft(2, '0'),
            Icons.check_circle,
          );
        },
      ),
      dashboardCard(
        "Accepted Jobs",
        acceptedJobsCount.toString(),
        Icons.check_circle,
        onTap: () {
          Navigator.push(context, (MaterialPageRoute(builder: (context)=> AcceptedTasksScreen())));
        },
      ),
      dashboardCard("Service Stats", "92%", Icons.bar_chart),
    ];
  }

  // Widget dashboardCard(String title, String value, IconData icon) {
  //   return Container(
  //     padding: const EdgeInsets.all(16),

  //     decoration: BoxDecoration(
  //       color: Colors.white.withOpacity(.9),
  //       borderRadius: BorderRadius.circular(20),
  //     ),

  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,

  //       children: [
  //         Icon(icon, size: 35, color: const Color(0xff10213D)),

  //         const SizedBox(height: 10),

  //         Text(
  //           value,
  //           style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  //         ),

  //         const SizedBox(height: 8),

  //         Text(title, textAlign: TextAlign.center),
  //       ],
  //     ),
  //   );
  // }

  Widget dashboardCard(
    String title,
    String value,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(icon, size: 35, color: const Color(0xff10213D)),

            const SizedBox(height: 10),

            Text(
              value,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }



Future<void> getAssignedJobsCount() async {
  final prefs = await SharedPreferences.getInstance();
  String? uid = prefs.getString('uid');

  if (uid == null) return;

  // Today's date in the same format as Firestore
  String todayDate =
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('tasks')
      .where('technicianId', isEqualTo: uid)
      .where('status', isEqualTo: 'assigned')
      .where('date', isEqualTo: todayDate)
      .get();

  setState(() {
    assignedJobsCount = snapshot.docs.length;
  });
}

Future<void> getAcceptedJobsCount() async {
  final prefs = await SharedPreferences.getInstance();
  String? uid = prefs.getString('uid');

  if (uid == null) return;

  String todayDate =
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('tasks')
      .where('technicianId', isEqualTo: uid)
      .where('status', isEqualTo: 'accepted')
      .where('date', isEqualTo: todayDate)
      .get();

  setState(() {
    acceptedJobsCount = snapshot.docs.length;
  });
}
}