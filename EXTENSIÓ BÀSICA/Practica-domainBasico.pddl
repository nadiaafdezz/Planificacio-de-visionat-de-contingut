(define (domain SeriesPelisBasico)
  (:requirements :strips)  
  
  (:predicates
	(predecesor ?c1 ?c2)
	(visto ?c)
	(sinPredecesor ?c)
  )
  
  (:action Ver_contenido_con_predecesor
		:parameters (?c1 ?c2)
		:precondition 	(and 
						(not (visto ?c2))
						(visto ?c1)
						(predecesor ?c1 ?c2)
						)

		:effect (visto ?c2)
  )
  (:action Ver_contenido_sin_predecesor
		:parameters (?c)
		:precondition 	(and 
						(not (visto ?c))
						(sinPredecesor ?c)
						)

		:effect (visto ?c)
  )
  
)		
