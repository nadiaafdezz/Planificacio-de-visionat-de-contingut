(define (problem problema1)

    (:domain SeriesPelisExt2)
    
    (:objects 
        divergente a1 insurgente tmsc1 tmsc2 tmsc3 hola monja a2 conj adeu buenas tardes
    )
    
    (:init
        (predecesor divergente insurgente)
        (predecesor tmsc1 tmsc2)
        (predecesor tmsc2 tmsc3)
        (predecesor divergente tmsc2)
        (predecesor tmsc1 hola)
        (paralela a1 a2)(paralela a2 a1)(paralela monja a1)(paralela monja a2)(paralela a1 monja)(paralela a2 monja)
        (paralela buenas tardes)(paralela tardes buenas)
        (predecesor a1 conj)
        (predecesor a2 conj)
        (predecesor monja conj)
        (final insurgente)
        (final tmsc3)
        (final hola)
        (final adeu)
        (final conj)
        (paralelas_ok)
    )
    
    (:goal 
        (forall (?c) (visto ?c))
    )
)
