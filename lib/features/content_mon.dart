import 'package:flutter/material.dart';

class ContentModerationScreen extends StatelessWidget {
  const ContentModerationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contentList = [
      {
        'title': 'Sustainable Urban Farming',
        'category': 'Sustainability',
        'description':
            'A system for implementing vertical farming in urban areas...',
        'risk': 'Low Risk',
        'submittedBy': 'Jane Smith',
        'date': '2024-02-20'
      },
      {
        'title': 'Community Guidelines Discussion',
        'category': 'Community',
        'description': 'Proposed updates to our community guidelines...',
        'risk': 'Medium Risk',
        'submittedBy': 'John Doe',
        'date': '2024-02-19'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Content Moderation',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
                child: Text('Pending Review: ${contentList.length}',
                    style: const TextStyle(color: Colors.black))),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: contentList.length,
          itemBuilder: (context, index) {
            final item = contentList[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Chip(
                          label: Text(item['category']!),
                          backgroundColor: Colors.blue.shade100,
                        ),
                        const SizedBox(width: 16),
                        Chip(
                          label: Text(item['risk']!),
                          backgroundColor: item['risk'] == 'Low Risk'
                              ? Colors.green.shade100
                              : Colors.yellow.shade100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['description']!,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Submitted by ${item['submittedBy']} • ${item['date']}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Reject logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Reject'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Approve logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('Approve'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
