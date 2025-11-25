// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/home/presentation/pages/home_page.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/account/presentation/pages/account_page.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/presentation/pages/pets_list_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const PetsListPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: const Color(0xFF6B46C1),
          unselectedItemColor: Colors.grey[600],
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          items: [
            BottomNavigationBarItem(
              icon: PhosphorIcon(
                _currentIndex == 0
                    ? PhosphorIcons.house(PhosphorIconsStyle.fill)
                    : PhosphorIcons.house(),
                size: 24,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: PhosphorIcon(
                _currentIndex == 1
                    ? PhosphorIcons.dog(PhosphorIconsStyle.fill)
                    : PhosphorIcons.dog(),
                size: 24,
              ),
              label: 'Meus Pets',
            ),
            BottomNavigationBarItem(
              icon: PhosphorIcon(
                _currentIndex == 2
                    ? PhosphorIcons.user(PhosphorIconsStyle.fill)
                    : PhosphorIcons.user(),
                size: 24,
              ),
              label: 'Conta',
            ),
          ],
        ),
      ),
    );
  }
}
