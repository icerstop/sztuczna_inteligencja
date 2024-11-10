(define (problem planeta)
    (:domain planeta)
    (:objects
        D0 D1 D2 D3 D4 D5 D6 - dzwignia
        sa sb sc sd se - gwiazda
        m1 m2 m3 m4 m5 m6 - miejsce
        P1 P2 P3 P4 P5 P6 P7 - planeta
        P - przycisk
)
    (:init
        (podroznik P1)
        (zagadka P6)
        (przycisk P5)
        (not(aktywny_przycisk))

        (dzwignia D1 P1)
        (dzwignia D3 P2)
        (dzwignia D4 P4)
        (dzwignia D5 P5)
        (dzwignia D6 P6)
        
        (aktywna_dzwignia D0)
        
        (not(aktywna_dzwignia D1))
        (not(aktywna_dzwignia D3))
        (not(aktywna_dzwignia D4))
        (not(aktywna_dzwignia D5))
        (not(aktywna_dzwignia D6))

        (sasiad_przycisk P1 P6)
        (sasiad_przycisk P6 P1)
        
        (sasiad P1 P6 D5)
        (sasiad P6 P1 D5)
        (sasiad P6 P7 D6)
        (sasiad P7 P6 D6)
        (sasiad P1 P2 D1)
        (sasiad P2 P1 D1)
        (sasiad P3 P4 D3)
        (sasiad P4 P3 D3)
        (sasiad P3 P5 D4)
        (sasiad P5 P3 D4)
        
        (sasiad P2 P3 D0)
        (sasiad P3 P2 D0)
        (sasiad P4 P5 D0)
        (sasiad P5 P4 D0)

        (puste m5)
        (gwiazda sd m1)
        (gwiazda se m2)
        (gwiazda sa m3)
        (gwiazda sb m4)
        (gwiazda sc m6)
    )
    (:goal
        (and
            (podroznik P7)
            (puste m6)
            (gwiazda sa m1)
            (gwiazda sb m2)
            (gwiazda sc m3)
            (gwiazda sd m4)
            (gwiazda se m5)
        )
    )
)
    

        
