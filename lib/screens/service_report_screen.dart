import 'package:field_service_app/utils/images.dart';
import 'package:flutter/material.dart';

class ServiceReportScreen extends StatefulWidget {
  const ServiceReportScreen({super.key});

  @override
  State<ServiceReportScreen> createState() => _ServiceReportScreenState();
}

class _ServiceReportScreenState extends State<ServiceReportScreen> {
  final TextEditingController customerController = TextEditingController();

  final TextEditingController issueController = TextEditingController();

  final TextEditingController actionController = TextEditingController();

  final TextEditingController remarksController = TextEditingController();

  List<Map<String, dynamic>> reports = [];

  @override
  void dispose() {
    customerController.dispose();
    issueController.dispose();
    actionController.dispose();
    remarksController.dispose();
    super.dispose();
  }

  void saveReport() {
    if (customerController.text.trim().isEmpty ||
        issueController.text.trim().isEmpty ||
        actionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    setState(() {
      reports.insert(0, {
        "customer": customerController.text.trim(),
        "issue": issueController.text.trim(),
        "action": actionController.text.trim(),
        "remarks": remarksController.text.trim(),
        "date":
            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      });
    });

    customerController.clear();
    issueController.clear();
    actionController.clear();
    remarksController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Service Report Saved Successfully")),
    );
  }

  Widget buildModernField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          alignLabelWithHint: maxLines > 1,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget detailTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.indigo),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  value.isEmpty ? "N/A" : value,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Service Reports"), centerTitle: true),

      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(child: Image.asset(AppImages.bg, fit: BoxFit.cover)),

          /// Dark Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(.5)),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// Header Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.indigo],
                    ),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.assignment_turned_in,
                        color: Colors.white,
                        size: 55,
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Service Report Module",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 6),

                      Text(
                        "Create and maintain service history records",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// Form Card
                Card(
                  elevation: 8,
                  color: Colors.white.withOpacity(.95),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        buildModernField(
                          controller: customerController,
                          label: "Customer Name",
                          icon: Icons.person,
                        ),

                        buildModernField(
                          controller: issueController,
                          label: "Issue Details",
                          icon: Icons.report_problem,
                          maxLines: 3,
                        ),

                        buildModernField(
                          controller: actionController,
                          label: "Actions Performed",
                          icon: Icons.build,
                          maxLines: 3,
                        ),

                        buildModernField(
                          controller: remarksController,
                          label: "Completion Remarks",
                          icon: Icons.note_alt,
                          maxLines: 3,
                        ),

                        const SizedBox(height: 10),

                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton.icon(
                            onPressed: saveReport,
                            icon: const Icon(Icons.save, color: Colors.white),
                            label: const Text(
                              "Save Report",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// History Title
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Service History",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// Empty State
                if (reports.isEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.95),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.history, size: 60, color: Colors.grey),

                        SizedBox(height: 10),

                        Text(
                          "No Service Reports Available",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                /// History List
                ListView.builder(
                  itemCount: reports.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final report = reports[index];

                    return Card(
                      elevation: 6,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.indigo,
                                  child: Text(
                                    report["customer"][0].toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 12),

                                Expanded(
                                  child: Text(
                                    report["customer"],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Chip(
                                  backgroundColor: Colors.green.shade100,
                                  label: Text(report["date"]),
                                ),
                              ],
                            ),

                            const Divider(height: 30),

                            detailTile(
                              Icons.report_problem,
                              "Issue Details",
                              report["issue"],
                            ),

                            detailTile(
                              Icons.build,
                              "Actions Performed",
                              report["action"],
                            ),

                            detailTile(
                              Icons.note_alt,
                              "Completion Remarks",
                              report["remarks"],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
