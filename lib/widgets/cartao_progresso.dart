import 'package:flutter/material.dart';

import '../dados/trilha_mock.dart';
import '../estado/progresso_trilha.dart';
import '../estilo/estilo_app.dart';

/// Mostra quantas lições da trilha já foram concluídas.
class CartaoProgresso extends StatelessWidget {
  const CartaoProgresso({super.key});

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    final concluidas = ProgressoTrilha.of(context).concluidas.length;
    final total = totalDeLicoes;

    return Card(
      color: CoresReactio.petroleoClaro,
      child: Padding(
        padding: const EdgeInsets.all(Espaco.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lições concluídas: $concluidas de $total',
              style: textos.titleMedium,
            ),
            const SizedBox(height: Espaco.s),
            // O texto acima já informa o valor para leitores de tela.
            ExcludeSemantics(
              child: LinearProgressIndicator(
                value: concluidas / total,
                minHeight: Espaco.s,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                backgroundColor: CoresReactio.superficie,
              ),
            ),
            if (concluidas == total) ...[
              const SizedBox(height: Espaco.s),
              Text('Você concluiu toda a trilha.', style: textos.bodyMedium),
            ],
          ],
        ),
      ),
    );
  }
}
