// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AssignTaskDialog {
//   static Future<void> show(
//     BuildContext context,
//     DocumentSnapshot user,
//     Future<void> Function(
//       DocumentSnapshot user,
//       String service,
//       String issue,
//       String date,
//     )
//     assignTask,
//   ) async {
//     final TextEditingController serviceController = TextEditingController();
//     final TextEditingController issueController = TextEditingController();
//     final TextEditingController dateController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),

//           title: Text(
//             "Assign Task",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),

//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 /// Service Type
//                 TextField(
//                   controller: serviceController,
//                   decoration: InputDecoration(
//                     labelText: "Service Type",
//                     prefixIcon: Icon(Icons.miscellaneous_services),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 15),

//                 /// Issue
//                 TextField(
//                   controller: issueController,
//                   maxLines: 2,
//                   decoration: InputDecoration(
//                     labelText: "Issue Description",
//                     prefixIcon: Icon(Icons.report_problem),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 15),

//                 /// Date
//                 TextField(
//                   controller: dateController,
//                   readOnly: true,
//                   decoration: InputDecoration(
//                     labelText: "Select Date",
//                     prefixIcon: Icon(Icons.calendar_today),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(2100),
//                     );

//                     if (pickedDate != null) {
//                       dateController.text =
//                           "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),

//           actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

//           actions: [
//             /// Cancel Button
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Cancel"),
//             ),

//             /// Assign Button
//             ElevatedButton.icon(
//               icon: Icon(Icons.check),
//               label: Text("Assign"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: () async {
//                 await assignTask(
//                   user,
//                   serviceController.text,
//                   issueController.text,
//                   dateController.text,
//                 );

//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AssignTaskDialog {
  static Future<void> show(
    BuildContext context,
    DocumentSnapshot user,
    Future<void> Function(DocumentSnapshot user, String issue, String date)
    assignTask,
  ) async {
    final TextEditingController issueController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          title: const Text(
            "Assign Task",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ROLE DISPLAY (SERVICE TYPE)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Text(
                    "Service Type: ${user['role'] ?? 'N/A'}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 15),

                /// ISSUE
                TextField(
                  controller: issueController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Issue Description",
                    prefixIcon: const Icon(Icons.report_problem),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// DATE PICKER
                TextField(
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Select Date",
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      dateController.text =
                          "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                    }
                  },
                ),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),

            ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text("Assign"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),

              onPressed: () async {
                await assignTask(
                  user,
                  issueController.text,
                  dateController.text,
                );

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
