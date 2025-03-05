import 'package:flutter/material.dart';
import 'package:flutter_application_1/common_widget/custom_button.dart';
import 'package:flutter_application_1/features/category/custom_category_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IdeaManagements extends StatefulWidget {
  final String? title;
  final String status;
  const IdeaManagements({super.key, this.status = 'approved', this.title});

  @override
  State<IdeaManagements> createState() => _IdeaManagementsState();
}

class _IdeaManagementsState extends State<IdeaManagements> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title ?? 'Idea Management',
                  style: const TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
              ),
              // SizedBox(
              //   width: 300,
              //   child: CustomSearch(onSearch: (search) {}),
              // )
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder(
                  future: Supabase.instance.client
                      .from('ideas')
                      .select(
                          '*, category:categories(*), added_by:user_profiles(*)')
                      .eq('status', widget.status)
                      .order('created_at', ascending: false),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: Text('No data'));
                    }

                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: List.generate(
                        snapshot.data!.length,
                        (index) => ProjectCard(
                          projectDetails: snapshot.data![index],
                          onApprove: () async {
                            await Supabase.instance.client
                                .from('ideas')
                                .update({'status': 'approved'}).eq(
                                    'id', snapshot.data![index]['id']);
                            setState(() {});
                          },
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class CustomIdeaCard extends StatelessWidget {
  final String? status;
  final Map ideaDetails;
  const CustomIdeaCard({super.key, this.status, required this.ideaDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 404,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(ideaDetails['image_url']),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if (status == 'Pending')
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FeatureCard(
                  icon: Icons.pending,
                  text: 'Pending',
                  backgroundColor: Colors.black.withAlpha(150),
                  color: Colors.orange,
                  borderColor: Colors.orange,
                ),
              ),
            ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.transparent,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),

          // Text Content
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ideaDetails['category']['name'],
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    ideaDetails['description'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> projectDetails;
  final Function() onApprove;

  const ProjectCard({
    super.key,
    required this.projectDetails,
    required this.onApprove,
  });

  @override
  Widget build(BuildContext context) {
    int progressPercentage = 0;
    double progress = 0;
    if (projectDetails['fund_required'] != null) {
      progress =
          projectDetails['funded_amount'] / projectDetails['fund_required'];
      progressPercentage = (progress * 100).round(); // Calculate percentage
    }

    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 400,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius:
            BorderRadius.circular(12), // Optional: Add rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12)), // Match container's border radius
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                projectDetails['image_url'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  projectDetails['title'],
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                // Subtitle
                Text(
                  projectDetails['description'],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey[400], fontWeight: FontWeight.bold),
                ),
                // Progress Bar and Funded Text
                if (projectDetails['fund_required'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      LinearProgressIndicator(
                        value: progress.clamp(0.0, 1.0),
                        backgroundColor: Colors.grey[800],
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                      const SizedBox(height: 8),
                      // Days to Go and Funded Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${projectDetails['fund_required']} fund required',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey[400]),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '$progressPercentage% funded', // Display percentage
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                projectDetails['added_by']['photo'],
                                width: 45,
                                height: 45,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Added By',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.grey[400]),
                                  ),
                                  Text(
                                    projectDetails['added_by']['name'],
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                      ),
                      if (projectDetails['status'] == 'pending')
                        CustomButton(
                          label: 'Approve',
                          onPressed: onApprove,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
