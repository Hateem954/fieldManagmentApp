import 'package:flutter/material.dart';
import 'package:field_service_app/utils/images.dart';

class CustomerInformationScreen extends StatefulWidget {
  const CustomerInformationScreen({super.key});

  @override
  State<CustomerInformationScreen> createState() =>
      _CustomerInformationScreenState();
}

class _CustomerInformationScreenState extends State<CustomerInformationScreen> {
  final List<Map<String, dynamic>> customers = [
    {
      "name": "Alex Johnson",
      "phone": "+92 300 1234567",
      "email": "alex@gmail.com",
      "location": "Lahore, Pakistan",
      "history": [
        "AC Installation - Completed",
        "Maintenance Service - Completed",
        "Electrical Repair - Pending",
      ],
    },
    {
      "name": "David Smith",
      "phone": "+92 301 9876543",
      "email": "david@gmail.com",
      "location": "Karachi, Pakistan",
      "history": [
        "Machine Inspection - Completed",
        "Generator Repair - Completed",
      ],
    },
    {
      "name": "Robert Lee",
      "phone": "+92 333 1122334",
      "email": "robert@gmail.com",
      "location": "Islamabad, Pakistan",
      "history": ["Electrical Repair - Completed"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Information"),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(child: Image.asset(AppImages.bg, fit: BoxFit.cover)),

          /// Dark Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(.5)),
          ),

          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];

              return Card(
                elevation: 8,
                color: Colors.white.withOpacity(.95),
                margin: const EdgeInsets.only(bottom: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Customer Header
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.indigo,
                            child: Text(
                              customer["name"][0],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  customer["name"],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                const Text(
                                  "Customer Details",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const Divider(height: 30),

                      /// Phone
                      infoTile(Icons.phone, "Phone", customer["phone"]),

                      /// Email
                      infoTile(Icons.email, "Email", customer["email"]),

                      /// Location
                      infoTile(
                        Icons.location_on,
                        "Service Location",
                        customer["location"],
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Service Request History",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      ...List.generate(
                        customer["history"].length,
                        (historyIndex) => Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.history, color: Colors.indigo),

                              const SizedBox(width: 10),

                              Expanded(
                                child: Text(customer["history"][historyIndex]),
                              ),
                            ],
                          ),
                        ),
                      ),
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

  Widget infoTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.indigo),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 3),

                Text(value, style: const TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
