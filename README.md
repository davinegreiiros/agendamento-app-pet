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
- **Flutter** (SDK >=3.0.5 <4.0.0)
- **Dart**

### Arquitetura
- **Clean Architecture** - Separação clara de responsabilidades
- **Feature-First** - Organização por funcionalidades
- **SOLID Principles** - Princípios de design de software

### Principais Dependências
- `flutter_bloc ^8.1.3` - Gerenciamento de estado
- `equatable ^2.0.5` - Comparação de objetos
- `dartz ^0.10.1` - Programação funcional (Either, Option)
- `google_fonts ^6.1.0` - Fontes personalizadas
- `flutter_svg ^2.0.9` - Suporte a SVG
- `smooth_page_indicator ^1.1.0` - Indicadores de página
- `phosphor_flutter ^2.0.1` - Ícones modernos
- `cupertino_icons ^1.0.8` - Ícones iOS

## 🎨 Design e UI

O app utiliza um design moderno e intuitivo com:
- **Design System** padronizado com componentes reutilizáveis
- **Tema personalizado** com cores específicas para pets
- **Botões de redes sociais** com logos oficiais (Google, Facebook)
- **Componentes padronizados** (botões, campos de texto, scaffolds)
- **Navegação fluida** entre telas
- **Indicadores visuais** para melhor UX
- **Assets otimizados** com imagens SVG e PNG
- **Responsividade** para diferentes tamanhos de tela

### 🎨 Componentes Padronizados

#### **Botões de Redes Sociais (Padrão Unificado)**
- `GoogleSignInButton` - Botão circular com logo do Google
- `FacebookSignInButton` - Botão circular com logo do Facebook
- `GoogleSignInExtendedButton` - Botão estendido "Entrar com Google"
- `FacebookSignInExtendedButton` - Botão estendido "Entrar com Facebook"
- `SocialButtonsRow` - Linha com botões circulares de redes sociais
- `SocialExtendedButtonsColumn` - Coluna com botões estendidos de redes sociais

**🎯 Padrão Visual Unificado:**
- ✅ **Fundo branco** para todos os botões de redes sociais
- ✅ **Texto escuro** (`#2F4A46`) para melhor legibilidade
- ✅ **Ícones coloridos** das redes sociais destacados no fundo branco
- ✅ **Consistência visual** entre Google e Facebook

#### **Botões Gerais**
- `PrimaryButton` - Botão principal da aplicação
- `SecondaryButton` - Botão secundário
- `OutlineButton` - Botão com borda
- `IconButton` - Botão apenas com ícone

#### **Campos de Texto**
- `CustomTextField` - Campo de texto padronizado com validação

#### **Scaffolds e Layouts**
- `AuthScaffold` - Layout base para telas de autenticação

### 📱 Como Usar os Componentes

```dart
// Botões estendidos de redes sociais
GoogleSignInExtendedButton(
  onPressed: () => handleGoogleSignIn(),
  text: 'Entrar com Google',
)

FacebookSignInExtendedButton(
  onPressed: () => handleFacebookSignIn(),
  text: 'Entrar com Facebook',
  backgroundColor: Colors.white,  // Padrão unificado
  textColor: const Color(0xFF2F4A46),
)

// Botões circulares em linha
SocialButtonsRow(
  onGooglePressed: () => handleGoogleSignIn(),
  onFacebookPressed: () => handleFacebookSignIn(),
  buttonSize: 64,
  spacing: 24,
)

// Botões estendidos em coluna
SocialExtendedButtonsColumn(
  onGooglePressed: () => handleGoogleSignIn(),
  onFacebookPressed: () => handleFacebookSignIn(),
)

// Botão primário
PrimaryButton(
  text: 'Entrar',
  onPressed: () => handleLogin(),
  isLoading: isLoading,
)

// Campo de texto customizado
CustomTextField(
  controller: emailController,
  labelText: 'E-mail',
  hintText: 'Digite seu e-mail',
  validator: (value) => validateEmail(value),
)
```

## 📁 Estrutura do Projeto (Clean Architecture)

```
lib/
├── features/                    # Funcionalidades por domínio
│   ├── auth/                   # Autenticação
│   │   ├── data/
│   │   │   ├── datasources/    # Fontes de dados (API, Local)
│   │   │   ├── models/         # Modelos de dados
│   │   │   └── repositories/   # Implementação dos repositórios
│   │   ├── domain/
│   │   │   ├── entities/       # Entidades de negócio
│   │   │   ├── repositories/   # Contratos dos repositórios
│   │   │   └── usecases/       # Casos de uso
│   │   └── presentation/
│   │       ├── bloc/           # Gerenciamento de estado
│   │       ├── pages/          # Telas
│   │       └── widgets/        # Componentes específicos
│   ├── home/                   # Dashboard principal
│   └── pet_management/         # Gestão de pets
├── shared/                     # Recursos compartilhados
│   ├── constants/              # Constantes da aplicação
│   ├── errors/                 # Tratamento de erros
│   ├── network/                # Configuração de rede
│   ├── presentation/
│   │   ├── theme/              # Temas e cores
│   │   └── widgets/            # Componentes reutilizáveis
│   │       ├── buttons/        # Botões organizados por tipo
│   │       │   ├── google_buttons.dart
│   │       │   ├── facebook_buttons.dart
│   │       │   ├── social_button_base.dart
│   │       │   ├── social_buttons_row.dart
│   │       │   └── index.dart  # Exportações centralizadas
│   │       └── examples/       # Exemplos de uso
│   └── utils/                  # Utilitários
├── main.dart                   # Ponto de entrada
├── main_navigation.dart        # Navegação principal
└── pet_app.dart               # Configuração do app
```

### 🏗️ Princípios da Clean Architecture

#### **Camada de Apresentação (Presentation)**
- **Pages**: Telas da aplicação
- **Widgets**: Componentes de UI reutilizáveis
- **BLoC**: Gerenciamento de estado e lógica de apresentação

#### **Camada de Domínio (Domain)**
- **Entities**: Objetos de negócio puros
- **Use Cases**: Regras de negócio da aplicação
- **Repositories**: Contratos para acesso a dados

#### **Camada de Dados (Data)**
- **Models**: Representação dos dados (JSON, etc.)
- **Repositories**: Implementação concreta dos contratos
- **Data Sources**: Acesso a APIs, banco local, etc.

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

## 📱 Dispositivos suportados

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
