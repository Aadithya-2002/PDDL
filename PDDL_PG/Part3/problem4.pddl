(define (problem windfarm-mission-1)
    (:domain windfarm-1)

    (:objects
        uuv1 - uuv ;uuv1 is declared as uuv
        eng - engineer ;engineer is referred as eng
        ship - ship ;ship is referred as ship
        bay - location ;bay is added as location
        controlcentre - location ;controlcentre is added as location
        waypoint1 - location
        waypoint2 - location
        waypoint3 - location 
        waypoint4 - location
        waypoint5 - location
        waypoint6 - location ;locations are added
        image - data-type ;image is declared as datatype
        sonar - data-type
    )

    (:init
        (on-ship uuv1)
        (engineer-at eng bay)
        (connected bay controlcentre)
        (connected waypoint1 waypoint2) ;connected waypoint1 and waypoint2
        (connected waypoint2 waypoint1) ;connected waypoint2 and waypoint1
        (connected waypoint2 waypoint4) ;connected waypoint2 and waypoint4
        (connected waypoint2 waypoint3) ;connected waypoint2 and waypoint3
        (connected waypoint3 waypoint5) ;connected waypoint3 and waypoint5
        (connected waypoint5 waypoint3) ;connected waypoint5 and waypoint3
        (connected waypoint5 waypoint6) ;connected waypoint5 and waypoint6
        (connected waypoint6 waypoint4) ;connected waypoint6 and waypoint4
        (connected waypoint4 waypoint2) ;connected waypoint4 and waypoint2   
    )

    (:goal
        (and
            (at uuv1 waypoint3)  ;uuv at waypoint3
            (data-transmitted uuv1 image) ;uuv transmitted data in image
            (scanned-sonar uuv1 sonar) ;uuv transmitted data in sonar
        )
    )
)