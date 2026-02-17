import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/util/app_colors.dart';
import 'package:portfolio/widgets/logo_card.dart';
import 'package:portfolio/widgets/project_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  bool aboutVisible = false;
  bool skillsVisible = false;
  bool portfolioVisible = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final offset = _scrollController.offset;

      setState(() {
        if (offset > 300) aboutVisible = true;
        if (offset > 750) skillsVisible = true;
        if (offset > 1100) portfolioVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Ape",
                      style: GoogleFonts.lobster(fontSize: 40),
                      children: [
                        TextSpan(
                          text: "x",
                          style: GoogleFonts.lobster(
                            fontSize: 40,
                            color: AppColors.appPinkColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      navbarItems(title: "Home"),
                      navbarItems(title: "About"),
                      navbarItems(title: "Services"),
                      navbarItems(title: "Portfolio"),
                      navbarItems(title: "Contact"),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appPinkColor,
                    ),
                    child: const Text(
                      "Hire Me",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 50),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Wellcome To My World"),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: "Hi , I'm Tharindu Nirmal\n",
                          style: GoogleFonts.lobster(fontSize: 60),
                          children: [
                            TextSpan(
                              text: "a ",
                              style: GoogleFonts.lobster(
                                fontSize: 40,
                                color: AppColors.appPinkColor,
                              ),
                            ),
                            TextSpan(
                              text: "Professional Mobile App\n",
                              style: GoogleFonts.lobster(fontSize: 40),
                            ),
                            TextSpan(
                              text: "Developer.",
                              style: GoogleFonts.lobster(
                                fontSize: 40,
                                color: AppColors.appPinkColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "I have been working since 2019. I am professional in Ui design\nand Mobile App developing",
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Find With Me"),
                              const SizedBox(height: 20),
                              Row(
                                children: const [
                                  LogoCard(imageUrl: "assets/svg/facebook.svg"),
                                  LogoCard(imageUrl: "assets/svg/linkedin.svg"),
                                  LogoCard(
                                    imageUrl: "assets/svg/instagram.svg",
                                  ),
                                  LogoCard(imageUrl: "assets/svg/GitHub.svg"),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Best Skill On"),
                              const SizedBox(height: 20),
                              Row(
                                children: const [
                                  LogoCard(imageUrl: "assets/svg/Flutter.svg"),
                                  LogoCard(imageUrl: "assets/svg/Dart.svg"),
                                  LogoCard(imageUrl: "assets/svg/figma.svg"),
                                  LogoCard(imageUrl: "assets/svg/java.svg"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 70),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/User.jpg",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),

            AnimatedSlide(
              offset: aboutVisible ? Offset.zero : const Offset(0, 0.2),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: aboutVisible ? 1 : 0,
                duration: const Duration(milliseconds: 700),
                child: Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/User.jpg",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 100),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Who I Am?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Text(
                            "Hi, I’m Tharindu Nirmal (Apex) — a passionate Software Engineering undergraduate from Sri Lanka, currently studying at NSBM Green University. I enjoy turning ideas into practical, user-friendly digital solutions and continuously improving my skills in modern software development.\n\nI have hands-on experience with mobile and web application development, using technologies like Flutter, Spring Boot, and Firebase. I’m especially interested in building clean, scalable applications with intuitive user experiences and efficient backend systems.\n\nBeyond coding, I value continuous learning, problem-solving, and emotional intelligence, which helps me work effectively both independently and in team environments. My goal is to grow as a professional developer, contribute to impactful projects, and create applications that genuinely help people.\n\n🚀 Always curious. Always building. Always improving.",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 100),

            AnimatedSlide(
              offset: skillsVisible ? Offset.zero : const Offset(0, 0.2),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: skillsVisible ? 1 : 0,
                duration: const Duration(milliseconds: 700),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "What I ",
                        style: const TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "Can Do ",
                            style: TextStyle(
                              fontSize: 55,
                              color: AppColors.appBlueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: "For You",
                            style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        skillCard(
                          context: context,
                          cardTitle: "UI / UX Design",
                          cardDescription: "UI / UX Design",
                          cardIcon: Icons.design_services_outlined,
                        ),
                        skillCard(
                          context: context,
                          cardTitle: "Mobile Application Development",
                          cardDescription: "Flutter / Dart",
                          cardIcon: Icons.phone_android,
                        ),
                        skillCard(
                          context: context,
                          cardTitle: "Website Programming",
                          cardDescription: "Web Development",
                          cardIcon: Icons.web,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 130),

            AnimatedSlide(
              offset: portfolioVisible ? Offset.zero : const Offset(0, 0.2),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: portfolioVisible ? 1 : 0,
                duration: const Duration(milliseconds: 700),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: RichText(
                          text: const TextSpan(
                            text: "My Best Selected ",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: "portfolio",
                                style: TextStyle(
                                  fontSize: 50,
                                  color: AppColors.appBlueColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: const Text(
                          textAlign: TextAlign.center,
                          "The following are the best portfolios during\nthe career path as a freelancer",
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProjectCard(
                            title: "Easy Weather App",
                            description:
                                "A simple and user-friendly weather application that provides real-time weather updates, temperature, and forecasts using a clean and intuitive UI.",
                            imagePath: "assets/images/3.png",
                            onView: () {},
                          ),
                          ProjectCard(
                            title: "MovieWave",
                            description:
                                "A modern movie application that allows users to explore trending movies, view detailed information, ratings, and trailers through a smooth and intuitive interface.",
                            imagePath: "assets/images/1.png",
                            onView: () {},
                          ),
                          ProjectCard(
                            title: "Study Planner App",
                            description:
                                "A productivity-focused study planner application that helps students organize schedules, manage tasks, and track study progress efficiently.",
                            imagePath: "assets/images/2.png",
                            onView: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}

Widget skillCard({
  required BuildContext context,
  required String cardTitle,
  required IconData cardIcon,
  required String cardDescription,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.25,
    height: 140,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF42A5F5), Color(0xFF5E35B1)],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 12,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(cardIcon, color: Colors.white, size: 32),
        const SizedBox(height: 12),
        Text(
          cardTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          cardDescription,
          style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.85)),
        ),
      ],
    ),
  );
}

Widget navbarItems({required String title}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Text(
      title,
      style: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}
