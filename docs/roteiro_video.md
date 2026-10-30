# Roteiro do vídeo demonstrativo

**Duração máxima:** 5 minutos. **Formato:** gravação de tela do emulador Android, narrada pelos integrantes. **Publicação:** YouTube, como não listado.

A divisão de falas é uma sugestão. As falas podem ser adaptadas, desde que os itens da tabela de cobertura apareçam.

## Antes de gravar

- [ ] Abra o emulador Android e deixe a janela dele visível na gravação.
- [ ] Rode `flutter run` e confira que o app abre.
- [ ] Reinicie o app para o progresso começar em "0 de 9". Ele fica só em memória.
- [ ] Faça um ensaio cronometrado. Se passar de 5 minutos, encurte as falas, não as demonstrações.

## Sequência

### 0:00 a 0:30: abertura (Kayque)

**Tela:** emulador com a tela inicial.

> "Olá, nós somos Kayque, Eric e Gabriel. Este é o REACTIO, nosso app educativo sobre tecnologia nuclear, do Challenge FIAP 2026, com a Marinha do Brasil / CTMSP (AMAZUL) como parceiro. Ele foi feito em Flutter e está rodando aqui no emulador Android. Os dados desta sprint são mockados, em memória."

### 0:30 a 1:00: tela inicial (Kayque)

**Ação:** role a tela até o fim, devagar. Mostre o cartão "Como funciona" e o progresso "Lições concluídas: 0 de 9".

> "A tela inicial apresenta a proposta: o participante escolhe um tema, responde a uma afirmação e lê a explicação com a fonte. Não há cronômetro."

### 1:00 a 1:40: trilha e tema (Eric)

**Ação:**

1. Toque em **Começar a trilha**.
2. Mostre o progresso e os dois temas.
3. Toque em **Aplicações no cotidiano**.
4. Mostre a grade com as lições.
5. Toque na seta de voltar e entre no tema de novo, para mostrar a ida e a volta.

> "A navegação usa rotas nomeadas. Ao tocar em um tema, ele é enviado como parâmetro para a próxima tela, que lista as lições em uma grade."

### 1:40 a 2:50: desafio e explicação (Eric)

**Ação:**

1. Toque em **Lição 1**.
2. Mostre que **Responder** está desabilitado.
3. Toque em **Verdadeiro** e depois em **Responder**.
4. Na explicação, mostre "Você errou desta vez", a classificação correta (Falso), a explicação e a fonte.
5. Toque em **Próxima afirmação**.
6. Na Lição 2, toque em **Depende do contexto** e em **Responder**.
7. Mostre "Você acertou".

> "As alternativas são identificadas por texto, não só por cor. O desafio envia a afirmação e a resposta como parâmetros para a explicação. Quem erra recebe a mesma explicação de quem acerta, sem punição."

### 2:50 a 3:30: gerenciamento de estado (Gabriel)

**Ação:**

1. Toque em **Voltar para o tema** e mostre as lições 1 e 2 como "Concluída".
2. Volte para a Trilha e mostre "Lições concluídas: 2 de 9".
3. Volte para a tela inicial e mostre o mesmo progresso e o botão "Continuar a trilha".

> "O progresso é um estado mantido em um StatefulWidget. Quando o participante responde, o setState atualiza a informação, e todas as telas mostram o novo valor. A alternativa selecionada no desafio também usa setState."

### 3:30 a 4:30: formulário com validação (Gabriel)

**Ação:**

1. Na tela inicial, toque em **Sugerir uma afirmação**.
2. Toque em **Enviar sugestão** com os campos vazios e mostre as mensagens de campo obrigatório.
3. Digite um enunciado curto, como "Curta demais", e um tema com uma letra. Mostre as mensagens de tamanho mínimo.
4. Digite um enunciado com pelo menos 20 caracteres e um tema válido.
5. Toque em **Enviar sugestão** e mostre o SnackBar de confirmação.
6. Volte para a tela inicial.

> "O formulário usa Form e TextFormField, valida campo obrigatório e tamanho mínimo e responde com um SnackBar. Nesta versão, a sugestão não é enviada nem salva, e o próprio app avisa isso."

### 4:30 a 5:00: acessibilidade e encerramento (Kayque)

**Tela:** tela inicial.

> "Seguimos a diretriz de acessibilidade do grupo: alternativas em texto, bom contraste, áreas de toque de pelo menos 48 dp, textos que acompanham a fonte do sistema e nenhum cronômetro. Este foi o REACTIO. Obrigado!"

## Cobertura dos requisitos

| O vídeo precisa mostrar | Trecho |
|---|---|
| Execução no emulador Android | 0:00 a 0:30 |
| Tela inicial | 0:30 a 1:00 |
| Telas de Trilha e Tema | 1:00 a 1:40 |
| Telas de Desafio e Explicação | 1:40 a 2:50 |
| Tela de Sugestão | 3:30 a 4:30 |
| Fluxo de navegação, com ida e volta | 1:00 a 3:30 |
| Formulário com validação | 3:30 a 4:30 |
| Gerenciamento de estado | 2:50 a 3:30 |
| Interação do usuário | 1:40 a 4:30 |
