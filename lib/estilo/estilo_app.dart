import 'package:flutter/material.dart';

/// Paleta do REACTIO. Os pares de texto e fundo têm contraste de pelo menos
/// 4,5:1, e nenhuma informação depende só da cor.
abstract final class CoresReactio {
  static const petroleo = Color(0xFF0B4F5C);
  static const petroleoClaro = Color(0xFFD7ECEF);
  static const ambar = Color(0xFF9A5B00);
  static const fundo = Color(0xFFF5F7F6);
  static const superficie = Color(0xFFFFFFFF);
  static const texto = Color(0xFF14242A);
  static const textoSecundario = Color(0xFF47595F);
  static const borda = Color(0xFFC4D0D3);

  static const acerto = Color(0xFF1B6E43);
  static const acertoFundo = Color(0xFFE3F3EA);
  static const errou = Color(0xFF8A4B00);
  static const errouFundo = Color(0xFFFFF1DF);
}

/// Escala de espaçamentos usada em todas as telas.
abstract final class Espaco {
  static const double xs = 4;
  static const double s = 8;
  static const double m = 16;
  static const double l = 24;
  static const double xl = 32;
}

/// Tema Material 3 do app.
abstract final class EstiloApp {
  /// Altura mínima dos botões, acima dos 48 dp exigidos para áreas de toque.
  static const double alturaBotao = 52;

  static ThemeData get tema {
    final esquema = ColorScheme.fromSeed(
      seedColor: CoresReactio.petroleo,
      primary: CoresReactio.petroleo,
      onPrimary: Colors.white,
      primaryContainer: CoresReactio.petroleoClaro,
      onPrimaryContainer: CoresReactio.petroleo,
      secondary: CoresReactio.ambar,
      onSecondary: Colors.white,
      surface: CoresReactio.superficie,
      onSurface: CoresReactio.texto,
      onSurfaceVariant: CoresReactio.textoSecundario,
      outline: CoresReactio.borda,
    );

    const formaPadrao = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: esquema,
      scaffoldBackgroundColor: CoresReactio.fundo,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
        titleLarge: TextStyle(fontWeight: FontWeight.w600, height: 1.3),
        titleMedium: TextStyle(fontWeight: FontWeight.w600, height: 1.3),
        bodyLarge: TextStyle(height: 1.45),
        bodyMedium: TextStyle(height: 1.45),
      ).apply(bodyColor: CoresReactio.texto, displayColor: CoresReactio.texto),
      appBarTheme: const AppBarTheme(
        backgroundColor: CoresReactio.petroleo,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      cardTheme: const CardThemeData(
        color: CoresReactio.superficie,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: CoresReactio.borda),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(alturaBotao),
          shape: formaPadrao,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(alturaBotao),
          shape: formaPadrao,
          side: const BorderSide(color: CoresReactio.petroleo),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        alignLabelWithHint: true,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
