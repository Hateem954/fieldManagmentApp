import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:field_service_app/utils/images.dart';
import 'package:flutter/material.dart';

class AssignedTasksScreen extends StatelessWidget {
  const AssignedTasksScreen({super.key});

  /// Get user data by ID
  Future<Map<String, dynamic>?> getUser(String uid) async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if (doc.exists) {
      return doc.data();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assigned Tasks"),
        backgroundColor:  Colors.transparent,
        centerTitle: true,
      ),

    body: Container(
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AppImages.bg),
      fit: BoxFit.cover,
    ),
  ),
  child: StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('tasks')
        .orderBy('createdAt', descending: true)
        .snapshots(),
    builder: (context, taskSnapshot) {

      if (!taskSnapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      final tasks = taskSnapshot.data!.docs;

      if (tasks.isEmpty) {
        return const Center(
          child: Text("No Tasks Found"),
        );
      }

      /// Group tasks by technicianId
      Map<String, List<QueryDocumentSnapshot>> groupedTasks = {};

      for (var task in tasks) {
        final data = task.data() as Map<String, dynamic>;
        final uid = data['technicianId'];

        if (!groupedTasks.containsKey(uid)) {
          groupedTasks[uid] = [];
        }

        groupedTasks[uid]!.add(task);
      }

      // return ListView(
      //   children: groupedTasks.entries.map((entry) {
      //     final uid = entry.key;
      //     final userTasks = entry.value;

      //     return FutureBuilder<Map<String, dynamic>?>(
      //       future: getUser(uid),
      //       builder: (context, userSnapshot) {
      //         final user = userSnapshot.data;

      //         return Card(
      //           margin: const EdgeInsets.all(10),
      //           child: ExpansionTile(
      //             leading: const Icon(Icons.person),
      //             title: Text(
      //               user != null
      //                   ? user['fullName']
      //                   : "Unknown User",
      //             ),
      //             subtitle: Text(
      //               user != null
      //                   ? "Role: ${user['role']}"
      //                   : "No Role Found",
      //             ),
      //             children: userTasks.map((taskDoc) {
      //               final task =
      //                   taskDoc.data() as Map<String, dynamic>;

      //               return ListTile(
      //                 leading: const Icon(Icons.work),
      //                 title: Text(
      //                   "Issue: ${task['issue']}",
      //                   style: const TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.red,
      //                   ),
      //                 ),
      //                 subtitle: Column(
      //                   crossAxisAlignment:
      //                       CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       "Role: ${task['technicianRole']}",
      //                       style: const TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     Text("Date: ${task['date']}"),
      //                     Text("Status: ${task['status']}"),
      //                   ],
      //                 ),
      //                 trailing: Icon(
      //                   task['status'] == 'assigned'
      //                       ? Icons.pending_actions
      //                       : Icons.check_circle,
      //                   color: task['status'] == 'assigned'
      //                       ? Colors.orange
      //                       : Colors.green,
      //                 ),
      //               );
      //             }).toList(),
      //           ),
      //         );
      //       },
      //     );
      //   }).toList(),
      // );
      return ListView(
              padding: const EdgeInsets.all(12),
              children: groupedTasks.entries.map((entry) {
                final uid = entry.key;
                final userTasks = entry.value;

                return FutureBuilder<Map<String, dynamic>?>(
                  future: getUser(uid),
                  builder: (context, userSnapshot) {
                    final user = userSnapshot.data;

                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          child: const Icon(Icons.person, color: Colors.blue),
                        ),

                        title: Text(
                          user?['fullName'] ?? "Unknown User",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        subtitle: Text(
                          user != null
                              ? "Role: ${user['role']}"
                              : "No Role Found",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),

                        children: userTasks.map((taskDoc) {
                          final task = taskDoc.data() as Map<String, dynamic>;

                          final status = task['status'] ?? 'unknown';

                          Color statusColor;
                          IconData statusIcon;

                          if (status == 'assigned') {
                            statusColor = Colors.orange;
                            statusIcon = Icons.pending_actions;
                          } else if (status == 'completed') {
                            statusColor = Colors.green;
                            statusIcon = Icons.check_circle;
                          } else {
                            statusColor = Colors.grey;
                            statusIcon = Icons.info;
                          }

                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            padding: const EdgeInsets.all(12),

                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ISSUE TITLE
                                Text(
                                  "Issue: ${task['issue']}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // DETAILS
                                Text("Role: ${task['technicianRole']}"),
                                Text("Date: ${task['date']}"),

                                const SizedBox(height: 10),

                                // STATUS ROW
                                Row(
                                  children: [
                                    Icon(
                                      statusIcon,
                                      color: statusColor,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      status.toUpperCase(),
                                      style: TextStyle(
                                        color: statusColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                );
              }).toList(),
            );
    },
  ),
    )
);
  }
}
