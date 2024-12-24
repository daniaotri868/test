part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class ChangeTheme extends AppEvent {
  ChangeTheme(this.themeMode);

  final ThemeMode themeMode;
}

class LanguageChanged extends AppEvent {
  LanguageChanged({required this.language});

  final String language;
}

class ChangeBasePage extends AppEvent {
  ChangeBasePage(this.index);

  final int index;
}

class ResetAfterLogout extends AppEvent {}

class RemoveDeliveredOrder extends AppEvent {}

class InitialRequestEvent extends AppEvent {
  InitialRequestEvent();
}

class SetStatusToken extends AppEvent {
  final bool isToken;
  SetStatusToken(this.isToken);
}