
import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  static const Color green = Color(0xFF8BEA3F);
  static const Color background = Color(0xFF050709);
  static const Color cardColor = Color(0xFF101419);
  static const Color muted = Color(0xFFB8BBC1);

  final List<Map<String, dynamic>> skillCategories = const [
    {
      'title': 'Mobile Development',
      'icon': Icons.phone_android,
      'skills': [
        'Flutter',
        'Dart',
        'Android App Development',
        'iOS App Development',
      ],
    },
    {
      'title': 'API Integration',
      'icon': Icons.api,
      'skills': [
        'REST APIs',
        'JSON Parsing',
        'HTTP Requests',
        'Postman',
      ],
    },
    {
      'title': 'State Management',
      'icon': Icons.account_tree_outlined,
      'skills': [
        'Provider',
        'GetX',
        'setState()',
      ],
    },
    {
      'title': 'Database & Backend',
      'icon': Icons.storage,
      'skills': [
        'Firebase',
        'Cloud Firestore',
        'MySQL',
      ],
    },
    {
      'title': 'Development Tools',
      'icon': Icons.build_outlined,
      'skills': [
        'VS Code',
        'Android Studio',
        'Git',
        'GitHub',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;
        final isTablet = width >= 600 && width < 1024;

        final horizontalPadding =
            isMobile ? 20.0 : (isTablet ? 40.0 : 80.0);

        final columns = isMobile ? 1 : (isTablet ? 2 : 3);

        return Container(
          width: double.infinity,
          color: background,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isMobile ? 55 : 80,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1250),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MY EXPERTISE',
                    style: TextStyle(
                      color: green,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    'Technical Skills',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 32 : 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    'Technologies and tools I use to build mobile applications.',
                    style: TextStyle(
                      color: muted,
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 35),

                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: skillCategories.map((category) {
                      final cardWidth = isMobile
                          ? width - (horizontalPadding * 2)
                          : (constraints.maxWidth -
                                  (horizontalPadding * 2) -
                                  (20 * (columns - 1))) /
                              columns;

                      return SizedBox(
                        width: cardWidth,
                        child: _skillCard(
                          title: category['title'],
                          icon: category['icon'],
                          skills: List<String>.from(
                            category['skills'],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _skillCard({
    required String title,
    required IconData icon,
    required List<String> skills,
  }) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: green, size: 30),
          const SizedBox(height: 15),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),

          Wrap(
            spacing: 8,
            runSpacing: 9,
            children: skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: green.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: green.withOpacity(0.25),
                  ),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    color: green,
                    fontSize: 12,
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