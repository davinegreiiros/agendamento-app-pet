# Agenda Pet Saúde

Aplicativo Flutter para agendamento e cuidados de pets, desenvolvido com **Clean Architecture**, **BLoC** e **Clean Code**.

---

## Arquitetura

O projeto segue Clean Architecture com separação estrita entre camadas. Cada feature é organizada em três camadas independentes:

```text
feature/
├── data/          → datasources, models, repository impl
├── domain/        → entities, repository contracts, use cases
└── presentation/  → BLoC, pages, widgets
```

### Princípios arquiteturais aplicados

| Princípio | Implementação |
| --- | --- |
| **Inversão de dependência** | `domain` não conhece `data` — define apenas contratos (abstrações) |
| **Composição sobre herança** | `UserModel` e `PetModel` são classes independentes com `toEntity()` — não herdam das entidades |
| **Isolamento da camada de dados** | Datasources trafegam apenas `*Model`; o repositório faz a tradução `Model → Entity` na borda |
| **Erros centralizados** | `Failure` e subclasses vivem em `core/errors/failures.dart` |
| **Roteamento declarativo** | Todas as rotas registradas em `AppRoutes` e no `MaterialApp` |

---

## Estrutura de pastas

```text
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── di/
│   │   └── dependency_injection.dart       # Composição de BLoCs, repositórios e datasources
│   ├── errors/
│   │   └── failures.dart                   # Failure, AuthFailure, NetworkFailure, etc.
│   └── validators/
│       └── validators.dart
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── auth_local_datasource.dart   # Contrato + Mock (UserModel)
│   │   │   │   └── auth_remote_datasource.dart  # Contrato + Mock (UserModel)
│   │   │   ├── models/
│   │   │   │   └── user_model.dart              # Composição — toEntity() / fromEntity()
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart    # Traduz UserModel → User na borda
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user.dart
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart         # Contrato abstrato
│   │   │   └── usecases/
│   │   │       ├── get_current_user.dart
│   │   │       ├── reset_password.dart
│   │   │       ├── sign_in_with_email.dart
│   │   │       ├── sign_in_with_facebook.dart
│   │   │       ├── sign_in_with_google.dart
│   │   │       ├── sign_out.dart
│   │   │       └── sign_up.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── auth_bloc.dart
│   │       │   ├── auth_event.dart
│   │       │   └── auth_state.dart
│   │       ├── pages/
│   │       │   ├── login_page.dart
│   │       │   ├── register_page.dart
│   │       │   └── forgot_password_page.dart
│   │       └── widgets/
│   │           ├── auth_scaffold.dart
│   │           └── custom_text_field.dart
│   │
│   ├── pets/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── pet_local_datasource.dart    # Contrato + Mock (PetModel)
│   │   │   │   └── pet_remote_datasource.dart   # Contrato + Mock (PetModel)
│   │   │   ├── models/
│   │   │   │   └── pet_model.dart               # Composição — toEntity() / fromEntity()
│   │   │   └── repositories/
│   │   │       └── pet_repository_impl.dart     # Traduz PetModel → Pet na borda
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── pet.dart
│   │   │   ├── repositories/
│   │   │   │   └── pet_repository.dart          # Contrato abstrato
│   │   │   └── usecases/
│   │   │       ├── create_pet.dart
│   │   │       ├── delete_pet.dart
│   │   │       ├── get_pet_by_id.dart
│   │   │       ├── get_pets_by_owner.dart
│   │   │       └── update_pet.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── pet_bloc.dart
│   │       │   ├── pet_event.dart
│   │       │   └── pet_state.dart
│   │       └── pages/
│   │           ├── pets_list_page.dart
│   │           └── pet_details_page.dart
│   │
│   ├── home/
│   │   └── presentation/pages/home_page.dart
│   │
│   ├── account/
│   │   └── presentation/pages/account_page.dart
│   │
│   └── onboarding/
│       └── presentation/pages/onboarding_page.dart
│
├── shared/
│   ├── constants/
│   │   └── app_routes.dart                      # Todas as rotas da aplicação
│   ├── errors/
│   │   └── failures.dart                        # Re-export de core/errors/failures.dart
│   └── presentation/
│       ├── theme/
│       │   ├── app_colors.dart
│       │   ├── app_text_styles.dart
│       │   ├── app_spacing.dart
│       │   └── app_border_radius.dart
│       └── widgets/
│           └── buttons/
│               ├── primary_button.dart
│               ├── secondary_button.dart
│               ├── social_button_base.dart
│               ├── social_buttons_row.dart
│               ├── google_buttons.dart
│               ├── facebook_buttons.dart
│               └── index.dart
│
├── main.dart
├── main_navigation.dart
└── pet_app.dart                                 # Composição de rotas e providers
```

---

## Fluxo de dados

```text
Presentation  →  UseCase  →  Repository (contrato)
                                    ↓
                             RepositoryImpl
                            ↙            ↘
               RemoteDataSource     LocalDataSource
               (retorna Model)      (retorna Model)
                            ↘            ↙
                         .toEntity()  ← tradução aqui
                                ↓
                           Entity → Presentation
```

---

## Tecnologias

| Pacote | Uso |
| --- | --- |
| `flutter_bloc` | Gerenciamento de estado |
| `dartz` | Programação funcional (`Either<Failure, T>`) |
| `equatable` | Comparação de entidades e estados |
| `google_fonts` | Tipografia |
| `flutter_svg` | Ícones SVG |

---

## Features implementadas

### Onboarding

- Tela de boas-vindas com apresentação do app

### Autenticação

- Login com e-mail e senha
- Login social (Google, Apple)
- Cadastro de usuário
- Recuperação de senha
- Logout

### Pets

- Listagem de pets por dono
- Detalhes do pet (raça, idade, tipo, gênero)
- CRUD completo via BLoC (create, read, update, delete)
- Cache local via datasource

### Navegação

- Bottom navigation bar (Home, Pets, Agenda, Conta)
- Roteamento declarativo com `AppRoutes`

---

## Como executar

```bash
# Instalar dependências
flutter pub get

# Executar o app
flutter run

# Rodar testes
flutter test

# Testes com cobertura
flutter test --coverage
```

---

## Próximos passos

- [ ] Telas de cadastro e recuperação de senha (UI)
- [ ] Implementar datasources reais (Firebase / REST API)
- [ ] Persistência local com Hive ou SQLite
- [ ] Feature de agendamentos (CRUD + BLoC)
- [ ] Testes unitários — use cases, repositórios, BLoCs
- [ ] Notificações push

---

## Convenções

- **Nomenclatura**: `camelCase` para variáveis/métodos, `PascalCase` para classes
- **Commits**: Conventional Commits (`feat:`, `fix:`, `refactor:`, etc.)
- **Um arquivo por classe**
- **Imports**: sempre por pacote (`package:agendamento_pet_app/...`)
