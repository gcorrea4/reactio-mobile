import 'package:flutter/material.dart';

import '../dados/trilha_mock.dart';
import '../estado/progresso_trilha.dart';
import '../estilo/estilo_app.dart';
import '../modelos/afirmacao.dart';
import '../rotas.dart';
import '../widgets/cartao_progresso.dart';

/// Lista os temas da trilha para o participante escolher por onde começar.
class TelaTrilha extends StatelessWidget {
  const TelaTrilha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trilha')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Espaco.m),
          children: [
            const CartaoProgresso(),
            const SizedBox(height: Espaco.l),
            Text('Temas', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: Espaco.s),
            for (final tema in temas) _CartaoTema(tema: tema),
          ],
        ),
      ),
    );
  }
}

class _CartaoTema extends StatelessWidget {
  const _CartaoTema({required this.tema});

  final Tema tema;

  @override
  Widget build(BuildContext context) {
    final concluidas = ProgressoTrilha.of(context).concluidasNoTema(tema);

    return Padding(
      padding: const EdgeInsets.only(bottom: Espaco.s),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Espaco.m,
            vertical: Espaco.s,
          ),
          leading: Icon(tema.icone, color: CoresReactio.petroleo, size: 32),
          title: Text(tema.nome),
          subtitle: Text(
            '${tema.descricao}\n'
            '$concluidas de ${tema.afirmacoes.length} lições concluídas',
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () =>
              Navigator.pushNamed(context, Rotas.tema, arguments: tema),
        ),
      ),
    );
  }
}
