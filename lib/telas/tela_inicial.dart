import 'package:flutter/material.dart';

import '../estilo/estilo_app.dart';
import '../rotas.dart';

/// Apresenta o REACTIO e leva para a trilha ou para o formulário de sugestão.
class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('REACTIO')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Espaco.l),
          children: [
            Image.asset(
              'assets/imagens/logo_reactio.png',
              height: 120,
              semanticLabel: 'Logo do REACTIO: um átomo',
            ),
            const SizedBox(height: Espaco.m),
            Text(
              'Tecnologia nuclear em microlições',
              style: textos.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Espaco.s),
            Text(
              'Avalie afirmações do dia a dia e descubra o que dizem '
              'as fontes institucionais.',
              style: textos.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Espaco.l),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(Espaco.m),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Como funciona', style: textos.titleMedium),
                    const SizedBox(height: Espaco.m),
                    const _Passo(
                      icone: Icons.route_outlined,
                      texto: 'Escolha um tema da trilha.',
                    ),
                    const _Passo(
                      icone: Icons.help_outline,
                      texto:
                          'Responda: Verdadeiro, Falso ou Depende do contexto.',
                    ),
                    const _Passo(
                      icone: Icons.menu_book_outlined,
                      texto:
                          'Leia a explicação e a fonte, tenha acertado ou não.',
                    ),
                    const _Passo(
                      icone: Icons.self_improvement_outlined,
                      texto: 'Sem cronômetro: responda no seu ritmo.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: Espaco.l),
            FilledButton.icon(
              onPressed: () => Navigator.pushNamed(context, Rotas.trilha),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Começar a trilha'),
            ),
            const SizedBox(height: Espaco.s),
            OutlinedButton.icon(
              onPressed: () => Navigator.pushNamed(context, Rotas.sugestao),
              icon: const Icon(Icons.edit_note),
              label: const Text('Sugerir uma afirmação'),
            ),
            const SizedBox(height: Espaco.l),
            Text(
              'Projeto acadêmico do Challenge FIAP 2026, com a Marinha do '
              'Brasil / CTMSP (AMAZUL) como parceiro.',
              style: textos.bodySmall?.copyWith(
                color: CoresReactio.textoSecundario,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _Passo extends StatelessWidget {
  const _Passo({required this.icone, required this.texto});

  final IconData icone;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Espaco.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: CoresReactio.petroleo),
          const SizedBox(width: Espaco.m),
          Expanded(child: Text(texto)),
        ],
      ),
    );
  }
}
