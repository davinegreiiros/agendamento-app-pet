import 'package:flutter/material.dart';
import '../buttons/index.dart';

/// Tela de teste para verificar se os botões estão funcionando corretamente
class ButtonTestPage extends StatelessWidget {
  const ButtonTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste dos Botões'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Teste: Botões Estendidos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Botão Google
            GoogleSignInExtendedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Google pressionado')),
                );
              },
              text: 'Entrar com Google',
            ),
            
            const SizedBox(height: 16),
            
            // Botão Facebook
            FacebookSignInExtendedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Facebook pressionado')),
                );
              },
              text: 'Entrar com Facebook',
            ),
            
            const SizedBox(height: 32),
            
            const Text(
              'Teste: Botões Circulares',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Botões circulares
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GoogleSignInButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Google circular pressionado')),
                    );
                  },
                  size: 64,
                ),
                FacebookSignInButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Facebook circular pressionado')),
                    );
                  },
                  size: 64,
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            const Text(
              'Teste: Customização',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Botão Facebook customizado
            FacebookSignInExtendedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Facebook customizado pressionado')),
                );
              },
              text: 'Conectar com Facebook',
              backgroundColor: Colors.blue.shade50,
              textColor: Colors.blue.shade800,
            ),
          ],
        ),
      ),
    );
  }
}
