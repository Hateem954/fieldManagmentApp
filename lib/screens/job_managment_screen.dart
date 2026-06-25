import 'package:field_service_app/utils/images.dart';
import 'package:flutter/material.dart';

class JobManagementScreen extends StatefulWidget {
  const JobManagementScreen({super.key});

  @override
  State<JobManagementScreen> createState() => _JobManagementScreenState();
}

class _JobManagementScreenState extends State<JobManagementScreen> {
  List<Map<String, dynamic>> jobs = [
    {
      "customer": "Alex Johnson",
      "service": "AC Installation",
      "time": "09:00 AM",
      "status": "Pending",
      "notes": "",
    },
    {
      "customer": "Smith David",
      "service": "Electrical Repair",
      "time": "11:30 AM",
      "status": "Accepted",
      "notes": "",
    },
    {
      "customer": "Robert Lee",
      "service": "Machine Inspection",
      "time": "02:00 PM",
      "status": "Completed",
      "notes": "Inspection completed successfully.",
    },
  ];

  void updateStatus(int index, String status) {
    setState(() {
      jobs[index]["status"] = status;
    });
  }

  void addNotes(int index) {
    TextEditingController noteController = TextEditingController(
      text: jobs[index]["notes"],
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Service Notes"),
        content: TextField(
          controller: noteController,
          maxLines: 4,
          decoration: const InputDecoration(
            hintText: "Enter service notes",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                jobs[index]["notes"] = noteController.text;
              });

              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Accepted":
        return Colors.blue;

      case "Completed":
        return Colors.green;

      case "Rejected":
        return Colors.red;

      default:
        return Colors.orange;
    }
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Job Management"), centerTitle: true),

//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: jobs.length,
//         itemBuilder: (context, index) {
//           final job = jobs[index];

//           return Card(
//             margin: const EdgeInsets.only(bottom: 16),
//             elevation: 3,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),

//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// Service Request
//                   Text(
//                     job["service"],
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 8),

//                   Text("Customer: ${job["customer"]}"),

//                   Text("Time: ${job["time"]}"),

//                   const SizedBox(height: 10),

//                   /// Status
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 6,
//                     ),
//                     decoration: BoxDecoration(
//                       color: getStatusColor(job["status"]).withOpacity(0.2),

//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       job["status"],
//                       style: TextStyle(
//                         color: getStatusColor(job["status"]),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 15),

//                   /// Accept / Reject
//                   if (job["status"] == "Pending")
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               updateStatus(index, "Accepted");
//                             },

//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                             ),

//                             child: const Text("Accept"),
//                           ),
//                         ),

//                         const SizedBox(width: 10),

//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               updateStatus(index, "Rejected");
//                             },

//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.red,
//                             ),

//                             child: const Text("Reject"),
//                           ),
//                         ),
//                       ],
//                     ),

//                   /// Update Status
//                   if (job["status"] == "Accepted")
//                     Column(
//                       children: [
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               updateStatus(index, "In Progress");
//                             },

//                             child: const Text("Start Job"),
//                           ),
//                         ),
//                       ],
//                     ),

//                   if (job["status"] == "In Progress")
//                     Column(
//                       children: [
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               updateStatus(index, "Completed");
//                             },

//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                             ),

//                             child: const Text("Mark as Completed"),
//                           ),
//                         ),
//                       ],
//                     ),

//                   const SizedBox(height: 10),

//                   /// Notes Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: OutlinedButton.icon(
//                       onPressed: () {
//                         addNotes(index);
//                       },

//                       icon: const Icon(Icons.note_add),

//                       label: const Text("Add Service Notes"),
//                     ),
//                   ),

//                   /// Show Notes
//                   if (job["notes"].toString().isNotEmpty)
//                     Container(
//                       margin: const EdgeInsets.only(top: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade100,
//                         borderRadius: BorderRadius.circular(12),
//                       ),

//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Notes:",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),

//                           const SizedBox(height: 5),

//                           Text(job["notes"]),
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
      title: const Text("Job Management", style: TextStyle(color: Colors.black,backgroundColor: Colors.transparent),),
      centerTitle: true,
      elevation: 0,
    ),

    body: Stack(
      children: [

        /// Background Image
       Positioned.fill(child: Image.asset(AppImages.bg, fit: BoxFit.cover)),

        /// Dark Overlay
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),

        /// Job List
        ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            final job = jobs[index];

            return Card(
              elevation: 8,
              color: Colors.white.withOpacity(0.25),
              margin: const EdgeInsets.only(bottom: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    /// Service Title
                    Row(
                      children: [
                        const Icon(
                          Icons.home_repair_service,
                          color: Colors.blue,
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: Text(
                            job["service"],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Divider(height: 25),

                    Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 8),
                        Text(
                          "Customer: ${job["customer"]}",
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(width: 8),
                        Text(
                          "Time: ${job["time"]}",
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: getStatusColor(
                          job["status"],
                        ).withOpacity(0.15),
                        borderRadius:
                            BorderRadius.circular(25),
                      ),
                      child: Text(
                        job["status"],
                        style: TextStyle(
                          color: getStatusColor(
                            job["status"],
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Keep your existing buttons here
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}
}