
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:myportfolio/screen/about_screen.dart';
import 'package:myportfolio/screen/contact_screen.dart';
import 'package:myportfolio/screen/experience_screen.dart';
import 'package:myportfolio/screen/projects_screen.dart';
import 'package:myportfolio/screen/skills_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String selectedSection = 'Home';

  static const Color backgroundColor = Color(0xFF050709);
  static const Color greenColor = Color(0xFF8BEA3F);
  static const Color cardColor = Color(0xFF111719);

  // Scroll to selected section
  void _scrollTo(GlobalKey key, String section) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
        alignment: 0.03,
      );
    }

    setState(() {
      selectedSection = section;
    });
  }

  // Drawer navigation
  void _navigateFromDrawer(
    BuildContext context,
    GlobalKey key,
    String section,
  ) {
    Navigator.pop(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollTo(key, section);
    });
  }

  // Download / open Resume PDF
  Future<void> _downloadCV() async {
    final Uri resumeUrl = Uri.base.resolve(
      'assets/assets/Ravi_Vaja_Resume.pdf',
    );

    try {
      final bool opened = await launchUrl(
        resumeUrl,
        webOnlyWindowName: '_blank',
      );

      if (!opened && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to open resume. Please try again.'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Resume could not be opened.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;
        final isTablet = width >= 600 && width < 1024;

        return Scaffold(
          backgroundColor: backgroundColor,
          drawer: isMobile || isTablet
              ? _buildDrawer(context)
              : null,
          body: SingleChildScrollView(
            child: Column(
              children: [
                _navbar(context, isMobile || isTablet),

                _hero(width),

                _techStack(isMobile),

                Container(
                  key: _aboutKey,
                  child: const AboutScreen(),
                ),

                Container(
                  key: _skillsKey,
                  child: const SkillsScreen(),
                ),

                Container(
                  key: _projectsKey,
                  child: const ProjectsScreen(),
                ),

                Container(
                  key: _experienceKey,
                  child: const ExperienceScreen(),
                ),

                Container(
                  key: _contactKey,
                  child: const ContactScreen(),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }

  // NAVBAR
  Widget _navbar(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 22,
      ),
      child: Row(
        children: [
          const Text(
            'RAVI VAJA',
            style: TextStyle(
              color: greenColor,
              fontSize: 23,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          const Spacer(),

          if (isMobile)
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: greenColor,
                    size: 30,
                  ),
                );
              },
            )
          else ...[
            _NavItem(
              title: 'Home',
              selected: selectedSection == 'Home',
              onTap: () => _scrollTo(_homeKey, 'Home'),
            ),
            _NavItem(
              title: 'About',
              selected: selectedSection == 'About',
              onTap: () => _scrollTo(_aboutKey, 'About'),
            ),
            _NavItem(
              title: 'Skills',
              selected: selectedSection == 'Skills',
              onTap: () => _scrollTo(_skillsKey, 'Skills'),
            ),
            _NavItem(
              title: 'Projects',
              selected: selectedSection == 'Projects',
              onTap: () => _scrollTo(_projectsKey, 'Projects'),
            ),
            _NavItem(
              title: 'Experience',
              selected: selectedSection == 'Experience',
              onTap: () => _scrollTo(_experienceKey, 'Experience'),
            ),
            _NavItem(
              title: 'Contact',
              selected: selectedSection == 'Contact',
              onTap: () => _scrollTo(_contactKey, 'Contact'),
            ),
          ],
        ],
      ),
    );
  }

  // DRAWER
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: cardColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(22),
              child: Text(
                'RAVI VAJA',
                style: TextStyle(
                  color: greenColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),

            const Divider(color: Colors.white24),

            _drawerItem(context, 'Home', _homeKey),
            _drawerItem(context, 'About', _aboutKey),
            _drawerItem(context, 'Skills', _skillsKey),
            _drawerItem(context, 'Projects', _projectsKey),
            _drawerItem(context, 'Experience', _experienceKey),
            _drawerItem(context, 'Contact', _contactKey),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    String title,
    GlobalKey key,
  ) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: selectedSection == title
              ? greenColor
              : Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: () => _navigateFromDrawer(context, key, title),
    );
  }

  // HERO SECTION
  Widget _hero(double width) {
    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1024;

    return Container(
      key: _homeKey,
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 550),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : (isTablet ? 45 : 90),
        vertical: 55,
      ),
      child: isMobile || isTablet
          ? Column(
              children: [
                _intro(width),
                const SizedBox(height: 45),
                _profileImage(isMobile ? 230 : 280),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _intro(width),
                ),
                const SizedBox(width: 50),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: _profileImage(340),
                  ),
                ),
              ],
            ),
    );
  }

  // INTRO TEXT
  Widget _intro(double width) {
    final bool isMobile = width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'HELLO, I AM',
          style: TextStyle(
            color: greenColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),

        const SizedBox(height: 18),

        Text(
          'Ravi Vaja',
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 42 : 58,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          'Flutter Android & iOS Developer',
          style: TextStyle(
            color: greenColor,
            fontSize: isMobile ? 23 : 30,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 22),

        Text(
          'I build responsive and user-friendly mobile '
          'applications using Flutter and Dart. '
          'Passionate about creating useful digital experiences.',
          style: TextStyle(
            color: Colors.white70,
            fontSize: isMobile ? 15 : 17,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 35),

        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            // HIRE ME
            ElevatedButton(
              onPressed: () {
                _scrollTo(_contactKey, 'Contact');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: greenColor,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 17,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Hire Me',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // VIEW MY WORK
            OutlinedButton(
              onPressed: () {
                _scrollTo(_projectsKey, 'Projects');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: greenColor,
                side: const BorderSide(color: greenColor),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 17,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('View My Work'),
            ),

            // DOWNLOAD CV
            ElevatedButton.icon(
              onPressed: _downloadCV,
              icon: const Icon(Icons.download, size: 19),
              label: const Text('Download CV'),
              style: ElevatedButton.styleFrom(
                backgroundColor: cardColor,
                foregroundColor: greenColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 17,
                ),
                side: const BorderSide(color: greenColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // PROFILE IMAGE
  Widget _profileImage(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: greenColor,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: greenColor.withOpacity(0.18),
            blurRadius: 35,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/Profile.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.person,
              color: greenColor,
              size: 100,
            );
          },
        ),
      ),
    );
  }

  // TECHNOLOGY STACK
  Widget _techStack(bool isMobile) {
    final technologies = [
      {'name': 'Flutter', 'icon': Icons.flutter_dash},
      {'name': 'Dart', 'icon': Icons.code},
      {'name': 'Firebase', 'icon': Icons.local_fire_department},
      {'name': 'REST API', 'icon': Icons.api},
      {'name': 'MySQL', 'icon': Icons.storage},
      {'name': 'Git', 'icon': Icons.source},
    ];

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 70,
        vertical: 45,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 15 : 35,
        vertical: 35,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1213),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: greenColor.withOpacity(0.20),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'TECHNOLOGIES I WORK WITH',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: greenColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'My Tech Stack',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 15,
            runSpacing: 15,
            children: technologies.map((technology) {
              return Container(
                width: isMobile ? 125 : 145,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF151D1E),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: greenColor.withOpacity(0.25),
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      technology['icon'] as IconData,
                      color: greenColor,
                      size: 32,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      technology['name'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// NAVIGATION ITEM
class _NavItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: selected
                    ? const Color(0xFF8BEA3F)
                    : Colors.white70,
                fontSize: 14,
                fontWeight: selected
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 5),
            if (selected)
              Container(
                height: 2,
                width: 25,
                color: const Color(0xFF8BEA3F),
              ),
          ],
        ),
      ),
    );
  }
}
