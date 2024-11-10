(define
    (domain planeta)
    (:requirements :adl)
    (:types dzwignia gwiazda miejsce planeta przycisk)
    (:predicates
        (podroznik ?p - planeta)
        (dzwignia ?d - dzwignia ?p - planeta)
        (aktywna_dzwignia ?d - dzwignia)
        (sasiad ?p1 ?p2 - planeta ?d - dzwignia)
        (puste ?m - miejsce)
        (gwiazda ?g - gwiazda ?m - miejsce)
        (aktywny_przycisk)
        (sasiad_przycisk ?p1 ?p2 - planeta)
        (przycisk ?p - planeta)
        (zagadka ?p - planeta)
    )
    (:action pull-lever
        :parameters (?d - dzwignia ?p - planeta)
        :precondition
            (and
                (podroznik ?p)
                (dzwignia ?d ?p)
            )
        :effect
            (aktywna_dzwignia ?d)
        )
    (:action move
        :parameters (?do ?z - planeta ?d - dzwignia)
        :precondition
            (and 
                (podroznik ?z)
                (or
                    (sasiad ?do ?z ?d)
                    (and
                        (sasiad_przycisk ?do ?z)
                        (aktywny_przycisk)
                    )
                )
                (aktywna_dzwignia ?d)
            )
        :effect
            (and
                (not(aktywna_dzwignia ?d))
                (aktywna_dzwignia D0)
                (when
                    (aktywny_przycisk)
                    (aktywna_dzwignia D5)
                )
                (not (podroznik ?z))
                (podroznik ?do)
            )
        )
    (:action press-button
        :parameters (?p - planeta)
        :precondition
            (and
                (podroznik ?p)
                (not(aktywny_przycisk))
                (przycisk ?p)
                (aktywna_dzwignia D5)
            )
        :effect
            (and
                (aktywny_przycisk)
                (dzwignia D1 P4)
            )
        )
    (:action move-star
        :parameters (?g - gwiazda ?z ?do - miejsce ?p - planeta)
        :precondition
            (and
                (podroznik ?p)
                (zagadka ?p)
                (puste ?do)
                (gwiazda ?g ?z)
            )
        :effect
            (and
                (not(puste ?do))
                (gwiazda ?g ?do)
                (puste ?z)
                (not(gwiazda ?g ?z))
            )
    )
)
                
