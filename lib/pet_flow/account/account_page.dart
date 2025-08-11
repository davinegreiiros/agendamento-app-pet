import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import '../core_widgets/pet_scaffold.dart';
import '../auth/login_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PetScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Header com menu e avatar central
              Align(
                alignment: Alignment.topLeft,
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, size: 28),
                  onSelected: (value) {
                    if (value == 'logout') {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        LoginPage.route,
                        (route) => false,
                      );
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: 'logout',
                      child: Text('Logout'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFFBFE9E5),
                  child: Icon(Icons.person, color: Colors.black87, size: 48),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Thaís Negreiros',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
              ),
              Text(
                'thaisnegreiros@gmail.com',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 32),

              // Seção Seus Pets
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Seus Pets',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Ver tudo',
                        style: TextStyle(color: Colors.black)),
                  )
                ],
              ),
              const SizedBox(height: 16),

              // Lista de pets no estilo do layout
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _petPill(
                          background: const Color(0xFFC4E8E3),
                          imageAsset: 'assets/image/foto-pet1.png',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _petPill(
                          background: const Color(0xFFC9C1F0),
                          imageAsset: 'assets/image/foto-pet2.png',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _petInfoCard(
                          context,
                          name: 'Aurora',
                          breed: 'Golden Retriver',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _petInfoCard(
                          context,
                          name: 'Nina',
                          breed: 'Pastor Alemão',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPetItem(
    BuildContext context,
    String name,
    String breed,
    String age,
    IconData icon,
  ) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: const Color(0xFF6B46C1).withOpacity(0.1),
          child: Icon(
            icon,
            color: const Color(0xFF6B46C1),
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
              ),
              Text(
                '$breed • $age',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Pill com foto do pet e menu de três pontos
  Widget _petPill({required Color background, required String imageAsset}) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageAsset,
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.more_vert, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  // Card com nome e raça do pet
  Widget _petInfoCard(BuildContext context,
      {required String name, required String breed}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            breed,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[700],
                ),
          ),
        ],
      ),
    );
  }
}
