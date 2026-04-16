(define (problem problema1)

    (:domain SeriesPelisExt1)
    
    (:objects 
        divergente insurgente leal_parte1 leal_parte2 tmsc1 tmsc2 tmsc3 hola love_actually los_juegos_parte1 los_juegos_parte2 los_juegos_parte3 
    )
    
    (:init
        (predecesor divergente insurgente)
        (predecesor insurgente leal_parte1)
        (predecesor leal_parte1 leal_parte2)
        (predecesor los_juegos_parte1 los_juegos_parte2)
        (predecesor los_juegos_parte2 los_juegos_parte3)
        (predecesor tmsc1 tmsc2)
        (predecesor tmsc2 tmsc3)
    )
    
    (:goal 
        (forall (?c)(visto ?c)
        )
    )
)
