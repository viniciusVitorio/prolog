impressao_digital(lucas, lugar_crime).
impressao_digital(pablo, arma_do_crime).
impressao_digital(vinicius, objeto_cena).
impressao_digital(felipe, lugar_crime).

motivo(lucas, financeiro).
motivo(pablo, vinganca).
motivo(vinicius, passional).
motivo(felipe, rivalidade).

testemunha(joao, visto_discutindo).
testemunha(carla, comportamento_suspeito).
testemunha(ana, presenciou_movimentacao_suspeita).

relacao(lucas, pablo, intima).
relacao(pablo, vinicius, profissional).
relacao(felipe, joao, social).

alibi(lucas, nao).
alibi(pablo, sim).
alibi(vinicius, nao).
alibi(felipe, sim).

suspeito(Suspeito) :-
    impressao_digital(Suspeito, lugar_crime),
    motivo(Suspeito, _),
    alibi(Suspeito, nao).

suspeito(Suspeito) :-
    testemunha(_, comportamento_suspeito),
    impressao_digital(Suspeito, arma_do_crime).

teoria(crime_passional) :-
    testemunha(_, visto_discutindo),
    motivo(_, passional).

teoria(crime_pre_meditado) :-
    motivo(_, financeiro),
    impressao_digital(_, arma_do_crime).

teoria(acidente) :-
    alibi(_, sim),
    \+ testemunha(_, comportamento_suspeito).

iniciar :-
    writeln('Bem-vindo ao sistema de análise de investigação criminal!'),
    writeln('Forneça informações sobre o caso.'),
    writeln('O que você deseja verificar? (suspeitos, teorias):'),
    read(Opcao),
    (Opcao == suspeitos ->
        writeln('Suspeitos possíveis:'),
        findall(S, suspeito(S), Suspeitos),
        (Suspeitos \= [] -> writeln(Suspeitos) ; writeln('Nenhum suspeito identificado.'));
     Opcao == teorias ->
        writeln('Teorias possíveis:'),
        findall(T, teoria(T), Teorias),
        (Teorias \= [] -> writeln(Teorias) ; writeln('Nenhuma teoria identificada.'));
     writeln('Opção inválida.')
    ).
