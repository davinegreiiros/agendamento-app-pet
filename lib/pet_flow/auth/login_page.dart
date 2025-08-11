import 'package:flutter/material.dart';
// import '../core_widgets/pet_buttons.dart';
import '../core_widgets/pet_scaffold.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Paleta
    const mint = Color(0xFFBFE9E5);
    const mintBorder = Color(0xFFA5D9D3);
    const darkText = Color(0xFF2C2C2C);
    const hint = Color(0xFF9E9E9E);
    const greyButton = Color(0xFFBDBDBD);

    OutlineInputBorder rounded([Color? color]) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide:
              BorderSide(color: color ?? Colors.transparent, width: 1.4),
        );

    return PetScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Ícone topo esquerdo (pata)
              Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.pets,
                    size: 36, color: darkText.withOpacity(0.85)),
              ),
              const SizedBox(height: 8),

              // Título em 3 linhas
              Center(
                child: Text(
                  'Agenda\nPet\nSaúde',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF2F4A46), // verde-escuro do Figma
                        fontSize: 44,
                        height: 1.05,
                        letterSpacing: -0.5,
                      ),
                ),
              ),

              const SizedBox(height: 24),

              // Botões sociais
              Row(
                children: [
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 64),
                      decoration: BoxDecoration(
                        color: mint,
                        borderRadius:
                            BorderRadius.circular(32), // mais arredondado
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 18,
                            offset: const Offset(0, 10),
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Logar com Google',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:
                                          Colors.white, // texto branco no Figma
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.white,
                                  child: Text('G',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF2F4A46))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: const CircleBorder(),
                        side: BorderSide(color: mintBorder, width: 2),
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF2F4A46),
                      ),
                      child: const Icon(Icons.facebook, size: 26),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Ou com e-mail',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF2F4A46),
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        letterSpacing: -0.2,
                      ),
                ),
              ),

              const SizedBox(height: 12),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        labelText: 'E- mail',
                        hintText: 'Digite seu e-mail',
                        hintStyle: const TextStyle(color: hint),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        filled: true,
                        fillColor: Colors.white,
                        border: rounded(),
                        enabledBorder: rounded(mintBorder),
                        focusedBorder: rounded(mintBorder),
                        suffixIcon: const Icon(Icons.check, color: mintBorder),
                      ),
                      validator: (v) => v != null && v.contains('@')
                          ? null
                          : 'Informe um e-mail válido',
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: '••••••••',
                        hintStyle: const TextStyle(color: hint),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        filled: true,
                        fillColor: Colors.white,
                        border: rounded(),
                        enabledBorder: rounded(mintBorder),
                        focusedBorder: rounded(mintBorder),
                        suffixIcon: TextButton(
                          onPressed: () {},
                          child: const Text('Esqueceu?',
                              style: TextStyle(
                                  color: hint, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      validator: (v) => v != null && v.length >= 6
                          ? null
                          : 'Mínimo 6 caracteres',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 64,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.pushReplacementNamed(context, '/main');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mint,
                    foregroundColor: darkText,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                    elevation: 0,
                  ),
                  child: const Text('Iniciar'),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 64,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greyButton,
                    foregroundColor: darkText,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                    elevation: 0,
                  ),
                  child: const Text('Cadastrar'),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
