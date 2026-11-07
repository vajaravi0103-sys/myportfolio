
import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  static const Color green = Color(0xFF8BEA3F);
  static const Color background = Color(0xFF050709);
  static const Color cardColor = Color(0xFF101419);
  static const Color muted = Color(0xFFB8BBC1);

  final List<Map<String, dynamic>> projects = const [
    {
      'number': '01',
      'title': 'FarmApp',
      'subtitle': 'Farmer & Customer Marketplace',
      'description':
          'A marketplace application that connects farmers directly with customers. Includes authentication, product management, cart, orders and document verification features.',
      'technologies': [
        'Flutter',
        'Dart',
        'REST API',
        'MySQL',
      ],
      'icon': Icons.agriculture,
      'type': 'Live Project',
    },
    {
      'number': '02',
      'title': 'RTickTasks',
      'subtitle': 'Task Management Application',
      'description':
          'A task management application that helps users create and manage daily tasks with local data storage and a responsive Material UI.',
      'technologies': [
        'Flutter',
        'Dart',
        'Hive',
        'SharedPreferences',
      ],
      'icon': Icons.task_alt,
      'type': 'Mobile Application',
    },
    {
      'number': '03',
      'title': 'Hospital Management System',
      'subtitle': 'Hospital Management Software',
      'description':
          'A Java and MySQL based project developed to manage hospital-related information and records.',
      'technologies': [
        'Java',
        'MySQL',
      ],
      'icon': Icons.local_hospital_outlined,
      'type': 'Academic Project',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;
        final isTablet = width >= 600 && width < 1024;

        final columns = isMobile ? 1 : (isTablet ? 2 : 3);

        return Container(
          width: double.infinity,
          color: background,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
            vertical: isMobile ? 55 : 80,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1250),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MY WORK',
                    style: TextStyle(
                      color: green,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'My Projects',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 32 : 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Some projects I have built using different technologies.',
                    style: TextStyle(
                      color: muted,
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 35),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projects.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 390,
                    ),
                    itemBuilder: (context, index) {
                      final project = projects[index];

                      return _projectCard(
                        number: project['number'],
                        title: project['title'],
                        subtitle: project['subtitle'],
                        description: project['description'],
                        technologies:
                            List<String>.from(project['technologies']),
                        icon: project['icon'],
                        type: project['type'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _projectCard({
    required String number,
    required String title,
    required String subtitle,
    required String description,
    required List<String> technologies,
    required IconData icon,
    required String type,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: green.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: green,
                  size: 28,
                ),
              ),
              const Spacer(),
              Text(
                number,
                style: TextStyle(
                  color: green.withOpacity(0.7),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Text(
            type.toUpperCase(),
            style: const TextStyle(
              color: green,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            subtitle,
            style: const TextStyle(
              color: muted,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              color: muted,
              fontSize: 13,
              height: 1.7,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Wrap(
            spacing: 7,
            runSpacing: 8,
            children: technologies.map((technology) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: green.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: green.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  technology,
                  style: const TextStyle(
                    color: green,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
