(define (problem windfarm-mission-2)
    (:domain windfarm)

    (:objects
        uuv1 - uuv 
        ship1 - ship
        waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 - location
    )

    (:init
        (on-ship uuv1 ship1) ;uuv1 starts at ship
        (connected waypoint1 waypoint2) ;connected waypoint1 and waypoint2
        (connected waypoint1 waypoint4) ;connected waypoint1 and waypoint4
        (connected waypoint4 waypoint3) ;connected waypoint4 and waypoint3
        (connected waypoint2 waypoint3) ;connected waypoint2 and waypoint3
        (connected waypoint3 waypoint5) ;connected waypoint3 and waypoint5
        (connected waypoint5 waypoint1) ;connected waypoint5 and waypoint1
        
    )

    (:goal
        (and 
             (captured-image uuv1 waypoint5) ;captured image at waypoint5
             (scanned-sonar uuv1 waypoint3) ;scanned sonar at waypoint3
             (collected-sample uuv1 waypoint1) ;collected sample from waypoint1
        )
    )
)