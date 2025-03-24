varon(Paolo).
varon(Edward).
varon(Giussepi).
varon(Victor).
varon(Alfonzo).
varon(Gilberto).

mujer(Gladys).
mujer(Yesa).
mujer(Daniela).
mujer(Gisella).
mujer(Luz).
mujer(Nestina).

padre(Edward, Paolo).
padre(Edward, Giussepi).
padre(Victor, Yesa).
padre(Victor, Daniela).
padre(Alfonzo, Edward).
padre(Alfonzo, Gisella).
padre(Gilberto, Gladys).

madre(Gladys, Paolo).
madre(Gladys, Giussepi).
madre(Gisella, Yesa).
madre(Gisella, Daniela).
madre(Luz, Edward).
madre(Luz, Gisella).
madre(Nestina, Gladys).

casado(Edward, Gladys).
casado(Victor, Gisella).
casado(Alfonzo, Luz).

hijo(X, Y) :-
    varon(X),
    (padre(Y, X); madre(Y, X)).

hija(X, Y) :-
    mujer(X),
    (padre(Y, X); madre(Y, X)).

hermano(X, Y) :-
    varon(X),
    padre(Z, X), padre(Z, Y),
    madre(W, X), madre(W, Y),
    X \= Y.

hermana(X, Y) :-
    mujer(X),
    padre(Z, X), padre(Z, Y),
    madre(W, X), madre(W, Y),
    X \= Y.

abuelo(X, Y) :-
    varon(X),
    padre(X, Z),
    (padre(Z, Y); madre(Z, Y)).

abuela(X, Y) :-
    mujer(X),
    madre(X, Z),
    (padre(Z, Y); madre(Z, Y)).

nieto(X, Y) :-
    varon(X),
    (abuelo(Y,X);abuela(Y,X)).

nieta(X, Y) :-
    mujer(X),
    (abuelo(Y,X);abuela(Y,X)).

bisabuelo(X, Y) :-
    varon(X),
    abuelo(X, Z),
    (padre(Z, Y); madre(Z, Y)).

bisabuela(X, Y) :-
    mujer(X),
    abuela(X, Z),
    (padre(Z, Y); madre(Z, Y)).

bisnieto(X, Y) :-
    varon(X),
    (bisabuelo(Y, X); bisabuela(Y, X)).

bisnieta(X, Y) :-
    mujer(X),
    (bisabuelo(Y, X); bisabuela(Y, X)).

tio(X, Y) :-
    varon(X),
    hermano(X, Z),
    (padre(Z, Y); madre(Z, Y)).

tia(X, Y) :-
    mujer(X),
    hermana(X, Z),
    (padre(Z, Y); madre(Z, Y)).

sobrino(X, Y) :-
    varon(X),
    (tio(Y, X); tia(Y, X)).

sobrina(X, Y) :-
    mujer(X),
    (tio(Y, X); tia(Y, X)).

suegro(X, Y) :-
    varon(X),
    (padre(X, Z), casado(Z, Y)).

suegra(X, Y) :-
    mujer(X),
    (madre(X, Z), casado(Z, Y)).

yerno(X, Y) :-
    varon(X),
    (casado(X, Z), padre(Y, Z)).

nuera(X, Y) :-
    mujer(X),
    (casado(X, Z), padre(Y, Z)).

primo(X, Y) :-
    varon(X),
    padre(Z, X), padre(W, Y),
    hermano(Z, W),
    X \= Y.

prima(X, Y) :-
    mujer(X),
    padre(Z, X), padre(W, Y),
    hermano(Z, W),
    X \= Y.

cuñado(X, Y) :-
    varon(X),
    casado(X, Z),
    (hermana(Z, Y); hermano(Z, Y)).

cuñada(X, Y) :-
    mujer(X),
    casado(X, Z),
    (hermana(Z, Y); hermano(Z, Y)).
