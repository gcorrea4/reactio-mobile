import 'package:flutter/material.dart';

import '../dados/trilha_mock.dart';
import '../estilo/estilo_app.dart';
import '../rotas.dart';
import '../widgets/selo_revisar.dart';

/// Mostra o resultado da resposta, a classificação correta, a explicação e a
/// fonte. Errar leva à mesma explicação de quem acertou, sem penalidade.
class TelaExplicacao extends StatelessWidget {
  const TelaExplicacao({super.key, required this.argumentos});

  final ArgumentosExplicacao argumentos;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    final afirmacao = argumentos.afirmacao;
    final resposta = argumentos.resposta;
    final proxima = proximaAfirmacao(afirmacao);

    return Scaffold(
      appBar: AppBar(title: const Text('Explicação')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Espaco.m),
          children: [
            _CartaoResultado(acertou: resposta == afirmacao.classificacao),
            const SizedBox(height: Espaco.m),
            _Secao(
              titulo: 'Afirmação',
              children: [
                Text(afirmacao.enunciado, style: textos.titleMedium),
                if (afirmacao.aRevisar) ...[
                  const SizedBox(height: Espaco.s),
                  const SeloRevisar(),
                ],
              ],
            ),
            const SizedBox(height: Espaco.s),
            _Secao(
              titulo: 'Sua resposta',
              children: [Text(resposta.rotulo, style: textos.bodyLarge)],
            ),
            const SizedBox(height: Espaco.s),
            _Secao(
              titulo: 'Classificação correta',
              children: [
                Text(afirmacao.classificacao.rotulo, style: textos.titleMedium),
              ],
            ),
            const SizedBox(height: Espaco.s),
            _Secao(
              titulo: 'Explicação',
              children: [Text(afirmacao.explicacao, style: textos.bodyLarge)],
            ),
            const SizedBox(height: Espaco.s),
            _Secao(
              titulo: 'Fonte',
              children: [Text(afirmacao.fonte, style: textos.bodyMedium)],
            ),
            const SizedBox(height: Espaco.l),
            if (proxima != null) ...[
              FilledButton(
                onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  Rotas.desafio,
                  arguments: proxima,
                ),
                child: const Text('Próxima afirmação'),
              ),
              const SizedBox(height: Espaco.s),
            ],
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Voltar para o tema'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartaoResultado extends StatelessWidget {
  const _CartaoResultado({required this.acertou});

  final bool acertou;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    final cor = acertou ? CoresReactio.acerto : CoresReactio.errou;

    return Semantics(
      liveRegion: true,
      child: Container(
        padding: const EdgeInsets.all(Espaco.m),
        decoration: BoxDecoration(
          color: acertou ? CoresReactio.acertoFundo : CoresReactio.errouFundo,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: cor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              acertou ? Icons.check_circle_outline : Icons.lightbulb_outline,
              color: cor,
              size: 32,
            ),
            const SizedBox(width: Espaco.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    acertou ? 'Você acertou' : 'Você errou desta vez',
                    style: textos.titleLarge?.copyWith(color: cor),
                  ),
                  const SizedBox(height: Espaco.xs),
                  Text(
                    acertou
                        ? 'Leia a explicação para entender o porquê.'
                        : 'Faz parte do aprendizado. A explicação abaixo '
                              'mostra o porquê.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Secao extends StatelessWidget {
  const _Secao({required this.titulo, required this.children});

  final String titulo;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Espaco.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: CoresReactio.textoSecundario,
              ),
            ),
            const SizedBox(height: Espaco.xs),
            ...children,
          ],
        ),
      ),
    );
  }
}
