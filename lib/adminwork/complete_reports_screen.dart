// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class CompletedReportsScreen extends StatelessWidget {
//   const CompletedReportsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Completed Service Reports"),
//         backgroundColor: Colors.blue,
//       ),

//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('service_reports')
//             .where('status', isEqualTo: 'Completed')
//             .orderBy('createdAt', descending: true)
//             .snapshots(),

//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text("No completed reports found"));
//           }

//           final reports = snapshot.data!.docs;

//           return ListView.builder(
//             padding: const EdgeInsets.all(12),
//             itemCount: reports.length,
//             itemBuilder: (context, index) {
//               var data = reports[index].data() as Map<String, dynamic>;

//               Timestamp? ts = data['createdAt'];
//               String formattedDate = ts != null
//                   ? DateFormat('dd MMM yyyy - hh:mm a').format(ts.toDate())
//                   : "N/A";

//               return Card(
//                 margin: const EdgeInsets.only(bottom: 12),
//                 elevation: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Customer: ${data['customer'] ?? 'N/A'}",
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 6),

//                       Text("Issue: ${data['issue'] ?? 'N/A'}"),
//                       Text("Action: ${data['action'] ?? 'N/A'}"),
//                       Text("Date: ${data['date'] ?? 'N/A'}"),
//                       Text("Technician ID: ${data['technicianId'] ?? 'N/A'}"),

//                       const SizedBox(height: 6),

//                       Text(
//                         "Status: ${data['status']}",
//                         style: const TextStyle(
//                           color: Colors.green,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),

//                       const SizedBox(height: 6),

//                       Text(
//                         "Created At: $formattedDate",
//                         style: const TextStyle(
//                           color: Colors.grey,
//                           fontSize: 12,
//                         ),
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompletedReportsScreen extends StatelessWidget {
  const CompletedReportsScreen({super.key});

  // 🔥 Get technician name from profile (users collection)
  Future<String> getTechnicianName(String uid) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists) {
        return doc['name'] ?? 'Unknown Technician';
      }
    } catch (e) {
      print("Error fetching technician: $e");
    }

    return 'Unknown Technician';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed Service Reports"),
        backgroundColor: Colors.blue,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('service_reports')
            .where('status', isEqualTo: 'Completed')
            .orderBy('createdAt', descending: true)
            .snapshots(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No completed reports found"));
          }

          final reports = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: reports.length,
            itemBuilder: (context, index) {
              final data = reports[index].data() as Map<String, dynamic>;

              Timestamp? ts = data['createdAt'];
              String formattedDate = ts != null
                  ? DateFormat('dd MMM yyyy - hh:mm a').format(ts.toDate())
                  : "N/A";

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ================= HEADER =================
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xffBE8A3D),
                            child: Text(
                              (data["customer"] ?? "U")
                                  .toString()[0]
                                  .toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data["customer"] ?? "No Customer",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 2),

                                Text(
                                  data["date"] ?? "",
                                  style: const TextStyle(fontSize: 12),
                                ),

                                const SizedBox(height: 4),

                                FutureBuilder<String>(
                                  future: getTechnicianName(
                                    data["technicianId"] ?? "",
                                  ),
                                  builder: (context, snapshot) {
                                    final name = snapshot.data ?? "Loading...";

                                    return Text(
                                      "Technician: $name",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              data['status'] ?? 'Completed',
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Divider(height: 20),

                      // ================= DETAILS =================
                      Text("Issue: ${data['issue'] ?? 'N/A'}"),

                      const SizedBox(height: 5),

                      Text("Action: ${data['action'] ?? 'N/A'}"),

                      const SizedBox(height: 5),

                      Text("Task ID: ${data['customer'] ?? 'N/A'}"),

                      const SizedBox(height: 5),

                      Text("Date: ${data['date'] ?? 'N/A'}"),

                      const SizedBox(height: 10),

                      Text(
                        "Created At: $formattedDate",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
