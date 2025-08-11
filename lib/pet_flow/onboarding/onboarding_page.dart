import 'package:flutter/material.dart';
import '../core_widgets/pet_buttons.dart';
import '../core_widgets/pet_header_skip.dart';
import '../core_widgets/pet_page_indicator.dart';
import '../core_widgets/pet_scaffold.dart';
import '../auth/login_page.dart';

class OnboardingPage extends StatefulWidget {
  static const String route = '/onboarding';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  int index = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const _OnbContent(
        imagePath: 'assets/image/gato-splash1.png',
        title: 'Seu Gatinho(a) merece\natendimento de qualidade',
        subtitle: 'Receba cuidados e agende consultas rápidas',
      ),
      const _OnbContent(
        imagePath: 'assets/image/dog-splash2.png',
        title: 'Atenda às necessidades\ndo seu animal aqui',
        subtitle: 'Consulte exames e serviços em um só lugar',
      ),
    ];

    return PetScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              PetHeaderSkip(
                  onSkip: () =>
                      Navigator.pushReplacementNamed(context, LoginPage.route)),
              const SizedBox(height: 8),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  onPageChanged: (i) => setState(() => index = i),
                  itemBuilder: (_, i) => pages[i],
                ),
              ),
              const SizedBox(height: 8),
              PetPageIndicator(currentIndex: index, length: pages.length),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: PetSecondaryButton(
                      label: 'Pular',
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, LoginPage.route),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PetPrimaryButton(
                      label: 'Continuar',
                      onPressed: () {
                        if (index < pages.length - 1) {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        } else {
                          Navigator.pushReplacementNamed(
                              context, LoginPage.route);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnbContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const _OnbContent({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        // Image
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 40),
        // Title and subtitle
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
