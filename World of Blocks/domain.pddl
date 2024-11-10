(define 
  (domain world-of-blocks)
  (:requirements :adl)
  (:types paczka)
  (:predicates
    (on-top ?x ?y - paczka)
    (on-floor ?x - paczka)
    (holding ?x - paczka)
    (clear ?x - paczka)
    (wolna-reka)
  )

  ; Podniesienie paczki z paczki
  (:action podnies-z-paczki
    :parameters (?x ?y - paczka)
    :precondition
    (and
      (wolna-reka)
      (on-top ?x ?y)
      (clear ?x)
    )
    :effect
    (and
      (not (on-top ?x ?y))
      (holding ?x)
      (clear ?y)
      (not (wolna-reka))
    )
  )

  ; Podniesienie paczki z podłogi
  (:action podnies-z-podlogi
    :parameters (?x - paczka)
    :precondition
    (and
      (wolna-reka)
      (on-floor ?x)
      (clear ?x)
    )
    :effect
    (and
      (not (on-floor ?x))
      (holding ?x)
      (not (wolna-reka))
    )
  )

  ; Opuszczenie paczki na paczkę
  (:action opusc-na-paczke
    :parameters (?y ?x - paczka)
    :precondition
    (and
      (holding ?x)
      (clear ?y)
      (not(= ?x ?y))
    )
    :effect
    (and
      (on-top ?x ?y)
      (not (holding ?x))
      (wolna-reka)
      (clear ?x)
      (not (clear ?y))
    )
  )

  ; Opuszczenie paczki na podłogę
  (:action opusc-na-podloge
    :parameters (?x - paczka)
    :precondition
    (holding ?x)
    :effect
    (and
      (on-floor ?x)
      (clear ?x)
      (not (holding ?x))
      (wolna-reka)
    )
  )
)
