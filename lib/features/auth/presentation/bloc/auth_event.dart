abstract class AuthEvent {
  const AuthEvent();
}

class AuthStarted extends AuthEvent {
  const AuthStarted();
}

class SignInWithEmailRequested extends AuthEvent {
  const SignInWithEmailRequested({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  List<Object> get props => [email, password];
}

class SignInWithGoogleRequested extends AuthEvent {
  const SignInWithGoogleRequested();
}

class SignInWithFacebookRequested extends AuthEvent {
  const SignInWithFacebookRequested();
}

class SignUpRequested extends AuthEvent {
  const SignUpRequested({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  List<Object> get props => [name, email, password];
}

class SignOutRequested extends AuthEvent {
  const SignOutRequested();
}

class ResetPasswordRequested extends AuthEvent {
  const ResetPasswordRequested(this.email);

  final String email;

  List<Object> get props => [email];
}
