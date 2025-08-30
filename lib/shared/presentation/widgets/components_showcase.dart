import 'package:flutter/material.dart';
import 'buttons/index.dart';

/// Tela de demonstração dos componentes padronizados
/// Útil para desenvolvimento e testes visuais
class ComponentsShowcase extends StatelessWidget {
  const ComponentsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes Padronizados'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Seção: Botões de Redes Sociais
            _buildSection(
              'Botões de Redes Sociais',
              [
                const Text('Botões individuais:'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GoogleSignInButton(
                      onPressed: () => _showSnackBar(context, 'Google pressed'),
                    ),
                    FacebookSignInButton(
                      onPressed: () =>
                          _showSnackBar(context, 'Facebook pressed'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text('Botões estendidos (padrão unificado):'),
                const SizedBox(height: 16),
                GoogleSignInExtendedButton(
                  onPressed: () =>
                      _showSnackBar(context, 'Google Extended pressed'),
                ),
                const SizedBox(height: 16),
                FacebookSignInExtendedButton(
                  onPressed: () =>
                      _showSnackBar(context, 'Facebook Extended pressed'),
                ),
                const SizedBox(height: 24),
                const Text('Linha de botões sociais:'),
                const SizedBox(height: 16),
                SocialButtonsRow(
                  onGooglePressed: () =>
                      _showSnackBar(context, 'Google from row pressed'),
                  onFacebookPressed: () =>
                      _showSnackBar(context, 'Facebook from row pressed'),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Seção: Botões Gerais
            _buildSection(
              'Botões Gerais',
              [
                PrimaryButton(
                  text: 'Botão Primário',
                  onPressed: () =>
                      _showSnackBar(context, 'Primary button pressed'),
                ),
                const SizedBox(height: 16),
                SecondaryButton(
                  text: 'Botão Secundário',
                  onPressed: () =>
                      _showSnackBar(context, 'Secondary button pressed'),
                ),
                const SizedBox(height: 16),
                OutlineButton(
                  text: 'Botão com Borda',
                  onPressed: () =>
                      _showSnackBar(context, 'Outline button pressed'),
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  text: 'Carregando...',
                  isLoading: true,
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Seção: Botões com Ícones
            _buildSection(
              'Botões com Ícones',
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton(
                      icon: Icons.favorite,
                      onPressed: () => _showSnackBar(context, 'Heart pressed'),
                      backgroundColor: Colors.red.shade50,
                      iconColor: Colors.red,
                    ),
                    CustomIconButton(
                      icon: Icons.share,
                      onPressed: () => _showSnackBar(context, 'Share pressed'),
                      backgroundColor: Colors.blue.shade50,
                      iconColor: Colors.blue,
                    ),
                    CustomIconButton(
                      icon: Icons.bookmark,
                      onPressed: () =>
                          _showSnackBar(context, 'Bookmark pressed'),
                      backgroundColor: Colors.green.shade50,
                      iconColor: Colors.green,
                      isCircular: false,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Seção: Variações de Tamanho
            _buildSection(
              'Variações de Tamanho',
              [
                const Text('Botões sociais em diferentes tamanhos:'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GoogleSignInButton(
                      onPressed: () {},
                      size: 32,
                    ),
                    GoogleSignInButton(
                      onPressed: () {},
                      size: 48,
                    ),
                    GoogleSignInButton(
                      onPressed: () {},
                      size: 64,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2F4A46),
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
