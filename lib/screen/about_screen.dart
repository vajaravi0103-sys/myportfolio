
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const Color green = Color(0xFF8BEA3F);
  static const Color background = Color(0xFF050709);
  static const Color cardColor = Color(0xFF101419);
  static const Color muted = Color(0xFFB8BBC1);

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
                    'GET TO KNOW ME',
                    style: TextStyle(
                      color: green,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'About Me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 32 : 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 35),

                  if (isMobile || isTablet) ...[
                    _aboutCard(),
                    const SizedBox(height: 20),
                    _infoCard(
                      icon: Icons.school_outlined,
                      title: 'Education',
                      subtitle: 'Bachelor of Computer Applications',
                      description: 'BCA Graduate | BKNMU',
                    ),
                    const SizedBox(height: 20),
                    _infoCard(
                      icon: Icons.code,
                      title: 'Development',
                      subtitle: 'Flutter Developer',
                      description: 'Android & iOS App Development',
                    ),
                    const SizedBox(height: 20),
                    _infoCard(
                      icon: Icons.lightbulb_outline,
                      title: 'Technical Focus',
                      subtitle: 'Mobile App Development',
                      description:
                          'Flutter, Dart, REST APIs, Firebase & MySQL',
                    ),
                  ] else ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: _aboutCard(),
                        ),
                        const SizedBox(width: 25),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              _infoCard(
                                icon: Icons.school_outlined,
                                title: 'Education',
                                subtitle:
                                    'Bachelor of Computer Applications',
                                description: 'BCA Graduate | BKNMU',
                              ),
                              const SizedBox(height: 20),
                              _infoCard(
                                icon: Icons.code,
                                title: 'Development',
                                subtitle: 'Flutter Developer',
                                description:
                                    'Android & iOS App Development',
                              ),
                              const SizedBox(height: 20),
                              _infoCard(
                                icon: Icons.lightbulb_outline,
                                title: 'Technical Focus',
                                subtitle: 'Mobile App Development',
                                description:
                                    'Flutter, Dart, REST APIs, Firebase & MySQL',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _aboutCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
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
          const Text(
            "Hello! I'm Ravi Vaja",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'I am a BCA graduate and Flutter Developer passionate about building modern, responsive, and user-friendly mobile applications.',
            style: TextStyle(
              color: muted,
              fontSize: 15,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'I work with Flutter and Dart to develop Android and iOS applications. I also have experience with REST API integration, Firebase, Cloud Firestore, and MySQL.',
            style: TextStyle(
              color: muted,
              fontSize: 15,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'I enjoy learning new technologies, solving problems, and turning ideas into practical applications.',
            style: TextStyle(
              color: muted,
              fontSize: 15,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: green,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Gujarat, India',
                style: TextStyle(
                  color: green,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: green,
            size: 28,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: green,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    color: muted,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
