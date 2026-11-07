
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static const Color green = Color(0xFF8BEA3F);
  static const Color background = Color(0xFF050709);
  static const Color cardColor = Color(0xFF101419);
  static const Color muted = Color(0xFFB8BBC1);

  // Apni actual email aur GitHub profile URL yahan add karna.
  static const String email = 'vajaravi0103@gmail.com';
  static const String linkedIn =
      'https://www.linkedin.com/in/ravi-vaja-a57b25375/';
  static const String github = 'https://github.com/vajaravi0103-sys';

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      );

      if (!launched) {
        debugPrint('Could not open: $url');
      }
    } catch (e) {
      debugPrint('Error opening link: $e');
    }
  }

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
                    "LET'S CONNECT",
                    style: TextStyle(
                      color: green,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Contact Me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 32 : 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Have a project or opportunity in mind? I'd love to hear from you.",
                    style: TextStyle(
                      color: muted,
                      fontSize: 15,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 35),

                  GridView.count(
                    crossAxisCount: columns,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: isMobile ? 2.4 : 1.7,
                    children: [
                      _contactCard(
                        icon: Icons.email_outlined,
                        title: 'Email',
                        value: email,
                        onTap: () => _openLink(
                          'mailto:$email',
                        ),
                      ),
                      _contactCard(
                        icon: Icons.work_outline,
                        title: 'LinkedIn',
                        value: 'Connect with me',
                        onTap: () => _openLink(linkedIn),
                      ),
                      _contactCard(
                        icon: Icons.code,
                        title: 'GitHub',
                        value: 'View my repositories',
                        onTap: () => _openLink(github),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 55,
                          height: 3,
                          color: green,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Ravi Vaja',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Flutter Developer | Gujarat, India',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: muted,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          '© 2026 Ravi Vaja. All Rights Reserved.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: muted,
                            fontSize: 12,
                          ),
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
    );
  }

  Widget _contactCard({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.08),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: green.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: green,
                size: 27,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: muted,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_outward,
              color: green,
              size: 19,
            ),
          ],
        ),
      ),
    );
  }
}
