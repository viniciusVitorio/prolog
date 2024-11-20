livro('O Senhor dos An�is: A Sociedade do Anel', ficcao, fantasia, 'O Senhor dos An�is: A Sociedade do Anel inicia a jornada �pica da Irmandade para destruir o Um Anel e derrotar o Senhor das Trevas, Sauron.').
livro('O Hobbit', ficcao, fantasia, 'O Hobbit segue a jornada de Bilbo Bolseiro enquanto ele embarca em uma aventura para ajudar an�es a recuperar sua montanha e seu tesouro.').
livro('O Silmarillion', ficcao, mitologia, 'O Silmarillion explora as origens do mundo de Tolkien, descrevendo os primeiros tempos e as lendas do universo de Arda, incluindo a cria��o dos Silmarils e a luta contra Morgoth.').
livro('Os Filhos de H�rin', ficcao, mitologia, 'Os Filhos de H�rin � uma hist�ria tr�gica sobre os filhos de H�rin e sua luta contra o malvado Morgoth, cheia de coragem, destino e trag�dia.').
livro('Contos Inacabados', ficcao, fantasia, 'Contos Inacabados oferece relatos detalhados do mundo de Tolkien, com hist�rias que exp�em o legado e as aventuras dos personagens conhecidos de O Senhor dos An�is.').
livro('A Queda de Gondolin', ficcao, fantasia, 'A Queda de Gondolin � um conto �pico de trag�dia, hero�smo e perda, ambientado na Primeira Era do Mundo de Tolkien.').

recomendar :-
    genero(Genero),
    interesse(Interesse),
    livro(Livro, Genero, Interesse, Descricao),
    write('Recomenda��o: '), write(Livro), nl,
    write('Descri��o: '), write(Descricao), nl.

perguntar_genero :-
    write('Quais g�neros voc� prefere? (ficcao, mitologia, fantasia): '),
    read(Genero),
    assert(genero(Genero)).

perguntar_interesse :-
    write('Quais s�o seus interesses? (politica, ciencia, aventura, mitologia): '),
    read(Interesse),
    assert(interesse(Interesse)).

fazer_recomendacao :-
    perguntar_genero,
    perguntar_interesse,
    recomecar.

recomecar :-
    recomendar,
    nl,
    write('Deseja mais recomenda��es? (s/n): '),
    read(Resposta),
    (Resposta == s -> fazer_recomendacao ; write('Obrigado por usar o sistema de recomenda��es de livros!')).

iniciar :-
    write('Bem-vindo ao sistema de recomenda��o de livros!'), nl,
    fazer_recomendacao.
