(define (problem windfarm-mission-3)
    (:domain windfarm)

    (:objects
        uuv1 - uuv
        uuv2 - uuv ;2nd uuv  is introduced
        ship1 - ship
        ship2 - ship ;second ship is introduced
        waypoint1 - location
        waypoint2 - location
        waypoint3 - location
        waypoint4 - location
        waypoint5 - location
        waypoint6 - location
        
    )

    (:init
        (at uuv1 waypoint2)  ;uuv1 starts at waypoint2
        (on-ship uuv2 ship2)  ;uuv2 starts from ship2
        (connected waypoint1 waypoint2) ;connected waypoint1 and waypoint2
        (connected waypoint2 waypoint4) ;connected waypoint2 and waypoint4
        (connected waypoint2 waypoint3) ;connected waypoint2 and waypoint3
        (connected waypoint3 waypoint5) ;connected waypoint3 and waypoint5
        (connected waypoint5 waypoint6) ;connected waypoint5 and waypoint6
        (connected waypoint6 waypoint4) ;connected waypoint6 and waypoint4
        ;(not (memory-full uuv1)) ;indicates the storage memory of uuv1 is not full
        ;(not (memory-full uuv2)) ;indicates the memory of uuv2 is not full
        
    )

    (:goal
        (and
             (captured-image uuv1 waypoint3) ;uuv1 captures and save image at waypoint3
             (scanned-sonar uuv2 waypoint4)  ;uuv2 cinducts sonar scan and saves it at waypoint4
             (captured-image uuv1 waypoint2) ;uuv1 captures image at waypoint2
             (scanned-sonar uuv2 waypoint6) ;uuv2 conducts sonar scan at waypoint6
             (collected-sample uuv1 waypoint5) ;uuv1 collects sample at waypoint5
             (collected-sample uuv2 waypoint1) ;uuv2 collects sample at waypoint1
            
        )
    )
)