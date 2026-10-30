import 'package:flutter/material.dart';

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
    // A altura das células acompanha o tamanho de fonte do sistema.
    final alturaCelula = MediaQuery.textScalerOf(context).scale(96);

    return Scaffold(
      appBar: AppBar(title: Text(tema.nome)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(Espaco.m),
              child: Text(tema.descricao, style: textos.bodyLarge),
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
                  maxCrossAxisExtent: 240,
                  mainAxisExtent: alturaCelula,
                  crossAxisSpacing: Espaco.s,
                  mainAxisSpacing: Espaco.s,
                ),
                itemCount: tema.afirmacoes.length,
                itemBuilder: (context, indice) => _CartaoLicao(
                  numero: indice + 1,
                  onTap: () => Navigator.pushNamed(
                    context,
                    Rotas.desafio,
                    arguments: tema.afirmacoes[indice],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartaoLicao extends StatelessWidget {
  const _CartaoLicao({required this.numero, required this.onTap});

  final int numero;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Espaco.m),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Lição $numero',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
