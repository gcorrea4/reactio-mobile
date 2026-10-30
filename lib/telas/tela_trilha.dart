import 'package:flutter/material.dart';

import '../estilo/estilo_app.dart';

/// Lista os temas da trilha para o participante escolher por onde começar.
class TelaTrilha extends StatelessWidget {
  const TelaTrilha({super.key});

  static const _temas = [
    (
      nome: 'Radiação no cotidiano',
      descricao: 'De onde vem a radiação que nos cerca.',
      icone: Icons.wb_sunny_outlined,
    ),
    (
      nome: 'Aplicações no cotidiano',
      descricao: 'Usos em alimentos e na saúde.',
      icone: Icons.biotech_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trilha')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Espaco.m),
          children: [
            Text('Temas', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: Espaco.s),
            for (final tema in _temas)
              Padding(
                padding: const EdgeInsets.only(bottom: Espaco.s),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: Espaco.m,
                      vertical: Espaco.s,
                    ),
                    leading: Icon(
                      tema.icone,
                      color: CoresReactio.petroleo,
                      size: 32,
                    ),
                    title: Text(tema.nome),
                    subtitle: Text(tema.descricao),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
