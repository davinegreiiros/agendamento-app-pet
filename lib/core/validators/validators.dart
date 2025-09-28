class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, digite seu e-mail';
    }

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Digite um e-mail válido';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, digite sua senha';
    }

    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }

    return null;
  }

  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Por favor, digite $fieldName';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, digite seu nome';
    }

    if (value.length < 2) {
      return 'O nome deve ter pelo menos 2 caracteres';
    }

    return null;
  }

  static String? validatePetName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, digite o nome do pet';
    }

    if (value.length < 2) {
      return 'O nome do pet deve ter pelo menos 2 caracteres';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, digite seu telefone';
    }

    final phoneRegex =
        RegExp(r'^\(?[1-9]{2}\)? ?(?:[2-8]|9[1-9])[0-9]{3}-?[0-9]{4}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Digite um telefone válido';
    }

    return null;
  }
}
