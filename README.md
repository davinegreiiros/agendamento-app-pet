# Agenda Pet Saúde

Um aplicativo Flutter para agendamento e cuidados de pets, desenvolvido seguindo os princípios de **Clean Architecture** e **Clean Code**.

## 🏗️ Arquitetura

O projeto segue os princípios da **Clean Architecture** com separação clara de responsabilidades:

```
lib/
├── core/                          # Código compartilhado
│   ├── constants/                 # Constantes da aplicação
│   ├── di/                       # Injeção de dependências
│   └── validators/               # Validações centralizadas
├── features/                     # Features da aplicação
│   ├── auth/                     # Feature de autenticação
│   │   ├── data/                 # Camada de dados
│   │   │   ├── datasources/      # Fontes de dados (API, Local)
│   │   │   └── repositories/     # Implementação dos repositories
│   │   ├── domain/               # Camada de domínio
│   │   │   ├── entities/         # Entidades de negócio
│   │   │   ├── repositories/     # Contratos dos repositories
│   │   │   └── usecases/         # Casos de uso
│   │   └── presentation/         # Camada de apresentação
│   │       ├── bloc/            # Gerenciamento de estado
│   │       ├── pages/           # Telas
│   │       └── widgets/         # Widgets específicos
│   └── pets/                    # Feature de pets
│       ├── data/
│       ├── domain/
│       └── presentation/
├── shared/                       # Código compartilhado entre features
│   ├── constants/               # Constantes compartilhadas
│   ├── errors/                 # Tratamento de erros
│   └── presentation/           # Widgets e temas compartilhados
└── pet_flow/                    # Fluxo principal da aplicação
    ├── account/                # Página de conta
    ├── auth/                   # Páginas de autenticação
    ├── core_widgets/          # Widgets principais
    ├── home/                  # Página inicial
    ├── onboarding/            # Página de onboarding
    └── pet_details/           # Detalhes do pet
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
- BLoC para autenticação
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
