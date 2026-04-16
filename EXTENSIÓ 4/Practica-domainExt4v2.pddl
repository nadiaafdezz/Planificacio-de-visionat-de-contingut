(define (domain SeriesPelisExt4)
  (:requirements :adl :strips :fluents)  
  
  (:predicates
	(predecesor ?c1 ?c2)
	(paralela ?c1 ?c2)
	(visto ?c)
	(predecesores_vistos ?c)
	(paralelas_vistas ?c)
	(no_paralela ?c)
	(paralelas_ok)
	(cambio_dia)
  )
  
  (:functions
        (minutos_vistos)
        (minutos_contenido ?c)
  )
  
  (:action Cambiar_Dia_VerContenido
		:parameters (?c)
		:precondition (and 	(not (visto ?c))
							(predecesores_vistos ?c)
							(no_paralela ?c)
							(paralelas_ok)
					  )
		:effect (visto ?c)	
  )
  
  (:action Cambiar_Dia_Empezar_contenido_paralelo
		:parameters (?c ?c_par)
		:precondition (and 	(not (visto ?c))
							(not (visto ?c_par))
							(predecesores_vistos ?c)
							(paralelas_ok)
							(paralela ?c ?c_par)
					  )
		:effect (and	(visto ?c)
						(not(paralelas_ok))	
						(assign (minutos_vistos) (minutos_contenido ?c))
						(cambio_dia)	
				)		
  )

  (:action VerContenido_paralelo
		:parameters (?c ?c_par)
		:precondition (and 	(not (visto ?c))
							(visto ?c_par)
							(predecesores_vistos ?c)
							(paralela ?c ?c_par)
							(not (paralelas_ok))
							(<= (+ (minutos_vistos) (minutos_contenido ?c)) 200)
					  )
		:effect (and	(visto ?c)	
						(when (paralelas_vistas ?c)(and (paralelas_ok)(not (cambio_dia))))
						(increase (minutos_vistos) (minutos_contenido ?c))
				)		
  )
  
  (:action Cambiar_Dia_y_Ver_Contenido_Paralelo
		:parameters (?c ?c_par)
		:precondition (and 	(not (visto ?c))
							(visto ?c_par)
							(paralela ?c ?c_par)
							(predecesores_vistos ?c)
							(not (paralelas_ok))
							(> (+ (minutos_vistos) (minutos_contenido ?c)) 200)
							(cambio_dia)
							
					  )
		:effect (and	(visto ?c)
						(when (paralelas_vistas ?c)(paralelas_ok)) 
						(assign (minutos_vistos) (minutos_contenido ?c))
						(not (cambio_dia))
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





