(define (problem problema_test_25contenidos)

    (:domain SeriesPelisExt4)

    (:objects
        contenido_1 contenido_2 contenido_3 contenido_4 contenido_5 contenido_6 contenido_7 contenido_8 contenido_9 contenido_10
        contenido_11 contenido_12 contenido_13 contenido_14 contenido_15 contenido_16 contenido_17 contenido_18 contenido_19 contenido_20
        contenido_21 contenido_22 contenido_23 contenido_24 contenido_25 
    )

    (:init

        (predecesor contenido_8 contenido_9)
        (predecesor contenido_9 contenido_1)
        (predecesor contenido_1 contenido_2)
        (predecesor contenido_2 contenido_3)
        (predecesor contenido_3 contenido_4)
        
        (predecesor contenido_10 contenido_11)
        (predecesor contenido_11 contenido_12)
        (predecesor contenido_12 contenido_13)
        (predecesor contenido_13 contenido_14)
        (predecesor contenido_14 contenido_15)

        (no_paralela contenido_1)
        (no_paralela contenido_2)
        (no_paralela contenido_3)
        (no_paralela contenido_4)
        (no_paralela contenido_9)
        (no_paralela contenido_10)
        (no_paralela contenido_11)
        (no_paralela contenido_12)
        (no_paralela contenido_13)
        (no_paralela contenido_14)
        (no_paralela contenido_15)
        (no_paralela contenido_16)
        (no_paralela contenido_17)
        (no_paralela contenido_18)
        (no_paralela contenido_19)
        (no_paralela contenido_20)
        (no_paralela contenido_21)
        (no_paralela contenido_22)
        (no_paralela contenido_23)
        
        (paralela contenido_5 contenido_6)
        (paralela contenido_6 contenido_7)
        (paralela contenido_7 contenido_8)
        (paralela contenido_8 contenido_5)
        (paralela contenido_5 contenido_7)
        (paralela contenido_6 contenido_8)
        (paralela contenido_7 contenido_5)
        (paralela contenido_8 contenido_6)
        (paralela contenido_5 contenido_8)
        (paralela contenido_6 contenido_5)
        (paralela contenido_7 contenido_6)
        (paralela contenido_8 contenido_7)
        
        (paralela contenido_24 contenido_25)
        (paralela contenido_25 contenido_24)
        
        (predecesores_vistos contenido_5)
        (predecesores_vistos contenido_6)
        (predecesores_vistos contenido_7)
        (predecesores_vistos contenido_8)
        (predecesores_vistos contenido_10)
        (predecesores_vistos contenido_16)
        (predecesores_vistos contenido_17)
        (predecesores_vistos contenido_18)
        (predecesores_vistos contenido_19)
        (predecesores_vistos contenido_20)
        (predecesores_vistos contenido_21)
        (predecesores_vistos contenido_22)
        (predecesores_vistos contenido_23)
        (predecesores_vistos contenido_24)
        (predecesores_vistos contenido_25)        
        
        (=(minutos_contenido contenido_5) 60)
        (=(minutos_contenido contenido_6) 50)
        (=(minutos_contenido contenido_7) 70)
        (=(minutos_contenido contenido_8) 80)
        
        (=(minutos_contenido contenido_24) 170)
        (=(minutos_contenido contenido_25) 180)
        
        (=(minutos_contenido contenido_1) 60)
        (=(minutos_contenido contenido_2) 50)
        (=(minutos_contenido contenido_3) 70)
        (=(minutos_contenido contenido_4) 80)
        (=(minutos_contenido contenido_9) 80)
        (=(minutos_contenido contenido_10) 95)
        (=(minutos_contenido contenido_11) 102)
        (=(minutos_contenido contenido_12) 93)
        (=(minutos_contenido contenido_13) 88)
        (=(minutos_contenido contenido_14) 75)
        (=(minutos_contenido contenido_15) 66)
        (=(minutos_contenido contenido_16) 81)
        (=(minutos_contenido contenido_17) 62)
        (=(minutos_contenido contenido_18) 94)
        (=(minutos_contenido contenido_19) 76)
        (=(minutos_contenido contenido_20) 91)
        (=(minutos_contenido contenido_21) 102)
        (=(minutos_contenido contenido_22) 93)
        (=(minutos_contenido contenido_23) 80)

        

        (paralelas_ok)
        (= (minutos_vistos) 0)
    )

    (:goal 
        (forall (?c) (visto ?c))
    )
)
