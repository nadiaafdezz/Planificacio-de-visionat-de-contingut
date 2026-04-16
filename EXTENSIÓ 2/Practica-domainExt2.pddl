(define (domain SeriesPelisExt2)
  (:requirements :adl :strips)  
   
  (:predicates
	(predecesor ?c1 ?c2)
	(paralela ?c1 ?c2)
	(visto ?c)
	(predecesores_vistos ?c)
	(paralelas_vistas ?c)
	(final ?c)
	(paralelas_ok)
  )
  
  (:action VerContenido
		:parameters (?c)
		:precondition (and 	(not (visto ?c))
							(predecesores_vistos ?c)
							(final ?c)
					  )
		:effect (visto ?c)
  )
  
  
  (:action VerContenido_y_Cambiar_Dia
		:parameters (?c ?c_sig)
		:precondition (and (not(visto ?c))
							(predecesores_vistos ?c)
							(paralelas_vistas ?c)
							(predecesor ?c ?c_sig)
							(paralelas_ok)
							
					  )
		:effect (visto ?c)
  )
  
  (:action Empezar_contenido_paralelo
		:parameters (?c ?c_par)
		:precondition (and 	(not (visto ?c))
							(not (visto ?c_par))
							(predecesores_vistos ?c)
							(paralelas_ok)
							(paralela ?c ?c_par)
					  )
		:effect (and	(visto ?c)
						(not(paralelas_ok))		
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
					  )
		:effect (and	(visto ?c)		
				)		
  )

  (:action VerContenido_paralelo_y_Cambiar_Dia
		:parameters (?c ?c_par)
		:precondition (and 	(not (visto ?c))
							(paralelas_vistas ?c)
							(paralela ?c ?c_par)
							(predecesores_vistos ?c)
							(not(paralelas_ok))
					  )
		:effect (and	(visto ?c)
						(paralelas_ok)
				)				
  )
  
  (:action Pre_v
		:parameters (?c)
		:precondition (forall (?c_pred) (or (not(predecesor ?c_pred ?c)) (visto ?c_pred)))
		:effect (predecesores_vistos ?c)
  )
  
  (:action Par_v
		:parameters (?c)
		:precondition (forall (?c_par) (or (not(paralela ?c_par ?c)) (visto ?c_par)))
		:effect (paralelas_vistas ?c)
  )
  
)		




