(define (domain SeriesPelisExt3)
  (:requirements :adl :strips :fluents)  
  
  (:predicates
	(predecesor ?c1 ?c2)
	(paralela ?c1 ?c2)
	(visto ?c)
	(predecesores_vistos ?c)
	(paralelas_vistas ?c)
	(final ?c)
	(paralelas_ok)
  )
  
  (:functions
        (contenidos_vistos)
  )
  
  (:action VerContenido
		:parameters (?c)
		:precondition (and 	(not (visto ?c))
							(predecesores_vistos ?c)
							(final ?c)
							(< (contenidos_vistos) 2)
							(paralelas_ok)
					  )
		:effect (and (visto ?c)
					 (increase (contenidos_vistos) 1)
				)	
  )
  
  (:action VerContenido_y_Cambiar_Dia
		:parameters (?c ?c_sig)
		:precondition (and (not(visto ?c))
							(predecesores_vistos ?c)
							(paralelas_vistas ?c)
							(or (= (contenidos_vistos) 2)(predecesor ?c ?c_sig))
							(paralelas_ok)
					  )
		:effect (and	(visto ?c)
						(assign (contenidos_vistos) 0)
				)	
  )
  
  (:action Empezar_contenido_paralelo_Dia_nuevo
		:parameters (?c ?c_par)
		:precondition (and 	(not (visto ?c))
							(not (visto ?c_par))
							(predecesores_vistos ?c)
							(paralelas_ok)
							(paralela ?c ?c_par)
					  )
		:effect (and	(visto ?c)
						(not(paralelas_ok))	
						(assign (contenidos_vistos) 1)	
				)		
  )

  (:action VerContenido_paralelo
		:parameters (?c ?c_par1 ?c_par2)
		:precondition (and 	(not (visto ?c))
							(not(visto ?c_par1))
							(visto ?c_par2)
							(predecesores_vistos ?c)
							(paralela ?c ?c_par1)
							(paralela ?c ?c_par2)
							(< (contenidos_vistos) 2)
					  )
		:effect (and	(visto ?c)	
						(increase (contenidos_vistos) 1)
				)		
  )

  (:action VerContenido_paralelo_y_Cambiar_Dia
		:parameters (?c ?c_par)
		:precondition (and 	(not (visto ?c))
							(paralela ?c ?c_par)
							(visto ?c_par)
							(predecesores_vistos ?c)
							(not (paralelas_ok))
							(or (= (contenidos_vistos) 2)(paralelas_vistas ?c))
					  )
		:effect (and	(visto ?c)
						(when (paralelas_vistas ?c)(paralelas_ok)) 
						(assign (contenidos_vistos) 0)
				)				
  )
  
  (:action Pre_v
		:parameters (?c)
		:precondition (and (not (predecesores_vistos ?c))
							(forall (?c_pred) (or (not(predecesor ?c_pred ?c)) (visto ?c_pred)))
					  )
		:effect (predecesores_vistos ?c)
  )
  
  (:action Par_v
		:parameters (?c)
		:precondition (and (not (paralelas_vistas ?c))
							(forall (?c_par) (or (not(paralela ?c_par ?c)) (visto ?c_par)))
					  )
		:effect (paralelas_vistas ?c)
  )
  
)		




