# REACTIO

App educativo sobre tecnologia nuclear, em formato de trilha de microlições. Entrega da Sprint 1 da disciplina de Mobile Application Development.

## Integrantes

| Nome | RM |
|---|---|
| Kayque | 567980 |
| Eric | 567398 |
| Gabriel | 567903 |

**Parceiro:** Marinha do Brasil / CTMSP (AMAZUL), Challenge FIAP 2026.

## Solução

O participante escolhe um tema, recebe uma afirmação e responde Verdadeiro, Falso ou Depende do contexto. Depois de responder, o app mostra o resultado, a classificação correta, a explicação e a fonte.

Errar leva à mesma explicação de quem acertou, sem penalidade, e não há cronômetro. As alternativas são identificadas por texto, as áreas de toque têm pelo menos 48 dp e os textos acompanham o tamanho de fonte do sistema.

Nesta sprint os dados são mockados e ficam em memória. O progresso se perde ao fechar o app, e a sugestão enviada pelo formulário não é salva. Não há banco de dados, API, login, ranking, notificações nem IA.

## Vídeo demonstrativo

<LINK_DO_VIDEO>

O roteiro de gravação está em [docs/roteiro_video.md](docs/roteiro_video.md).

## Como executar

Pré-requisitos: Flutter (stable) e um emulador Android em execução.

```bash
flutter pub get
flutter run
```

Para rodar a análise estática e os testes de widget:

```bash
flutter analyze
flutter test
```

## Tecnologias

- Flutter
- Dart
- Material 3

## Telas

| Tela | Rota | Função |
|---|---|---|
| Inicial | `/` | Apresenta o app, como ele funciona e o progresso |
| Trilha | `/trilha` | Mostra "Lições concluídas: X de 9" e a lista de temas |
| Tema | `/tema` | Mostra as lições do tema em grade, com o status de cada uma |
| Desafio | `/desafio` | Mostra a afirmação e as três alternativas |
| Explicação | `/explicacao` | Mostra resultado, classificação correta, explicação e fonte |
| Sugestão | `/sugestao` | Formulário para sugerir uma afirmação, com validação |

## Fluxo de navegação

```text
Inicial ──> Trilha ──> Tema ──> Desafio ──> Explicação
   │                    ▲                       │
   │                    ├── Voltar para o tema ─┤
   │                    │                       │
   │                 Desafio <── Próxima afirmação
   │
   └──> Sugestão
```

- A navegação usa rotas nomeadas (`Navigator.pushNamed`, `pushReplacementNamed` e `pop`), definidas em `lib/rotas.dart`.
- A seta da barra superior volta para a tela anterior. Da Explicação, ela volta para o Tema, para a mesma resposta não ser enviada duas vezes.
- Parâmetros entre telas: Trilha envia o `Tema` para a tela Tema, Tema envia a `Afirmacao` para o Desafio e o Desafio envia a afirmação e a resposta para a Explicação (`ArgumentosExplicacao`).

## Requisitos da disciplina no código

| Requisito | Onde |
|---|---|
| Estado com `StatefulWidget` e `setState()` | Progresso em `lib/estado/progresso_trilha.dart`; alternativa selecionada em `lib/telas/tela_desafio.dart` |
| `Form` e `TextFormField` com validação | `lib/telas/tela_sugestao.dart` (campo obrigatório e tamanho mínimo) |
| Resposta ao usuário com `SnackBar` | `lib/telas/tela_sugestao.dart` |
| Identidade visual | `lib/estilo/estilo_app.dart` (cores, tipografia e espaçamentos) |
| Teste de widget | `test/quiz_test.dart` |

## Conteúdo e revisão

As afirmações ficam em `lib/dados/trilha_mock.dart`. As duas sobre irradiação de alimentos usam [FDA, Food Irradiation: What You Need to Know](https://www.fda.gov/food/buy-store-serve-safe-food/food-irradiation-what-you-need-know). As demais foram conferidas nas páginas abaixo. Uma afirmação nova, ainda sem revisão, pode usar `aRevisar: true` para o app exibir o selo "Texto a revisar".

| Afirmação | Classificação | Fonte |
|---|---|---|
| Todos os seres vivos estão expostos a alguma radiação. | Verdadeiro | [NRC, Sources of Radiation](https://www.nrc.gov/about-nrc/radiation/around-us/sources.html) |
| Toda a radiação a que estamos expostos vem de fontes criadas pelo ser humano. | Falso | [EPA, Radiation Sources and Doses](https://www.epa.gov/radiation/radiation-sources-and-doses) |
| A exposição à radiação cósmica é a mesma em qualquer altitude. | Falso | [EPA, Radiation Sources and Doses](https://www.epa.gov/radiation/radiation-sources-and-doses) |
| O radônio é um gás radioativo que pode estar presente dentro de casa. | Verdadeiro | [EPA, Health Risk of Radon](https://www.epa.gov/radon/health-risk-radon) |
| Alimentos e água podem conter material radioativo de origem natural. | Verdadeiro | [EPA, Radiation Sources and Doses](https://www.epa.gov/radiation/radiation-sources-and-doses) |
| Um exame de imagem médica expõe o paciente à radiação ionizante. | Depende | [FDA, Medical X-ray Imaging](https://www.fda.gov/radiation-emitting-products/medical-imaging/medical-x-ray-imaging) e [FDA, MRI](https://www.fda.gov/radiation-emitting-products/medical-imaging/mri-magnetic-resonance-imaging) |
| A radiação é um dos métodos usados para esterilizar dispositivos médicos. | Verdadeiro | [FDA, Sterilization for Medical Devices](https://www.fda.gov/medical-devices/general-hospital-devices-and-supplies/sterilization-medical-devices) |
