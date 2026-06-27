import 'package:cloud_firestore/cloud_firestore.dart';
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

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('tasks')
            .orderBy('createdAt', descending: true)
            .snapshots(),

        builder: (context, taskSnapshot) {
          if (!taskSnapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final tasks = taskSnapshot.data!.docs;

          if (tasks.isEmpty) {
            return const Center(child: Text("No Tasks Found"));
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

          return ListView(
            children: groupedTasks.entries.map((entry) {
              final uid = entry.key;
              final userTasks = entry.value;

              return FutureBuilder<Map<String, dynamic>?>(
                future: getUser(uid),

                builder: (context, userSnapshot) {
                  final user = userSnapshot.data;

                  return Card(
                    margin: const EdgeInsets.all(10),

                    child: ExpansionTile(
                      leading: const Icon(Icons.person),

                      title: Text(
                        user != null ? user['fullName'] : "Unknown User",
                      ),

                      subtitle: Text(
                        user != null
                            ? "Role: ${user['role']}"
                            : "No Role Found",
                      ),

                      children: userTasks.map((taskDoc) {
                        final task = taskDoc.data() as Map<String, dynamic>;

                        return ListTile(
                          leading: const Icon(Icons.work),

                          title: Text("Issue: ${task['issue']
                          }",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),

                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text("Technician ID: ${task['technicianId']}"),
                              Text("Role: ${task['technicianRole']}",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("Date: ${task['date']}"),
                              Text("Status: ${task['status']}"),
                            ],
                          ),

                          trailing: Icon(
                            task['status'] == 'assigned'
                                ? Icons.pending_actions
                                : Icons.check_circle,
                            color: task['status'] == 'assigned'
                                ? Colors.orange
                                : Colors.green,
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
    );
  }
}
