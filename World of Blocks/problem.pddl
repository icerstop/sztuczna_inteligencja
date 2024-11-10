1. 5 paczek


(define (problem test_swiat_paczek)
(:domain world-of-blocks)

(:objects a b c d e)

(:init
    (on-top c b)
    (on-top b a)
    (on-floor a)
    (clear c)
    (on-top e d)
    (on-floor d)
    (clear e)
    (wolna-reka)
)

(:goal
(and
  (on-top d b)
  (exists (?x - paczka)
    (on b ?x)
  )
))
)

2. Wszyscy na ziemię:

(define (problem test_swiat_paczek)
(:domain world-of-blocks)

(:objects a b c d e)

(:init
    (on-top c b)
    (on-top b a)
    (on-floor a)
    (clear c)
    (on-top e d)
    (on-floor d)
    (clear e)
    (wolna-reka)
)

(:goal
(and
    (on-floor a)
    (on-floor b)
    (on-floor c)
    (on-floor d)
    (on-floor e)
    (clear a)
    (clear b)
    (clear c)
    (clear d)
    (clear e)
    (wolna-reka)
))
)

3. Rozsypanka:

(define (problem stack_all_packages)
    (:domain world-of-blocks)
    (:objects a b c d e f - paczka)
    (:init
        (on-floor a)
        (on-floor b)
        (on-floor c)
        (on-floor d)
        (on-floor e)
        (clear a)
        (clear b)
        (clear c)
        (clear d)
        (clear e)
        (wolna-reka)
    )
    (:goal
  (and
    (exists (?base - paczka)
      (and
        (on-floor ?base)
        (forall (?x - paczka)
          (or
            (= ?x ?base)
            (exists (?y - paczka)
              (on-top ?x ?y)
            )
          )
        )
      )
    )
    (wolna-reka)
  )
)
