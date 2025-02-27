part of 'app_theme.dart';

extension AppThemeExtension on AppTheme {
  ///dark
  ThemeData get darkTheme => ThemeData(

      /// to set background color for BottomNavigation  see [https://stackoverflow.com/questions/49307858/style-bottomnavigationbar-in-flutter]
      canvasColor: darkColorScheme.surface,
      brightness: Brightness.dark,
      colorScheme: darkColorScheme,
      textTheme: textTheme,
      primaryColor: darkColorScheme.primary,
      useMaterial3: true,
      tabBarTheme: tabBarTheme(darkColorScheme),
      scaffoldBackgroundColor: darkColorScheme.surface,
      floatingActionButtonTheme: floatingActionButtonTheme(isDark: true),
      textButtonTheme: textButtonTheme(isDark: true),
      elevatedButtonTheme: elevatedButtonTheme(darkColorScheme),
      outlinedButtonTheme: outlinedButtonTheme(isDark: true),
      checkboxTheme: checkboxThemeData(isDark: true),
      chipTheme: chipTheme(darkColorScheme),
      appBarTheme: appBarTheme(darkColorScheme),
      iconTheme: iconTheme(darkColorScheme),
      bottomSheetTheme: bottomSheetTheme(isDark: true),
      cardTheme: cardTheme(darkColorScheme),
      filledButtonTheme: filledButtonTheme(isDark: true),
      dialogTheme: dialogTheme(isDark: true),
      listTileTheme: listTileTheme(isDark: true),
      bottomNavigationBarTheme: bottomNavigationBarTheme(darkColorScheme),
      navigationBarTheme: navigationBarTheme(isDark: true),
      dividerTheme: dividerTheme(darkColorScheme));

  ///light
  ThemeData get lightTheme => ThemeData(
        /// to set background color for BottomNavigation see  [https://stackoverflow.com/questions/49307858/style-bottomnavigationbar-in-flutter]
        canvasColor: lightColorScheme.surface,
        brightness: Brightness.light,
        primaryColor: lightColorScheme.primary,
        scaffoldBackgroundColor: lightColorScheme.surface,
        useMaterial3: true,
        tabBarTheme: tabBarTheme(lightColorScheme),
        textTheme: textTheme,
        colorScheme: lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonTheme(isDark: false),
        textButtonTheme: textButtonTheme(isDark: false),
        elevatedButtonTheme: elevatedButtonTheme(lightColorScheme),
        outlinedButtonTheme: outlinedButtonTheme(isDark: false),
        checkboxTheme: checkboxThemeData(isDark: false),
        chipTheme: chipTheme(lightColorScheme),
        appBarTheme: appBarTheme(lightColorScheme),
        iconTheme: iconTheme(lightColorScheme),
        bottomSheetTheme: bottomSheetTheme(isDark: false),
        cardTheme: cardTheme(lightColorScheme),
        bottomNavigationBarTheme: bottomNavigationBarTheme(lightColorScheme),
        filledButtonTheme: filledButtonTheme(isDark: false),
        dialogTheme: dialogTheme(isDark: false),
        listTileTheme: listTileTheme(isDark: false),
        navigationBarTheme: navigationBarTheme(isDark: false),
        dividerTheme: dividerTheme(lightColorScheme),
      );
}
