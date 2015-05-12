/*MENU DE CONSULTAS PARA COMPATIBILIDADE SANGUINEA*/

:- dynamic fatorrh/2.
:- dynamic tipoSanguineo/2.
:- dynamic idade/2.
:- dynamic peso/2.


tipoSanguineo(joao,a).
tipoSanguineo(maria,a).
tipoSanguineo(pedro,o).
tipoSanguineo(carmem,b).
tipoSanguineo(joaquina,ab).
tipoSanguineo(hermengarda,ab).
tipoSanguineo(lucrecia,o).
tipoSanguineo(artemis,b).
tipoSanguineo(nexus,a).
tipoSanguineo(nietzsche,ab).
tipoSanguineo(schopenhauer,o).
tipoSanguineo(freud,b).
tipoSanguineo(marx,a).
tipoSanguineo(jesus,o).

fatorrh(joao,-).
fatorrh(maria,+).
fatorrh(pedro,+).
fatorrh(carmem,+).
fatorrh(joaquina,-).
fatorrh(hermengarda,-).
fatorrh(lucrecia,-).
fatorrh(artemis,+).
fatorrh(nexus,-).
fatorrh(nietzsche,+).
fatorrh(schopenhauer,+).
fatorrh(freud,+).
fatorrh(marx,-).
fatorrh(jesus,+).

idade(joao,23).
idade(maria,56).
idade(pedro,34).
idade(carmem,78).
idade(joaquina,11).
idade(hermengarda,45).
idade(lucrecia,32).
idade(artemis,48).
idade(nexus,27).
idade(nietzsche,56).
idade(schopenhauer,45).
idade(freud,34).
idade(marx,59).
idade(jesus,33).

peso(joao,56.5).
peso(maria,34.675).
peso(pedro,56.32).
peso(carmem,45.65564).
peso(joaquina,87.78).
peso(hermengarda,67.11).
peso(lucrecia,46.65).
peso(artemis,89.67).
peso(nexus,78.465).
peso(nietzsche,64.676).
peso(schopenhauer,89.5767).
peso(freud,58.76).
peso(marx,68.565).
peso(jesus,74.6).


compativel(_,ab).
compativel(X,X).
compativel(o,_).

rhCompativel(+,+).
rhCompativel(-,_).

doa(X,Y):-
    tipoSanguineo(X,K),tipoSanguineo(Y,L),fatorrh(X,D),fatorrh(Y,U),
    compativel(K,L),rhCompativel(D,U),idade(X,I),I>18,I<65,peso(X,T),
    T>50,(X\==Y).

doadores(X):-doa(X,Y),write(X),write(' doa para '),write(Y),nl.

opt(X):-((X=1),findall(E,doadores(E),_));
        ((X=2),write('DIGITE O NOME DA PESSOA'),nl,read(U),findall(S,doa(U,S),Ls),write(Ls),nl);
        ((X=3),write('DIGITE O NOME DA PESSOA'),nl,read(W),findall(R,doa(R,W),L1),write(L1),nl);
        ((X=4),write('DIGITE O NOME DA PESSOA'),nl,read(Q),findall(E,tipoSanguineo(Q,E),L2),write(L2),nl);
        ((X=5),write('DIGITE O NOME DA PESSOA'),nl,read(Z),findall(G,fatorrh(Z,G),L3),write(L3),nl);
        ((X=6),write('DIGITE O NOME DA PESSOA'),nl,read(V),write('DIGITE O TIPO'),nl,read(I),
        write('DIGITE O FATOR RH'),nl,read(C),assert(tipoSanguineo(V,I)),assert(fatorrh(V,C)),
        write('DIGITE A IDADE'),nl,read(Id),assert(idade(V,Id)),write('DIGITE O PESO'),nl,read(Peso),
        assert(peso(V,Peso)),write('ADICIONADO'));
        (X=7).

menu :- write('SELECIONE A OPCAO DESEJADA'),nl,write('1-QUEM ESTA APTO PARA DOAR SANGUE PARA ALGUEM?'),nl,
        write('2-DESCOBRIR PARA QUEM UMA PESSOA PODE DOAR'),nl,write('3-DESCOBRIR DE QUEM UMA PESSOA'),
        write('PODE RECEBER'),nl,write('4-QUEM POSSUI UM DETERMINADO TIPO'),nl,write('5-QUEM POSSUI UM'),
        write('DETERMINADO FATOR RH'),nl,write('6-ADICIONAR'),nl,write('7-SAIR'),nl,read(X),opt(X).
