import 'package:flutter/material.dart';

import '../modelos/afirmacao.dart';

/// Guarda em memória as lições concluídas e atualiza as telas com setState.
///
/// Fica acima do MaterialApp para que o progresso sobreviva à navegação. Ele
/// se perde ao fechar o app, pois esta sprint não tem persistência.
class ProgressoTrilha extends StatefulWidget {
  const ProgressoTrilha({super.key, required this.child});

  final Widget child;

  static DadosProgresso of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DadosProgresso>()!;

  @override
  State<ProgressoTrilha> createState() => _ProgressoTrilhaState();
}

class _ProgressoTrilhaState extends State<ProgressoTrilha> {
  final Set<String> _concluidas = {};

  void _concluir(Afirmacao afirmacao) {
    setState(() => _concluidas.add(afirmacao.id));
  }

  @override
  Widget build(BuildContext context) {
    return DadosProgresso(
      concluidas: Set.unmodifiable(_concluidas),
      concluir: _concluir,
      child: widget.child,
    );
  }
}

/// Entrega o progresso às telas e as reconstrói quando ele muda.
class DadosProgresso extends InheritedWidget {
  const DadosProgresso({
    super.key,
    required this.concluidas,
    required this.concluir,
    required super.child,
  });

  final Set<String> concluidas;

  /// Marca a lição como concluída, tenha o participante acertado ou não.
  final ValueChanged<Afirmacao> concluir;

  bool estaConcluida(Afirmacao afirmacao) => concluidas.contains(afirmacao.id);

  int concluidasNoTema(Tema tema) => tema.afirmacoes.where(estaConcluida).length;

  @override
  bool updateShouldNotify(DadosProgresso oldWidget) =>
      oldWidget.concluidas.length != concluidas.length;
}
