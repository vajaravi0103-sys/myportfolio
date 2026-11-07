
import 'package:flutter/material.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  static const Color green = Color(0xFF8BEA3F);
  static const Color background = Color(0xFF050709);
  static const Color cardColor = Color(0xFF101419);
  static const Color muted = Color(0xFFB8BBC1);

  // Internship complete hone par is text ko update karna.
  static const String internshipStatus = 'Currently Ongoing';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;
        final isTablet = width >= 600 && width < 1024;

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
                    'MY JOURNEY',
                    style: TextStyle(
                      color: green,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Experience',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 32 : 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'My professional learning journey and practical experience.',
                    style: TextStyle(
                      color: muted,
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 35),

                  _experienceCard(isMobile),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _experienceCard(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 22 : 32),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: green.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.work_outline,
                  color: green,
                  size: 30,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Flutter Developer Intern',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      '3 Months Internship',
                      style: TextStyle(
                        color: muted,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: green.withOpacity(0.10),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: green.withOpacity(0.3),
              ),
            ),
            child: const Text(
              internshipStatus,
              style: TextStyle(
                color: green,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'About My Experience',
            style: TextStyle(
              color: green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Worked on Flutter application development and gained practical experience in building responsive mobile application interfaces.',
            style: TextStyle(
              color: muted,
              fontSize: 14,
              height: 1.8,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Key Learning & Skills',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

          _skillItem('Flutter & Dart application development'),
          _skillItem('REST API integration and JSON parsing'),
          _skillItem('State management using Provider and GetX'),
          _skillItem('Working with Android application development'),
          _skillItem('Debugging and problem-solving'),

        ],
      ),
    );
  }

  Widget _skillItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: green,
            size: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: muted,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
