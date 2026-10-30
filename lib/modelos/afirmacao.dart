import 'package:flutter/material.dart';

/// As três classificações possíveis de uma afirmação.
enum Classificacao {
  verdadeiro('Verdadeiro'),
  falso('Falso'),
  depende('Depende do contexto');

  const Classificacao(this.rotulo);

  final String rotulo;
}

class Afirmacao {
  const Afirmacao({
    required this.id,
    required this.enunciado,
    required this.classificacao,
    required this.explicacao,
    required this.fonte,
    this.aRevisar = false,
  });

  final String id;
  final String enunciado;
  final Classificacao classificacao;
  final String explicacao;
  final String fonte;

  /// Indica que o texto ainda precisa da revisão da equipe.
  final bool aRevisar;
}

class Tema {
  const Tema({
    required this.nome,
    required this.descricao,
    required this.icone,
    required this.afirmacoes,
  });

  final String nome;
  final String descricao;
  final IconData icone;
  final List<Afirmacao> afirmacoes;
}
