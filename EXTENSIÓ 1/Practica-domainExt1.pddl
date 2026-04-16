(define (domain SeriesPelisExt1)
  (:requirements :adl :strips)  
   
  (:predicates
	(predecesor ?c1 ?c2)
	(visto ?c )
  )
  
  (:action VerContenido
		:parameters (?c2)
		:precondition 	(and 
						(not (visto ?c2))
						(forall (?c1) (or (not (predecesor ?c1 ?c2)) (visto ?c1)))
						)

		:effect (and
				(visto ?c2))
  )
)		

