import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../core_widgets/pet_scaffold.dart';

class PetDetailsPage extends StatelessWidget {
  const PetDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PetScaffold(
      child: SafeArea(
        child: Column(
          children: [
            // Header com imagem do pet
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF6B46C1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Stack(
                children: [
                  // Imagem do pet (placeholder)
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.pets,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Botão de voltar
                  Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  // Nome do pet
                  Positioned(
                    bottom: 24,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          'Cachorro Negreiros',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Golden Retriever • 2 anos',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Conteúdo
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sobre',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      'Um cão muito carinhoso e brincalhão. Adora correr no parque e brincar com outros cães. Muito obediente e carinhoso com crianças.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                    ),
                    const SizedBox(height: 20),

                    // Informações do pet
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoItem(
                            context,
                            'Peso',
                            '25 kg',
                            PhosphorIcons.scales(),
                          ),
                        ),
                        Expanded(
                          child: _buildInfoItem(
                            context,
                            'Idade',
                            '2 anos',
                            PhosphorIcons.calendar(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoItem(
                            context,
                            'Sexo',
                            'Macho',
                            PhosphorIcons.genderMale(),
                          ),
                        ),
                        Expanded(
                          child: _buildInfoItem(
                            context,
                            'Cor',
                            'Dourado',
                            PhosphorIcons.palette(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Botões de ação
                    Row(
                      children: [
                        Expanded(
                          child: _buildActionButton(
                            context,
                            'Ligar',
                            PhosphorIcons.phone(),
                            const Color(0xFF6B46C1),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildActionButton(
                            context,
                            'Mensagem',
                            PhosphorIcons.chatCircle(),
                            Colors.grey[700]!,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildActionButton(
                            context,
                            'Pet na Família',
                            PhosphorIcons.heart(),
                            Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          PhosphorIcon(
            icon,
            size: 24,
            color: const Color(0xFF6B46C1),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          PhosphorIcon(
            icon,
            size: 24,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
