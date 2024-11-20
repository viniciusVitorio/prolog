livro('O Senhor dos Anéis: A Sociedade do Anel', ficcao, fantasia, 'O Senhor dos Anéis: A Sociedade do Anel inicia a jornada épica da Irmandade para destruir o Um Anel e derrotar o Senhor das Trevas, Sauron.').
livro('O Hobbit', ficcao, fantasia, 'O Hobbit segue a jornada de Bilbo Bolseiro enquanto ele embarca em uma aventura para ajudar anões a recuperar sua montanha e seu tesouro.').
livro('O Silmarillion', ficcao, mitologia, 'O Silmarillion explora as origens do mundo de Tolkien, descrevendo os primeiros tempos e as lendas do universo de Arda, incluindo a criação dos Silmarils e a luta contra Morgoth.').
livro('Os Filhos de Húrin', ficcao, mitologia, 'Os Filhos de Húrin é uma história trágica sobre os filhos de Húrin e sua luta contra o malvado Morgoth, cheia de coragem, destino e tragédia.').
livro('Contos Inacabados', ficcao, fantasia, 'Contos Inacabados oferece relatos detalhados do mundo de Tolkien, com histórias que expõem o legado e as aventuras dos personagens conhecidos de O Senhor dos Anéis.').
livro('A Queda de Gondolin', ficcao, fantasia, 'A Queda de Gondolin é um conto épico de tragédia, heroísmo e perda, ambientado na Primeira Era do Mundo de Tolkien.').

recomendar :-
    genero(Genero),
    interesse(Interesse),
    livro(Livro, Genero, Interesse, Descricao),
    write('Recomendação: '), write(Livro), nl,
    write('Descrição: '), write(Descricao), nl.

perguntar_genero :-
    write('Quais gêneros você prefere? (ficcao, mitologia, fantasia): '),
    read(Genero),
    assert(genero(Genero)).

perguntar_interesse :-
    write('Quais são seus interesses? (politica, ciencia, aventura, mitologia): '),
    read(Interesse),
    assert(interesse(Interesse)).

fazer_recomendacao :-
    perguntar_genero,
    perguntar_interesse,
    recomecar.

recomecar :-
    recomendar,
    nl,
    write('Deseja mais recomendações? (s/n): '),
    read(Resposta),
    (Resposta == s -> fazer_recomendacao ; write('Obrigado por usar o sistema de recomendações de livros!')).

iniciar :-
    write('Bem-vindo ao sistema de recomendação de livros!'), nl,
    fazer_recomendacao.
