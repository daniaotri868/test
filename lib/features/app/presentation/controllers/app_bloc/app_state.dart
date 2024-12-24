part of 'app_bloc.dart';

@immutable
class AppState {
  final PageState initialRequestStatus;
  final bool isToken;

  const AppState({
    this.language,
    this.mode = ThemeMode.light,
    this.initialRequestStatus = const PageState.init(),
    this.isToken=true
  });

  final String? language;
  final ThemeMode mode;

  AppState copyWith({
    String? language,
    ThemeMode? mode,
    final PageState? initialRequestStatus,
    final PageState? refreshToken,
    final bool? isToken
  }) {
    return AppState(
      language: language ?? this.language,
      mode: mode ?? this.mode,
      initialRequestStatus: initialRequestStatus ?? this.initialRequestStatus,
        isToken: isToken??this.isToken
    );
  }
}
