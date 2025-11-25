import 'package:agendamento_pet_app/shared/constants/app_routes.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      image: 'assets/image/gato-splash1.png',
      title: 'Orgulhoso de ser um Adotante de Pet',
      description: 'Procurando amor incondicional?\nvisite o abrigo hoje',
      number: 1,
    ),
    OnboardingData(
      image: 'assets/image/dog-splash2.png',
      title: 'Escolha o Estilo',
      description: 'Confira nossa coleção de moda mais rápida\n'
          'para seu amigo mais leal',
      number: 2,
    ),
    OnboardingData(
      image: 'assets/image/dog-splash-1.png',
      title: 'Atenda as necessidades\ndo seu animal aqui',
      description: 'Receba promoções interessantes aqui, registre\n'
          'sua conta imediatamente para que você possa\n'
          'atender às necessidades de seus animais.',
      number: 3,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    }
  }

  void _skip() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFB8E5E5),
        body: SafeArea(
          child: Column(
            children: [
              // Header com logo e botão Skip
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo da patinha
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.pets,
                        color: Color(0xFFB8E5E5),
                        size: 28,
                      ),
                    ),
                    // Botão Skip
                    TextButton(
                      onPressed: _skip,
                      child: const Text(
                        'Pular',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // PageView com as imagens
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _pages.length,
                  itemBuilder: (context, index) =>
                      _OnboardingSlide(data: _pages[index]),
                ),
              ),
            ],
          ),
        ),
      );
}

class _OnboardingSlide extends StatelessWidget {
  const _OnboardingSlide({required this.data});

  final OnboardingData data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final availableHeight = size.height - padding.top - padding.bottom - 90;

    return Column(
      children: [
        // Imagem do animal
        SizedBox(
          height: availableHeight * 0.50,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                data.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ),

        const SizedBox(height: 18),

        // Card branco com conteúdo — AGORA ROLÁVEL
        Flexible(
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Indicador com patinha
                  Container(
                    width: 50,
                    height: 52,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB8E5E5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.pets,
                      color: Colors.black,
                      size: 34,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Título
                  Text(
                    data.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Descrição
                  Text(
                    data.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Botão Next
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        final parent = context
                            .findAncestorStateOfType<_OnboardingPageState>();
                        if (data.number < 3) {
                          parent?._nextPage();
                        } else {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.login);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB8E5E5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.pets,
                              color: Color(0xFFB8E5E5),
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 18),
      ],
    );
  }
}

class OnboardingData {
  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
    required this.number,
  });

  final String image;
  final String title;
  final String description;
  final int number;
}
