import 'package:flutter/material.dart';

import '../estilo/estilo_app.dart';

/// Avisa que o texto da afirmação ainda não passou pela revisão da equipe.
class SeloRevisar extends StatelessWidget {
  const SeloRevisar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Espaco.s,
        vertical: Espaco.xs,
      ),
      decoration: const BoxDecoration(
        color: CoresReactio.errouFundo,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.rate_review_outlined,
            size: 18,
            color: CoresReactio.ambar,
          ),
          const SizedBox(width: Espaco.xs),
          Flexible(
            child: Text(
              'Texto a revisar',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: CoresReactio.ambar,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
