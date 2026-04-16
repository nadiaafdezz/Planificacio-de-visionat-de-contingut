(define (problem problema1)

    (:domain SeriesPelisExt3)
    
    (:objects 
        divergente insurgente tmsc1 tmsc2 tmsc3 hola a1 monja a2 a3 conj adeu cmbyn mujercitas love_actually after buenas noches 
    )
    
    (:init
        (predecesor divergente insurgente)
        (predecesor tmsc1 tmsc2)
        (predecesor tmsc2 tmsc3)
        (paralela a1 a2)(paralela a2 a1)(paralela monja a1)(paralela monja a2)(paralela a1 monja)(paralela a2 monja)
        (predecesor a1 conj)
        (predecesor a2 conj)
        (predecesor a3 conj)
        (predecesor noches buenas)
        (predecesor monja conj)
        (paralela a1 a3)(paralela a2 a3)(paralela monja a3)(paralela a3 a1)(paralela a3 a2)(paralela a3 monja) 
        (paralela a1 buenas)(paralela a2 buenas)(paralela monja buenas)(paralela buenas a1)(paralela buenas a2)(paralela buenas monja) 
        (paralela a3 buenas)(paralela buenas a3)
        (final insurgente)
        (final tmsc3)
        (final hola)
        (final adeu)
        (final conj)
        (final love_actually)
        (final after)
        (final cmbyn)
        (final mujercitas)
        (paralelas_ok)
		(= (contenidos_vistos) 0)
    )
    
    (:goal 
        (forall (?c) (visto ?c))
    )
)

