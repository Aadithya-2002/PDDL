(define (problem windfarm-mission-2)
    (:domain windfarm-2)

    (:objects
        uuv1 - uuv ;uuv is decalred as uuv1
        eng - engineer ;engineer is declared as eng
        ship -ship ;ship is referred as ship
        bay1 - location ; bay is declared as location
        controlcentre1 - location ;controlcentre is declared as location
        waypoint1 - location
        waypoint2 - location
        waypoint3 - location
        waypoint4 - location
        waypoint5 - location
        waypoint6 - location ;waypoints are declared as location
    )

    (:init
     (on-ship uuv1)
     (engineer-at eng bay1) ;engineer is at bay
     (connected bay1 controlcentre1) ;bay and control centre is connected
     (connected waypoint1 waypoint2) ;connected waypoint1 and waypoint2
     (connected waypoint2 waypoint4) ;connected waypoint2 and waypoint4
     (connected waypoint2 waypoint3) ;connected waypoint2 and waypoint3
     (connected waypoint3 waypoint5) ;connected waypoint3 and waypoint5
     (connected waypoint5 waypoint6) ;connected waypoint5 and waypoint6
     (connected waypoint6 waypoint4) ;connected waypoint6 and waypoint4
     (memory-full uuv1)    ;memory is full
    )

    (:goal
        (and
           (algae-present waypoint2) ;algae present at waypoint2
           (algae-present waypoint4) ;algae present at waypoint4
           (algae-present waypoint5) ;algae present at waypoint5
        )
    )
)