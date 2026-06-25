import 'package:flutter/material.dart';
import 'package:field_service_app/utils/images.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [
    {
      "title": "New Job Assigned",
      "message":
          "You have received a new AC Installation job from Alex Johnson.",
      "time": "10 min ago",
      "type": "job",
      "isRead": false,
    },
    {
      "title": "Job Status Updated",
      "message": "Electrical Repair job status changed to Completed.",
      "time": "30 min ago",
      "type": "status",
      "isRead": true,
    },
    {
      "title": "Service Reminder",
      "message": "Reminder: Machine Inspection job starts at 2:00 PM.",
      "time": "1 hour ago",
      "type": "reminder",
      "isRead": false,
    },
    {
      "title": "New Job Assigned",
      "message": "You have received a Generator Maintenance request.",
      "time": "Yesterday",
      "type": "job",
      "isRead": true,
    },
  ];

  IconData getNotificationIcon(String type) {
    switch (type) {
      case "job":
        return Icons.work;

      case "status":
        return Icons.update;

      case "reminder":
        return Icons.notifications_active;

      default:
        return Icons.notifications;
    }
  }

  Color getNotificationColor(String type) {
    switch (type) {
      case "job":
        return Colors.blue;

      case "status":
        return Colors.green;

      case "reminder":
        return Colors.orange;

      default:
        return Colors.grey;
    }
  }

  void markAsRead(int index) {
    setState(() {
      notifications[index]["isRead"] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications"), centerTitle: true),

      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(child: Image.asset(AppImages.bg, fit: BoxFit.cover)),

          /// Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),

          notifications.isEmpty
              ? const Center(
                  child: Text(
                    "No Notifications",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];

                    return Card(
                      elevation: 6,
                      color: notification["isRead"]
                          ? Colors.white.withOpacity(.9)
                          : Colors.blue.shade50,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () => markAsRead(index),

                        child: Padding(
                          padding: const EdgeInsets.all(16),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: getNotificationColor(
                                  notification["type"],
                                ),

                                child: Icon(
                                  getNotificationIcon(notification["type"]),
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(width: 15),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            notification["title"],
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        if (!notification["isRead"])
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                      ],
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      notification["message"],
                                      style: const TextStyle(fontSize: 14),
                                    ),

                                    const SizedBox(height: 12),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          notification["time"],
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 12,
                                          ),
                                        ),

                                        TextButton(
                                          onPressed: () => markAsRead(index),

                                          child: Text(
                                            notification["isRead"]
                                                ? "Read"
                                                : "Mark Read",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
