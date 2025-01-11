(define (domain windfarm-1)
    (:requirements :strips :typing :negative-preconditions)

    (:types
        uuv location ship engineer data-type image sonar
    )

    (:predicates
        (at ?uuv - uuv ?loc - location)  ;uuv is at a location
        (on-ship ?uuv - uuv) ;uuv is on the ship
        (connected ?loc1 - location ?loc2 - location) ;2 locations are connected
        (engineer-at ?eng - engineer ?loc - location) ;engineer at a location
        (data-transmitted ?uuv - uuv ?type - data-type) ;data transmitted by the uuv
        (scanned-sonar ?uuv - uuv ?type - data-type)  ;scanned sonar at location
        (memory-full ?uuv - uuv) ;uuv memory is full
        
    )

    (:action deploy-uuv
        :parameters (?uuv - uuv ?loc - location ?eng - engineer ?ship)
        :precondition (and 
                           (on-ship ?uuv) ;uuv on ship
                           
                           (engineer-at ?eng bay)) ;engineer must be at location
        :effect (and (at ?uuv ?loc) ;uuv at location
                      (not (on-ship ?uuv))) ;uuv is not on ship
    )
    
    (:action move-uuv
        :parameters(?uuv - uuv ?loc1 - location ?loc2 - location)
        :precondition(and (at ?uuv ?loc1) (connected ?loc1 ?loc2)) ;uuv must be at one location and the other location should be connected
        :effect(and (at ?uuv ?loc2) (not (at ?uuv ?loc1))) ;after the move uuv must be at loc1 not at loc2
    )

    (:action return-uuv
        :parameters (?uuv - uuv ?loc - location ?eng - engineer)
        :precondition (and
                           (at ?uuv ?loc) ;uuv at specified location
                           (engineer-at ?eng bay)) ;engineer at bay
        :effect (and (on-ship ?uuv) ;uuv is on ship
                     (not (at ?uuv ?loc)) ;uuv is no longer at location
        )
    )

    (:action transmit-data
        :parameters (?uuv - uuv ?eng - engineer ?type - data-type ?loc - location)
        :precondition (and (at ?uuv ?loc) ;uuv at location
                           (engineer-at ?eng controlcentre) ;engineer at controlcentre
                           (memory-full ?uuv) ;uuv memory is full
        )
        :effect (and (not (memory-full ?uuv)) ;uuv memory is no longer full
                     (data-transmitted ?uuv ?type) ;data has been transmitted
        )
    )

    (:action move-engineer
        :parameters (?eng - engineer ?loc1 - location ?loc2 - location)
        :precondition (and (engineer-at ?eng bay) ;engineer is at location1
                           (connected bay controlcentre)  ;location 1 and 2 are connected
        )
        :effect (and (engineer-at ?eng controlcentre) ;engineer is at location2
                     (not (engineer-at ?eng bay)) ;engineer not at location1
        )
    )

    (:action sonar-scan
        :parameters (?uuv - uuv ?loc - location ?eng - engineer ?type - data-type)
        :precondition (and(at ?uuv ?loc)
                          (engineer-at ?eng controlcentre)
                        (not(memory-full ?uuv))) ;uuv must be at the location
        :effect (and (scanned-sonar ?uuv ?type)
                      (memory-full ?uuv)) ;after sonar scan, the scan should be saved
    )



)