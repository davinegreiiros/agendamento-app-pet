import 'package:flutter/material.dart';
import '../buttons/index.dart';

/// Exemplo de uso dos botões de redes sociais
/// Demonstra diferentes layouts e combinações
class SocialButtonsExample extends StatelessWidget {
  const SocialButtonsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplos de Botões Sociais'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Layout 1: Botões estendidos em coluna (padrão unificado)
            _buildSection(
              'Layout 1: Botões Estendidos (Padrão Unificado)',
              [
                const Text(
                  'Ambos os botões agora seguem o mesmo padrão visual:\n'
                  '• Fundo branco\n'
                  '• Texto escuro\n'
                  '• Ícone destacado',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                SocialExtendedButtonsColumn(
                  onGooglePressed: () => _showMessage(context, 'Google'),
                  onFacebookPressed: () => _showMessage(context, 'Facebook'),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Layout 2: Botões circulares em linha
            _buildSection(
              'Layout 2: Botões Circulares',
              [
                SocialButtonsRow(
                  onGooglePressed: () => _showMessage(context, 'Google'),
                  onFacebookPressed: () => _showMessage(context, 'Facebook'),
                  buttonSize: 64,
                  spacing: 24,
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Layout 3: Apenas Google estendido
            _buildSection(
              'Layout 3: Apenas Google',
              [
                GoogleSignInExtendedButton(
                  onPressed: () => _showMessage(context, 'Google'),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Layout 4: Apenas Facebook estendido
            _buildSection(
              'Layout 4: Apenas Facebook',
              [
                FacebookSignInExtendedButton(
                  onPressed: () => _showMessage(context, 'Facebook'),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Layout 5: Combinação personalizada
            _buildSection(
              'Layout 5: Combinação Personalizada',
              [
                GoogleSignInExtendedButton(
                  onPressed: () => _showMessage(context, 'Google'),
                  text: 'Continuar com Google',
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Ou use: '),
                    const SizedBox(width: 16),
                    FacebookSignInButton(
                      onPressed: () => _showMessage(context, 'Facebook'),
                      size: 48,
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
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2F4A46),
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  void _showMessage(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login com $provider pressionado'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
