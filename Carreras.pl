habilidad(matematicas).
habilidad(argumentacion).
habilidad(creatividad).
habilidad(liderazgo).
habilidad(pensamiento_analitico).
habilidad(resolucion_problemas).
habilidad(biologia).
habilidad(comunicacion).
habilidad(dibujo).

interes(tecnologia).
interes(salud).
interes(negocios).
interes(diseno).
interes(investigacion).
interes(educacion).

personalidad(analitico).
personalidad(empatico).
personalidad(extrovertido).
personalidad(critico).
personalidad(meticuloso).

condicion_laboral(trabajo_equipo).
condicion_laboral(autonomia).
condicion_laboral(investigacion).
condicion_laboral(interaccion_social).

carrera(ingenieria_sistemas) :-
    tiene_habilidad(matematicas),
    tiene_habilidad(resolucion_problemas),
    tiene_interes(tecnologia),
    tiene_personalidad(analitico).

carrera(ingenieria_industrial) :-
    tiene_habilidad(matematicas),
    tiene_habilidad(liderazgo),
    tiene_interes(negocios),
    tiene_personalidad(critico).

carrera(medicina) :-
    tiene_habilidad(biologia),
    tiene_interes(salud),
    tiene_personalidad(empatico).

carrera(psicologia) :-
    tiene_habilidad(comunicacion),
    tiene_interes(salud),
    tiene_personalidad(empatico).

carrera(derecho) :-
    tiene_habilidad(argumentacion),
    tiene_interes(negocios),
    tiene_personalidad(critico).

carrera(administracion) :-
    tiene_habilidad(liderazgo),
    tiene_interes(negocios),
    tiene_personalidad(extrovertido).

carrera(economia) :-
    tiene_habilidad(matematicas),
    tiene_interes(negocios),
    tiene_personalidad(analitico).

carrera(contabilidad) :-
    tiene_habilidad(matematicas),
    tiene_personalidad(meticuloso).

carrera(arquitectura) :-
    tiene_habilidad(dibujo),
    tiene_interes(diseno),
    tiene_personalidad(creativo).

carrera(diseno_grafico) :-
    tiene_habilidad(dibujo),
    tiene_interes(diseno),
    tiene_personalidad(creativo).

carrera(marketing) :-
    tiene_habilidad(liderazgo),
    tiene_interes(negocios),
    tiene_personalidad(extrovertido).

carrera(biologia) :-
    tiene_habilidad(biologia),
    tiene_interes(investigacion).

carrera(fisica) :-
    tiene_habilidad(matematicas),
    tiene_interes(investigacion),
    tiene_personalidad(analitico).

carrera(quimica) :-
    tiene_habilidad(matematicas),
    tiene_interes(investigacion),
    tiene_personalidad(meticuloso).

carrera(educacion) :-
    tiene_habilidad(comunicacion),
    tiene_interes(educacion),
    tiene_personalidad(empatico).

carrera(turismo) :-
    tiene_habilidad(comunicacion),
    tiene_interes(interaccion_social),
    tiene_personalidad(extrovertido).

carrera(relaciones_internacionales) :-
    tiene_habilidad(argumentacion),
    tiene_interes(interaccion_social),
    tiene_personalidad(critico).

preguntar(Pregunta) :-
    write(Pregunta),
    write(' (si/no): '),
    read(Respuesta),
    nl,( (Respuesta == si) -> assertz(verdadero(Pregunta)) ; assertz(falso(Pregunta)), fail ).

tiene_habilidad(Habilidad) :- preguntar(Habilidad).
tiene_interes(Interes) :- preguntar(Interes).
tiene_personalidad(Personalidad) :- preguntar(Personalidad).

recomendar_carrera :-
    write('Bienvenido al recomendador de carreras!'), nl,
    write('Responde las siguientes preguntas:'), nl,
    findall(C, carrera(C), Carreras),
    nl, write('Basado en tus respuestas, podrías considerar las siguientes carreras:'), nl,
    write(Carreras), nl.
