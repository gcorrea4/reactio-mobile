import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactio/main.dart';

/// Rola até o widget e toca nele, para funcionar em qualquer tamanho de tela.
/// O ListView só constrói o que está perto da área visível.
Future<void> tocar(WidgetTester tester, Finder alvo) async {
  if (alvo.evaluate().isEmpty) {
    await tester.scrollUntilVisible(
      alvo,
      200,
      scrollable: find.byType(Scrollable).first,
    );
  }
  await tester.ensureVisible(alvo);
  await tester.pumpAndSettle();
  await tester.tap(alvo);
  await tester.pumpAndSettle();
}

Future<void> abrirAplicacoes(WidgetTester tester) async {
  await tester.pumpWidget(const ReactioApp());
  await tocar(tester, find.text('Começar a trilha'));
  await tocar(tester, find.text('Aplicações no cotidiano'));
}

void main() {
  testWidgets('resposta certa mostra acerto, explicação e fonte', (
    tester,
  ) async {
    await abrirAplicacoes(tester);
    await tocar(tester, find.text('Lição 1'));

    expect(
      find.text('Alimentos tratados por irradiação ficam radioativos.'),
      findsOneWidget,
    );
    expect(find.text('Verdadeiro'), findsOneWidget);
    expect(find.text('Falso'), findsOneWidget);
    expect(find.text('Depende do contexto'), findsOneWidget);

    await tocar(tester, find.text('Falso'));
    await tocar(tester, find.text('Responder'));

    expect(find.text('Você acertou'), findsOneWidget);
    final fonte = find.text('FDA, Food Irradiation: What You Need to Know');
    await tester.scrollUntilVisible(
      fonte,
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(fonte, findsOneWidget);
  });

  testWidgets('resposta errada mostra a classificação correta', (tester) async {
    await abrirAplicacoes(tester);
    await tocar(tester, find.text('Lição 1'));

    await tocar(tester, find.text('Verdadeiro'));
    await tocar(tester, find.text('Responder'));

    expect(find.text('Você errou desta vez'), findsOneWidget);
    expect(find.text('Sua resposta'), findsOneWidget);
    expect(find.text('Verdadeiro'), findsOneWidget);
    expect(find.text('Classificação correta'), findsOneWidget);
    expect(find.text('Falso'), findsOneWidget);
  });

  testWidgets('Responder fica desabilitado até escolher uma alternativa', (
    tester,
  ) async {
    await abrirAplicacoes(tester);
    await tocar(tester, find.text('Lição 1'));

    FilledButton botao() =>
        tester.widget(find.widgetWithText(FilledButton, 'Responder'));

    expect(botao().onPressed, isNull);
    await tocar(tester, find.text('Depende do contexto'));
    expect(botao().onPressed, isNotNull);
  });

  testWidgets('progresso sobe ao responder, mesmo errando, e não conta duas '
      'vezes a mesma lição', (tester) async {
    await abrirAplicacoes(tester);

    Future<void> responderLicaoUmErrando() async {
      await tocar(tester, find.text('Lição 1'));
      await tocar(tester, find.text('Verdadeiro'));
      await tocar(tester, find.text('Responder'));
      await tocar(tester, find.text('Voltar para o tema'));
    }

    expect(find.text('Concluída'), findsNothing);
    await responderLicaoUmErrando();
    expect(find.text('Concluída'), findsOneWidget);

    await responderLicaoUmErrando();
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Lições concluídas: 1 de 9'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Lições concluídas: 1 de 9'), findsOneWidget);
    expect(find.text('Continuar a trilha'), findsOneWidget);
  });

  testWidgets('Próxima afirmação avança e a última lição volta ao tema', (
    tester,
  ) async {
    await abrirAplicacoes(tester);
    await tocar(tester, find.text('Lição 3'));
    await tocar(tester, find.text('Falso'));
    await tocar(tester, find.text('Responder'));
    await tocar(tester, find.text('Próxima afirmação'));

    expect(
      find.text(
        'A radiação é um dos métodos usados para esterilizar dispositivos '
        'médicos.',
      ),
      findsOneWidget,
    );

    await tocar(tester, find.text('Verdadeiro'));
    await tocar(tester, find.text('Responder'));

    expect(find.text('Próxima afirmação'), findsNothing);
    await tocar(tester, find.text('Voltar para o tema'));
    expect(find.text('Lição 4'), findsOneWidget);
  });

  testWidgets('formulário valida os campos e confirma o envio com SnackBar', (
    tester,
  ) async {
    await tester.pumpWidget(const ReactioApp());
    await tocar(tester, find.text('Sugerir uma afirmação'));

    await tocar(tester, find.text('Enviar sugestão'));
    expect(find.text('Escreva o enunciado da afirmação.'), findsOneWidget);
    expect(find.text('Informe o tema da afirmação.'), findsOneWidget);

    final campos = find.byType(TextFormField);
    await tester.enterText(campos.first, 'Curta demais');
    await tester.enterText(campos.last, 'x');
    await tester.pump();
    expect(
      find.text('O enunciado precisa ter pelo menos 20 caracteres.'),
      findsOneWidget,
    );
    expect(
      find.text('O tema precisa ter pelo menos 3 caracteres.'),
      findsOneWidget,
    );

    await tester.enterText(
      campos.first,
      'Uma afirmação longa o bastante para passar na validação.',
    );
    await tester.enterText(campos.last, 'Aplicações');
    await tocar(tester, find.text('Enviar sugestão'));

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.textContaining('Obrigado pela sugestão'), findsOneWidget);
  });

  testWidgets('áreas de toque têm pelo menos 48 dp', (tester) async {
    await abrirAplicacoes(tester);
    await tocar(tester, find.text('Lição 1'));

    for (final rotulo in ['Verdadeiro', 'Falso', 'Depende do contexto']) {
      final area = find.ancestor(
        of: find.text(rotulo),
        matching: find.byType(InkWell),
      );
      expect(tester.getSize(area).height, greaterThanOrEqualTo(48));
    }
  });

  testWidgets('telas não estouram o layout com fonte do sistema em 200%', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.reset);
    addTearDown(tester.platformDispatcher.clearAllTestValues);

    await abrirAplicacoes(tester);
    await tocar(tester, find.text('Lição 1'));
    await tocar(tester, find.text('Falso'));
    await tocar(tester, find.text('Responder'));
    await tocar(tester, find.text('Próxima afirmação'));

    expect(tester.takeException(), isNull);
  });
}
