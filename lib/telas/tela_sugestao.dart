import 'package:flutter/material.dart';

import '../estilo/estilo_app.dart';

/// Formulário para o participante sugerir uma nova afirmação.
class TelaSugestao extends StatefulWidget {
  const TelaSugestao({super.key});

  @override
  State<TelaSugestao> createState() => _TelaSugestaoState();
}

class _TelaSugestaoState extends State<TelaSugestao> {
  static const _minimoEnunciado = 20;
  static const _maximoEnunciado = 200;
  static const _minimoTema = 3;

  final _formulario = GlobalKey<FormState>();

  String? _validarEnunciado(String? valor) {
    final texto = valor?.trim() ?? '';
    if (texto.isEmpty) return 'Escreva o enunciado da afirmação.';
    if (texto.length < _minimoEnunciado) {
      return 'O enunciado precisa ter pelo menos $_minimoEnunciado caracteres.';
    }
    return null;
  }

  String? _validarTema(String? valor) {
    final texto = valor?.trim() ?? '';
    if (texto.isEmpty) return 'Informe o tema da afirmação.';
    if (texto.length < _minimoTema) {
      return 'O tema precisa ter pelo menos $_minimoTema caracteres.';
    }
    return null;
  }

  void _enviar() {
    if (!_formulario.currentState!.validate()) return;
    _formulario.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sugerir uma afirmação')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Espaco.m),
          child: Form(
            key: _formulario,
            autovalidateMode: AutovalidateMode.onUserInteractionIfError,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Tem uma afirmação que merece virar lição? Escreva de um '
                  'jeito que possa ser conferido em uma fonte institucional.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: Espaco.l),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enunciado',
                    hintText: 'Ex.: Alimentos irradiados ficam radioativos.',
                  ),
                  minLines: 3,
                  maxLines: 5,
                  maxLength: _maximoEnunciado,
                  textCapitalization: TextCapitalization.sentences,
                  validator: _validarEnunciado,
                ),
                const SizedBox(height: Espaco.m),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Tema',
                    hintText: 'Ex.: Aplicações no cotidiano',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.done,
                  validator: _validarTema,
                  onFieldSubmitted: (_) => _enviar(),
                ),
                const SizedBox(height: Espaco.l),
                FilledButton(
                  onPressed: _enviar,
                  child: const Text('Enviar sugestão'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
