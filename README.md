# Agenda Pet Saúde

Um aplicativo Flutter para agendamento e cuidados de pets, desenvolvido seguindo os princípios de **Clean Architecture** e **Clean Code**.

## 🏗️ Arquitetura

O projeto segue os princípios da **Clean Architecture** com separação clara de responsabilidades:


```
├── 📁 lib/
│   ├── 📁 core/ # Código compartilhado
│   │   ├── 📁 constants/                 # Constantes da aplicação
│   │   │   └── 🔵 app_constants.dart
│   │   ├── 📁 di/                        # Injeção de dependências
│   │   │   └── 🔵 dependency_injection.dart
│   │   ├── 📁 theme/
│   │   │   ├── 🔵 app_theme.dart
│   │   │   └── 🔵 pet_theme.dart
│   │   └── 📁 validators/                # Validações centralizadas
│   │       └── 🔵 validators.dart
│   ├── 📁 features/  # Features da aplicação
│   │   ├── 📁 auth/
│   │   │   ├── 📁 data/  # Camada de dados
│   │   │   │   ├── 📁 datasources/       # Fontes de dados (API, Local)
│   │   │   │   │   ├── 🔵 auth_local_datasource.dart
│   │   │   │   │   └── 🔵 auth_remote_datasource.dart
│   │   │   │   └── 📁 repositories/      # Implementação dos repositories
│   │   │   │       └── 🔵 auth_repository_impl.dart
│   │   │   ├── 📁 domain/
│   │   │   │   ├── 📁 entities/
│   │   │   │   │   └── 🔵 user.dart
│   │   │   │   ├── 📁 repositories/
│   │   │   │   │   └── 🔵 auth_repository.dart
│   │   │   │   └── 📁 usecases/          # Casos de uso
│   │   │   │       ├── 🔵 get_current_user.dart
│   │   │   │       ├── 🔵 reset_password.dart
│   │   │   │       ├── 🔵 sign_in_with_email.dart
│   │   │   │       ├── 🔵 sign_in_with_facebook.dart
│   │   │   │       ├── 🔵 sign_in_with_google.dart
│   │   │   │       ├── 🔵 sign_out.dart
│   │   │   │       └── 🔵 sign_up.dart
│   │   │   └── 📁 presentation/          # Camada de apresentação
│   │   │       ├── 📁 bloc/
│   │   │       │   ├── 🔵 auth_bloc.dart
│   │   │       │   └── 🔵 auth_state.dart
│   │   │       ├── 📁 pages/
│   │   │       │   └── 🔵 login_page.dart
│   │   │       └── 📁 widgets/
│   │   │           ├── 🔵 auth_scaffold.dart
│   │   │           └── 🔵 custom_text_field.dart
│   │   └── 📁 pets/  # Feature de pets
│   │       └── 📁 domain/                # Camada de domínio
│   │           ├── 📁 entities/
│   │           │   └── 🔵 pet.dart
│   │           ├── 📁 repositories/
│   │           │   └── 🔵 pet_repository.dart
│   │           └── 📁 usecases/
│   │               ├── 🔵 create_pet.dart
│   │               └── 🔵 get_pets_by_owner.dart
│   ├── 📁 pet_flow/                     # Fluxo principal da aplicação
│   │   ├── 📁 account/
│   │   │   └── 🔵 account_page.dart
│   │   ├── 📁 auth/
│   │   │   └── 🔵 login_page.dart
│   │   ├── 📁 core_widgets/
│   │   │   ├── 🔵 pet_buttons.dart
│   │   │   ├── 🔵 pet_header_skip.dart
│   │   │   ├── 🔵 pet_page_indicator.dart
│   │   │   └── 🔵 pet_scaffold.dart
│   │   ├── 📁 home/
│   │   │   └── 🔵 home_page.dart
│   │   ├── 📁 onboarding/
│   │   │   └── 🔵 onboarding_page.dart
│   │   └── 📁 pet_details/
│   │       └── 🔵 pet_details_page.dart
│   ├── 📁 shared/
│   │   ├── 📁 constants/
│   │   │   └── 🔵 app_routes.dart
│   │   ├── 📁 errors/
│   │   │   └── 🔵 failures.dart
│   │   └── 📁 presentation/             # Widgets e temas compartilhados
│   │       ├── 📁 theme/
│   │       │   ├── 🔵 app_colors.dart
│   │       │   └── 🔵 app_theme.dart
│   │       └── 📁 widgets/
│   │           ├── 📁 buttons/
│   │           │   ├── 🔵 facebook_buttons.dart
│   │           │   ├── 🔵 google_buttons.dart
│   │           │   ├── 🔵 index.dart
│   │           │   ├── 🔵 social_button_base.dart
│   │           │   └── 🔵 social_buttons_row.dart
│   │           ├── 📁 examples/
│   │           │   ├── 🔵 button_test.dart
│   │           │   └── 🔵 social_buttons_example.dart
│   │           ├── 🔵 components_showcase.dart
│   │           └── 🔵 custom_buttons.dart
│   ├── 🔵 main.dart
│   ├── 🔵 main_navigation.dart
│   └── 🔵 pet_app.dart

```

## 🎯 Princípios Aplicados

### Clean Architecture
- **Separação de responsabilidades**: Cada camada tem uma responsabilidade específica
- **Inversão de dependência**: Camadas internas não dependem das externas
- **Independência de frameworks**: O código de negócio não depende do Flutter

### Clean Code
- **Nomes descritivos**: Variáveis, funções e classes com nomes claros
- **Funções pequenas**: Cada função tem uma única responsabilidade
- **Comentários quando necessário**: Código autoexplicativo
- **Constantes centralizadas**: Cores, espaçamentos e estilos em arquivos dedicados

### SOLID Principles
- **Single Responsibility**: Cada classe tem uma única responsabilidade
- **Open/Closed**: Aberto para extensão, fechado para modificação
- **Liskov Substitution**: Substituição de implementações sem quebrar o código
- **Interface Segregation**: Interfaces específicas para cada necessidade
- **Dependency Inversion**: Dependência de abstrações, não de implementações

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento
- **BLoC**: Gerenciamento de estado
- **Dartz**: Programação funcional (Either, Option)
- **Equatable**: Comparação de objetos
- **Google Fonts**: Tipografia
- **Flutter SVG**: Ícones SVG

## 📱 Features Implementadas

### ✅ Autenticação
- Login com email e senha
- Login social (Google, Facebook)
- Cadastro de usuário
- Recuperação de senha
- Logout

### ✅ Gerenciamento de Estado
- BLoc para autenticação
- Estados reativos
- Tratamento de erros

### ✅ UI/UX
- Design system consistente
- Cores e espaçamentos padronizados
- Validações centralizadas
- Feedback visual para o usuário

## 🚀 Como Executar

1. Clone o repositório
2. Instale as dependências:
   ```bash
   flutter pub get
   ```
3. Execute o aplicativo:
   ```bash
   flutter run
   ```

## 📋 Próximos Passos

- [ ] Implementar feature de pets completa
- [ ] Adicionar testes unitários
- [ ] Implementar testes de integração
- [ ] Adicionar persistência local (Hive/SQLite)
- [ ] Implementar API real
- [ ] Adicionar feature de agendamentos
- [ ] Implementar notificações push

## 🧪 Testes

```bash
# Executar todos os testes
flutter test

# Executar testes com cobertura
flutter test --coverage
```

## 📝 Convenções de Código

- **Nomenclatura**: camelCase para variáveis e métodos, PascalCase para classes
- **Estrutura**: Um arquivo por classe
- **Imports**: Ordenados alfabeticamente
- **Documentação**: Dartdoc para APIs públicas
- **Commits**: Conventional Commits

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
