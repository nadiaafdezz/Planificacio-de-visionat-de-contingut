(define (problem problema1)

    (:domain SeriesPelisExt1)
    
    (:objects 
        divergente insurgente tmsc1 tmsc2 tmsc3 hola
    )
    
    (:init
        (predecesor divergente insurgente)
        (predecesor tmsc1 tmsc2)
        (predecesor tmsc2 tmsc3)
        (predecesor divergente tmsc2)
        (predecesor tmsc1 hola)
    )
    
    (:goal 
        (forall (?c)(visto ?c)
        )
    )
)
