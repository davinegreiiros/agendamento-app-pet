import 'package:flutter/material.dart';
import '../core_widgets/pet_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PetScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header com saudação
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFF6B46C1),
                    child: Icon(
                      Icons.pets,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Olá, Thaís 🙋',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                        ),
                        Text(
                          'Como está seu pet hoje?',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Cards de informações
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    _buildInfoCard(
                      context,
                      'Informações',
                      'R\$140,00',
                      'Ver mais',
                      Colors.blue[50]!,
                      Colors.blue,
                      Icons.info_outline,
                    ),
                    _buildInfoCard(
                      context,
                      'Exames',
                      'R\$120,00',
                      'Ver mais',
                      Colors.green[50]!,
                      Colors.green,
                      Icons.medical_services_outlined,
                    ),
                    _buildInfoCard(
                      context,
                      'Cartão de Vacina',
                      'Atualizado',
                      'Ver cartão',
                      Colors.purple[50]!,
                      Colors.purple,
                      Icons.card_membership_outlined,
                    ),
                    _buildInfoCard(
                      context,
                      'Consultas',
                      'Próxima: 15/12',
                      'Agendar',
                      Colors.orange[50]!,
                      Colors.orange,
                      Icons.calendar_today_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    String title,
    String value,
    String action,
    Color backgroundColor,
    Color? iconColor,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: iconColor?.withOpacity(0.2) ?? Colors.grey.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 28,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
          const Spacer(),
          Text(
            action,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: iconColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
