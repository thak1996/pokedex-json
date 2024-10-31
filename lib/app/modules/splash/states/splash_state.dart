abstract class SplashState {
  const SplashState();
}

class SplashInitialState extends SplashState {
  const SplashInitialState();
}

class SplashLoadingState extends SplashState {
  const SplashLoadingState();
}

class SplashSuccessState extends SplashState {
  const SplashSuccessState();
}

class SplashErrorState extends SplashState {
  final String message;
  const SplashErrorState(this.message);
} 