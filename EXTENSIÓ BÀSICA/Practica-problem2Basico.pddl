(define (problem problema1)

    (:domain 
        SeriesPelisBasico    
    )
    
    (:objects
         divergente insurgente tmsc1 tmsc2 hola nerve titanic los_juegos_parte1 los_juegos_parte2
    )
    
    (:init
		(predecesor divergente insurgente)
		(predecesor tmsc1 tmsc2)
		(predecesor los_juegos_parte1 los_juegos_parte2)
		(sinPredecesor divergente)
		(sinPredecesor tmsc1)
		(sinPredecesor los_juegos_parte1)
		(sinPredecesor hola)
		(sinPredecesor nerve)
		(sinPredecesor titanic)
	)
	
	(:goal (forall (?c) (visto ?c)))
)
		
    
