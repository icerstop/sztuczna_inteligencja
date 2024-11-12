(define (domain bagend)
    (:requirements :adl)
    (:types pomieszczenie kolor numer wspolrzedne klocki)
    (:predicates 
        (przejscie ?x ?y - pomieszczenie ?k - kolor)
        (kula ?x - pomieszczenie ?k - kolor ?n - numer)
        (merry ?x - pomieszczenie)
        (posiada ?k - kolor ?n - numer)
        (zagadka ?x - pomieszczenie)
        (klocek ?k - klocki ?x ?y - wspolrzedne)
        (puste ?x ?y - wspolrzedne)
        (sasiad ?x1 ?y1 ?x2 ?y2 - wspolrzedne)
    )
    (:action wez
        :parameters (?k - kolor ?x - pomieszczenie ?n - numer)
        :precondition (and
            (merry ?x)
            (kula ?x ?k ?n)
    )
        :effect (and
            (posiada ?k ?n)
            (not (kula ?x ?k ?n))
            )
    )
    (:action idz
        :parameters (?x ?y - pomieszczenie ?z - kolor ?n - numer)
        :precondition (and
            (merry ?y)
            (posiada ?z ?n)
            (przejscie ?y ?x ?z)
            )
        :effect (and
            (merry ?x)
            (not (merry ?y))
            (not (posiada ?z ?n))
            )
    )
    (:action przesun
        :parameters (?n - klocki ?p - pomieszczenie ?x ?y ?nowe_x ?nowe_y - wspolrzedne)
        :precondition (and
            (merry ?p)
            (zagadka ?p)
            (klocek ?n ?x ?y)
            (puste ?nowe_x ?nowe_y)
            (sasiad ?x ?y ?nowe_x ?nowe_y)
            )
        :effect (and
            (not (klocek ?n ?x ?y))
            (klocek ?n ?nowe_x ?nowe_y)
            (not (puste ?nowe_x ?nowe_y))
            (puste ?x ?y)
        )
    )
)

        


