; DUBIN Baptiste
(deffacts initiaux
	(animal Bozo)
	(specificite Bozo grands_bonds)
	(specificite Bozo poche_ventrale)
	(specificite Bozo poilu)

	(animal Bobby)
	(specificite Bobby poilu)
	(specificite Bobby poche_ventrale)
	(specificite Bobby grimpe_arbre)

	(animal Betty)
	(specificite Betty poilu)
	(specificite Betty vole)
	(mange Betty carnivore)

	(animal Baloo)
	(specificite Baloo poilu)
	(specificite Baloo ponds_oeuf)
	(mange Baloo carnivore)

	(animal Koko)
	(mange Koko eucalyptus)
	(mange Koko bambou)
)

(defrule identifie
	(declare (salience -1))
	(identification ?n ?t)
	=>
	(printout t (implode$ (create$ ?n est un ?t)) crlf)
)

(defrule pas_identifie
	(declare (salience -1))
	(animal ?n)
	(not (identification ?n ?))
	=>
	(printout t (implode$ (create$ Je n'ai pas pu identifier ?n)) crlf)
)

; (defrule question-hypothese
;     (declare (salience -2))
;     =>
;     (printout t "question (oui/non) ? ")
;     (if (eq (readline) "oui") then
    
;     )
; )
 
(defrule donne_lait
	(specificite ?n poilu)
	=>
	(assert (specificite ?n lait))
)

(defrule est_phalanger
	(specificite ?n poche_ventrale)
	(specificite ?n phalangue_longue)
	=>
	(assert (identification ?n phalanger))
)

(defrule est_koala
	(classe ?n marsupial)
	(specificite ?n grimpe_arbre)
	=>
	(assert (identification ?n koala))
)

(defrule est_marsupial
	(specificite ?n poche_ventrale)
	(specificite ?n lait)
	=>
	(assert (classe ?n marsupial))
)

(defrule est_kangourou
	(classe ?n marsupial)
	(specificite ?n grands_bonds)
	=>
	(assert (identification ?n kangourou))
)

(defrule est_mammifere
	(specificite ?n lait)
	=>
	(assert (classe ?n mammifere))
)

(defrule est_koala_bis
	(mange ?n eucalyptus)
    (not (mange ?n ~eucalyptus))
	=>
	(assert (identification ?n koala))
)

(defrule est_chauve_souris
	(specificite ?n vole)
	(specificite ?n lait)
	(mange ?n carnivore)
	=>
	(assert (identification ?n chauve_souris))
)

(defrule est_faucon
	(mange ?n carnivore)
    (classe ?n oiseau)
	=>
	(assert (identification ?n faucon))
)

(defrule est_opposum
	(classe ?n marsupial)
	(mange ?n carnivore)
	(specificite ?n queue_prehensible)
	=>
	(assert (identification ?n opposum))
)

(defrule localisation
	(classe ?n marsupial)
	=>
	(assert (local ?n hemisphere_sud))
)

(defrule est_oiseau
	(specificite ?n vole)
	(specificite ?n ponds_oeuf)
	=>
	(assert (classe ?n oiseau))
)

(defrule est_ornithorynque
	(classe ?n mammifere)
	(specificite ?n ponds_oeuf)
	=>
	(assert (identification ?n ornithorynque))
)

(defrule est_souris
	(specificite ?n petit)
	(classe ?n mammifere)
	(specificite ?n longue_queue)
	=>
	(assert (identification ?n souris))
)