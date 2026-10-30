import 'package:flutter/material.dart';

import '../estilo/estilo_app.dart';
import '../modelos/afirmacao.dart';
import '../rotas.dart';
import '../widgets/selo_revisar.dart';

/// Apresenta a afirmação e as três alternativas. Não há limite de tempo.
class TelaDesafio extends StatefulWidget {
  const TelaDesafio({super.key, required this.afirmacao});

  final Afirmacao afirmacao;

  @override
  State<TelaDesafio> createState() => _TelaDesafioState();
}

class _TelaDesafioState extends State<TelaDesafio> {
  Classificacao? _resposta;

  void _responder() {
    Navigator.pushReplacementNamed(context, Rotas.explicacao);
  }

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    final afirmacao = widget.afirmacao;

    return Scaffold(
      appBar: AppBar(title: const Text('Desafio')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Espaco.m),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(Espaco.m),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Afirmação', style: textos.labelLarge),
                    const SizedBox(height: Espaco.s),
                    Text(afirmacao.enunciado, style: textos.titleLarge),
                    if (afirmacao.aRevisar) ...[
                      const SizedBox(height: Espaco.m),
                      const SeloRevisar(),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: Espaco.l),
            Text('Como você classifica?', style: textos.titleMedium),
            const SizedBox(height: Espaco.s),
            for (final alternativa in Classificacao.values)
              _CartaoAlternativa(
                rotulo: alternativa.rotulo,
                selecionada: _resposta == alternativa,
                onTap: () => setState(() => _resposta = alternativa),
              ),
            const SizedBox(height: Espaco.m),
            FilledButton(
              onPressed: _resposta == null ? null : _responder,
              child: const Text('Responder'),
            ),
            if (_resposta == null) ...[
              const SizedBox(height: Espaco.s),
              Text(
                'Escolha uma alternativa para responder.',
                style: textos.bodyMedium?.copyWith(
                  color: CoresReactio.textoSecundario,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _CartaoAlternativa extends StatelessWidget {
  const _CartaoAlternativa({
    required this.rotulo,
    required this.selecionada,
    required this.onTap,
  });

  final String rotulo;
  final bool selecionada;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Espaco.s),
      child: Semantics(
        inMutuallyExclusiveGroup: true,
        selected: selecionada,
        child: Card(
          color: selecionada
              ? CoresReactio.petroleoClaro
              : CoresReactio.superficie,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            side: BorderSide(
              color: selecionada ? CoresReactio.petroleo : CoresReactio.borda,
              width: selecionada ? 2 : 1,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: EstiloApp.alturaBotao,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Espaco.m,
                  vertical: Espaco.s,
                ),
                child: Row(
                  children: [
                    Icon(
                      selecionada
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: CoresReactio.petroleo,
                    ),
                    const SizedBox(width: Espaco.m),
                    Expanded(
                      child: Text(
                        rotulo,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
