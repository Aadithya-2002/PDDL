(define (domain windfarm-2)
    (:requirements :strips :typing)

    (:types
        uuv location ship engineer
    )

    (:predicates
        (at ?uuv - uuv ?loc - location) ;uuv at a location
        (on-ship ?uuv - uuv) ;uuv on ship
        (connected ?loc1 - location ?loc2 - location) ;locations are connected
        (engineer-at ?eng - engineer ?loc - location) ;engineer at specified location
        (memory-full ?uuv - uuv) ;uuv memory is full
        (algae-present ?loc - location) ;algae is present at specific location
        (stuck ?uuv - uuv) ;uuv is stuck
    )

    (:action deploy-uuv
        :parameters (?uuv - uuv ?loc - location ?eng - engineer)
        :precondition (and 
                           (on-ship ?uuv) ;uuv is on the ship
                           (engineer-at ?eng bay1)) ;engineer must be at bay
        :effect (and (at ?uuv ?loc) ;uuv at location
                      (not (on-ship ?uuv))
                      (algae-present ?loc) (stuck ?uuv))  ;uuv is no longer on ship
    )

    (:action return-uuv
        :parameters (?uuv - uuv ?loc - location ?eng - engineer)
        :precondition (and
                           (at ?uuv ?loc) ;uuv is at specified location
                           (engineer-at ?eng bay1)) ;engineer is at bay
        :effect (and (on-ship ?uuv) ;uuv is on ship
                     (not (at ?uuv ?loc)) ;uuv no longer at specified location
        )
    )


    (:action move-engineer
        :parameters (?eng - engineer ?loc1 - location ?loc2 - location)
        :precondition (and (engineer-at ?eng ?loc1) ;engineer at loc1
                           (connected ?loc1 ?loc2) ;loc1 and loc2 are connected
        )
        :effect (and (engineer-at ?eng ?loc2) ; engineer is now at loc2
                     (not (engineer-at ?eng ?loc1)) ;engineer is no longer at loc1
        )
    )

    (:action move-uuv
        :parameters (?uuv - uuv ?eng - engineer ?loc1 - location ?loc2 - location)
        :precondition (and (engineer-at ?eng bay1) ;engineer at bay
                           (connected ?loc1 ?loc2) ;loc1 and loc2 are connected
                           (not (stuck ?uuv)))
        :effect (and 
                     (at ?uuv ?loc2)
                     (not (at ?uuv ?loc1))
                     (algae-present ?loc2) (stuck ?uuv) ;when xx
        )
    )

    (:action unstuck-routine
        :parameters (?uuv - uuv ?loc - location ?eng - engineer)
        :precondition (and (stuck ?uuv) ;uuv is stuck
                        (engineer-at ?eng controlcentre1) ;engineer at controlcentre
                        (algae-present ?loc)) ;algae is present at location
        :effect (and (not (stuck ?uuv)) ;uuv is not stuck
                     (not (algae-present ?loc))) ;algae is not present or removed
     )

)