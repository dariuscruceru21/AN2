//Aufgabe1

hungrig(lena).

mutter(lena, otto).

mag(lena, X) :- schenkt(X, lena, schokolade).


mag(lena, X) :- kann(X, singen), kann(X, kochen).


mag(lena, X) :- schenkt(X, lena, schokolade) ; schenkt(X, lena, kekse)

sterblich(X) :- mensch(X).

sterblich(sokrates).

tochter(X, Y) :- kind(X, Y), weiblich(X).

mag(X, wurst) :- hund(X).

mag(pluto, Y) :- gibt(mickey, pluto, Y).

//Aufgabe2


mutter(molly,ron).
mutter(molly,ginny).

vater(arthur,ron).
vater(arthur,ginny).

mutter(hermione,rose).
mutter(hermione,hugo).

vater(ron,rose).
vater(ron,hugo).

mutter(ginny,james).
mutter(ginny,albus).
mutter(ginny,lily).

vater(harry,james).
vater(harry,albus).
vater(harry,lily).

sohn(ron,arthur).
sohn(ron,molly).

tochter(ginny,arthur).
tochter(ginny,molly).


tochter(rose,ron).
tochter(rose,hermione).

sohn(hugo,ron).
sohn(hugo,ron).


sohn(james,harry).
sohn(james,ginny).

sohn(albus,harry).
sohn(albus,ginny).

tochter(lily,harry).
tochter(lily,ginny).

schwester(rose,hugo).
bruder(hugo,rose).

schwester(lily,james).
schwester(lily,albus).

bruder(james,lily).
bruder(james,albus).

bruder(albus,james).
bruder(albus,lily).

         
grossvater(X, Y) :- vater(X, Z), (tochter(Y, Z); sohn(Y, Z)).


//Aufgabe 3
1.Atom
2.Variable
3.Atom
4.Variable
5.Atom
6.Atom
7.Andere
8.Atom
9.Variable
10.Atom

//Augabe 4
1.komplexer Term Funktor:loves und Stelligkeit:2
2.Atom
3.Variable
4.komplexer Term Funktor:boxer unde Stelligkeit:1
5.komplexer Term outer Funktor:and (inner Funktors: big, kahuna) und Stelligkeit:2
6.komplexer Term outer Funktor:and (inner Funktors: big, kahuna) und Stelligkeit:2
7.Variable
8.Andere
9.komplexer Term Funktor: kills Stelligkeit: 2
10.Atom


//Aufgabe 5
1. Fakte
2. Fakte
3. Fakte
4. Regeln | person/1: Kopf, max/1 or woman/1: Body
5. Regeln | loves/2: Kopf, father/2: Body
6. Regeln | father/2: Kopf, man1 and son/2: Body
7. Regeln | father/2: Kopf, man/1 and daughter/2: Body

Klausel: all


