(define (problem problema1)

    (:domain 
        SeriesPelisBasico    
    )
    
    (:objects
         divergente insurgente tmsc1 tmsc2 tmsc3 hola
    )
    
    (:init
		(predecesor divergente insurgente)
		(predecesor tmsc1 tmsc2)
		(predecesor tmsc2 tmsc3)
		(sinPredecesor divergente)
		(sinPredecesor tmsc1)
		(sinPredecesor hola)
	)
	
	(:goal (forall (?c) (visto ?c)))
)
		
    
