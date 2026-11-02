import 'package:flutter/material.dart';

import '../modelos/afirmacao.dart';

/// Dados mockados da trilha, mantidos em memória nesta sprint.
///
/// Uma afirmação nova, ainda sem revisão, deve usar `aRevisar: true` para o
/// app exibir o selo "Texto a revisar".
const List<Tema> temas = [
  Tema(
    nome: 'Radiação no cotidiano',
    descricao: 'De onde vem a radiação que nos cerca.',
    icone: Icons.wb_sunny_outlined,
    afirmacoes: [
      Afirmacao(
        id: 'radiacao-1',
        enunciado: 'Todos os seres vivos estão expostos a alguma radiação.',
        classificacao: Classificacao.verdadeiro,
        explicacao:
            'Os seres vivos sempre estiveram expostos à radiação, e isso '
            'continua acontecendo. Parte dela vem de fontes naturais do '
            'ambiente.',
        fonte: 'NRC, Sources of Radiation',
      ),
      Afirmacao(
        id: 'radiacao-2',
        enunciado:
            'Toda a radiação a que estamos expostos vem de fontes criadas '
            'pelo ser humano.',
        classificacao: Classificacao.falso,
        explicacao:
            'Existem fontes naturais e fontes criadas pelo ser humano. O '
            'radônio e a radiação cósmica são exemplos de fontes naturais.',
        fonte: 'EPA, Radiation Sources and Doses',
      ),
      Afirmacao(
        id: 'radiacao-3',
        enunciado:
            'A exposição à radiação cósmica é a mesma em qualquer altitude.',
        classificacao: Classificacao.falso,
        explicacao:
            'Os níveis aumentam em altitudes maiores, porque a atmosfera '
            'oferece menos proteção contra a radiação cósmica.',
        fonte: 'EPA, Radiation Sources and Doses',
      ),
      Afirmacao(
        id: 'radiacao-4',
        enunciado:
            'O radônio é um gás radioativo que pode estar presente dentro de '
            'casa.',
        classificacao: Classificacao.verdadeiro,
        explicacao:
            'O radônio é um gás radioativo, e a fonte trata as casas como um '
            'local de exposição. Ela também cita a recomendação de testar as '
            'residências para conhecer o nível presente.',
        fonte: 'EPA, Health Risk of Radon',
      ),
      Afirmacao(
        id: 'radiacao-5',
        enunciado:
            'Alimentos e água podem conter material radioativo de origem '
            'natural.',
        classificacao: Classificacao.verdadeiro,
        explicacao:
            'O potássio-40, um exemplo de material radioativo natural, está '
            'presente em alimentos, no solo e na água.',
        fonte: 'EPA, Radiation Sources and Doses',
      ),
    ],
  ),
  Tema(
    nome: 'Aplicações no cotidiano',
    descricao: 'Usos em alimentos e na saúde.',
    icone: Icons.biotech_outlined,
    afirmacoes: [
      Afirmacao(
        id: 'aplicacoes-1',
        enunciado: 'Alimentos tratados por irradiação ficam radioativos.',
        classificacao: Classificacao.falso,
        explicacao:
            'Nas condições aprovadas, o tratamento não torna o alimento '
            'radioativo. A irradiação também não substitui os cuidados de '
            'higiene e conservação.',
        fonte: 'FDA, Food Irradiation: What You Need to Know',
      ),
      Afirmacao(
        id: 'aplicacoes-2',
        enunciado:
            'Um alimento irradiado é adequado para armazenamento sem '
            'refrigeração.',
        classificacao: Classificacao.depende,
        explicacao:
            'A fonte descreve esse resultado para alimentos esterilizados '
            'por irradiação, não para todo produto irradiado. Siga as '
            'condições de conservação do produto.',
        fonte: 'FDA, Food Irradiation: What You Need to Know',
      ),
      Afirmacao(
        id: 'aplicacoes-3',
        enunciado:
            'Um exame de imagem médica expõe o paciente à radiação ionizante.',
        classificacao: Classificacao.depende,
        explicacao:
            'Depende do exame. Radiografia, tomografia computadorizada e '
            'fluoroscopia usam radiação ionizante. A ressonância magnética '
            'usa campos magnéticos e ondas de rádio.',
        fonte:
            'FDA, Medical X-ray Imaging; FDA, MRI (Magnetic Resonance '
            'Imaging)',
      ),
      Afirmacao(
        id: 'aplicacoes-4',
        enunciado:
            'A radiação é um dos métodos usados para esterilizar dispositivos '
            'médicos.',
        classificacao: Classificacao.verdadeiro,
        explicacao:
            'Dispositivos médicos podem ser esterilizados de várias formas, '
            'e a radiação é uma delas, ao lado de calor úmido, calor seco e '
            'gases como o óxido de etileno.',
        fonte: 'FDA, Sterilization for Medical Devices',
      ),
    ],
  ),
];

/// Próxima afirmação do mesmo tema, ou `null` se esta for a última.
Afirmacao? proximaAfirmacao(Afirmacao afirmacao) {
  for (final tema in temas) {
    final indice = tema.afirmacoes.indexOf(afirmacao);
    if (indice != -1 && indice + 1 < tema.afirmacoes.length) {
      return tema.afirmacoes[indice + 1];
    }
  }
  return null;
}

/// Quantidade de lições de toda a trilha.
int get totalDeLicoes =>
    temas.fold(0, (total, tema) => total + tema.afirmacoes.length);
