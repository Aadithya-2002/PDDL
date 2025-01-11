(define (problem windfarm-mission-1)
    (:domain windfarm)

    (:objects
        uuv1 - uuv  
        ship1 - ship 
        waypoint1 - location
        waypoint2 - location
        waypoint3 - location
        waypoint4 - location 
    )

    (:init
        (on-ship uuv1 ship1)   ;begins the journey from the ship
        (connected waypoint1 waypoint2)  ;configured the connection and paths between waypoint1 & waypoint2
        (connected waypoint2 waypoint1)  ;configured the connection and paths between waypoint2 & waypoint1
        (connected waypoint2 waypoint3)  ;configured the connection and paths between waypoint2 & waypoint3
        (connected waypoint3 waypoint4)  ;configured the connection and paths between waypoint3 & waypoint4
        (connected waypoint4 waypoint3)  ;configured the connection and paths between waypoint4 & waypoint3
        (connected waypoint4 waypoint1)  ;configured the connection and paths between waypoint4 & waypoint1
    )

    (:goal
        (and
             (captured-image uuv1 waypoint3)  ;captured and saved the image at waypoint3
             (scanned-sonar uuv1 waypoint4)   ;scanned and savved the sonar at waypoint4
            
        )
    )
)