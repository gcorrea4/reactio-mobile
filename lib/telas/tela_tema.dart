import 'package:flutter/material.dart';

import '../estado/progresso_trilha.dart';
import '../estilo/estilo_app.dart';
import '../modelos/afirmacao.dart';
import '../rotas.dart';

/// Mostra as lições de um tema para o participante escolher qual responder.
class TelaTema extends StatelessWidget {
  const TelaTema({super.key, required this.tema});

  final Tema tema;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    final progresso = ProgressoTrilha.of(context);
    // As células acompanham o tamanho de fonte do sistema.
    final escala = MediaQuery.textScalerOf(context);

    return Scaffold(
      appBar: AppBar(title: Text(tema.nome)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(Espaco.m),
              child: Text(
                '${tema.descricao} ${progresso.concluidasNoTema(tema)} de '
                '${tema.afirmacoes.length} lições concluídas.',
                style: textos.bodyLarge,
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(
                  Espaco.m,
                  0,
                  Espaco.m,
                  Espaco.m,
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: escala.scale(200),
                  mainAxisExtent: escala.scale(96),
                  crossAxisSpacing: Espaco.s,
                  mainAxisSpacing: Espaco.s,
                ),
                itemCount: tema.afirmacoes.length,
                itemBuilder: (context, indice) {
                  final afirmacao = tema.afirmacoes[indice];
                  return _CartaoLicao(
                    numero: indice + 1,
                    concluida: progresso.estaConcluida(afirmacao),
                    onTap: () => Navigator.pushNamed(
                      context,
                      Rotas.desafio,
                      arguments: afirmacao,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartaoLicao extends StatelessWidget {
  const _CartaoLicao({
    required this.numero,
    required this.concluida,
    required this.onTap,
  });

  final int numero;
  final bool concluida;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Espaco.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lição $numero', style: textos.titleMedium),
              const SizedBox(height: Espaco.xs),
              Row(
                children: [
                  Icon(
                    concluida
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    size: 18,
                    color: concluida
                        ? CoresReactio.acerto
                        : CoresReactio.textoSecundario,
                  ),
                  const SizedBox(width: Espaco.xs),
                  Expanded(
                    child: Text(
                      concluida ? 'Concluída' : 'Não iniciada',
                      style: textos.bodySmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
