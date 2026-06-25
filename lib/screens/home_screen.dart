import 'package:field_service_app/screens/customer_information_screen.dart';
import 'package:field_service_app/screens/notification_screen.dart';
import 'package:field_service_app/screens/profile_screen.dart';
import 'package:field_service_app/screens/service_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:field_service_app/screens/job_managment_screen.dart';
import 'package:field_service_app/utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const JobManagementScreen()),
      );
    }
    if (index ==2 ) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ServiceReportScreen()),
      );
    }
     if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CustomerInformationScreen()),
      );
    }
       if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff10213D),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: "Jobs",
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.report_outlined),
            label: "service",
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: "customer info",
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
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

          /// Overlay
          Container(color: Colors.white.withOpacity(.15)),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        child: Icon(Icons.person, size: 30),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Welcome Back",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            "John Doe",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.notifications_none, size: 30),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// Search
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search jobs...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white.withOpacity(.9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
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
                    children: [
                      _dashboardCard(
                        "Assigned Jobs",
                        "12",
                        Icons.assignment_outlined,
                      ),
                      _dashboardCard(
                        "Completed Jobs",
                        "08",
                        Icons.check_circle_outline,
                      ),
                      _dashboardCard(
                        "Pending Jobs",
                        "03",
                        Icons.pending_actions_outlined,
                      ),
                      _dashboardCard(
                        "Service Stats",
                        "92%",
                        Icons.bar_chart_outlined,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Daily Activity Overview",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        _activityTile("Jobs Assigned", "5", Icons.assignment),
                        const Divider(),
                        _activityTile(
                          "Jobs Completed",
                          "3",
                          Icons.check_circle,
                        ),
                        const Divider(),
                        _activityTile(
                          "Hours Worked",
                          "7.5 Hrs",
                          Icons.access_time,
                        ),
                        const Divider(),
                        _activityTile(
                          "Customer Visits",
                          "4",
                          Icons.people_outline,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Assigned Jobs",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  _taskCard("AC Installation", "09:00 AM", "Status: Assigned"),

                  _taskCard("Electrical Repair", "11:30 AM", "Status: Pending"),

                  _taskCard(
                    "Machine Inspection",
                    "02:00 PM",
                    "Status: Completed",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashboardCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 35, color: const Color(0xff10213D)),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _activityTile(String title, String value, IconData icon) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: const Color(0xff10213D)),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _taskCard(String title, String time, String status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 25, child: Icon(Icons.work_outline)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 5),
                Text(status, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 5),
                Text(time, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 18),
        ],
      ),
    );
  }
}
