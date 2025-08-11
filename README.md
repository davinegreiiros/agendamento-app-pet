# Agendamento Pet App

Um aplicativo Flutter para agendamento e cuidados de pets, oferecendo uma plataforma completa para gerenciar a saúde e bem-estar dos seus animais de estimação.

## 📱 Sobre o App

O **Agendamento Pet App** é uma solução digital que facilita o cuidado com pets, permitindo:

- 🐱 **Agendamento de consultas** veterinárias de forma rápida e prática
- 🐶 **Acompanhamento da saúde** do seu pet
- 📋 **Gestão de exames** e serviços veterinários
- 👤 **Perfil personalizado** para cada animal
- 🏥 **Acesso centralizado** a informações de saúde

## 🚀 Funcionalidades

### ✨ Principais Features
- **Onboarding interativo** com apresentação das funcionalidades
- **Sistema de autenticação** seguro
- **Dashboard principal** com informações do pet
- **Navegação intuitiva** entre seções
- **Interface responsiva** para diferentes dispositivos

### 📱 Telas Disponíveis
- **Onboarding**: Introdução ao app com slides informativos
- **Login**: Autenticação do usuário
- **Home**: Dashboard principal com saudação personalizada
- **Detalhes do Pet**: Informações específicas do animal
- **Conta**: Gerenciamento do perfil do usuário

## 🛠️ Tecnologias Utilizadas

### Framework e Linguagem
- **Flutter** (SDK ^3.5.4)
- **Dart**

### Principais Dependências
- `flutter_bloc ^8.1.3` - Gerenciamento de estado
- `equatable ^2.0.5` - Comparação de objetos
- `google_fonts ^6.1.0` - Fontes personalizadas
- `flutter_svg ^2.0.9` - Suporte a SVG
- `smooth_page_indicator ^1.1.0` - Indicadores de página
- `phosphor_flutter ^2.0.1` - Ícones modernos
- `cupertino_icons ^1.0.8` - Ícones iOS

## 🎨 Design e UI

O app utiliza um design moderno e intuitivo com:
- **Tema personalizado** com cores específicas para pets
- **Componentes reutilizáveis** (botões, scaffolds, headers)
- **Navegação fluida** entre telas
- **Indicadores visuais** para melhor UX
- **Assets otimizados** com imagens de pets

## 📁 Estrutura do Projeto

```
lib/
├── core/
│   └── theme/           # Temas e estilos
├── pet_flow/
│   ├── account/         # Tela de conta do usuário
│   ├── auth/           # Autenticação e login
│   ├── core_widgets/   # Componentes reutilizáveis
│   ├── home/           # Tela principal
│   ├── onboarding/     # Introdução ao app
│   └── pet_details/    # Detalhes do pet
├── main.dart           # Ponto de entrada
├── main_navigation.dart # Navegação principal
└── pet_app.dart        # Configuração do app
```

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK (versão 3.5.4 ou superior)
- Dart SDK
- Android Studio / VS Code
- Emulador Android/iOS ou dispositivo físico

### Instalação
1. Clone o repositório:
```bash
git clone <url-do-repositorio>
cd agendamento-pet-app
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o app:
```bash
flutter run
```

## 🧪 Testes

Para executar os testes:
```bash
flutter test
```

## 📱 Plataformas Suportadas

- ✅ Android
- ✅ iOS

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para:
1. Fazer fork do projeto
2. Criar uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abrir um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---

**Desenvolvido com ❤️ para o cuidado dos nossos pets** 🐾
