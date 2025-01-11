(define (domain windfarm)
    (:requirements :strips :typing :negative-preconditions)

    ; -------------------------------
    ; Types
    ; -------------------------------

    ; EXAMPLE

    ; (:types
    ;     parent_type
    ;     child_type - parent_type

    ; )
    (:types
        uuv location ship
    )
    ; uuv : Represents the unmanned underwater vehicle
    ; location : Represents the locations where the uuv can move
    ; ship : Represents the starting and ending points

    ; -------------------------------
    ; Predicates
    ; -------------------------------

    ; EXAMPLE

    ; (:predicates
    ;     (no_arity_predicate)
    ;     (one_arity_predicate ?p - parameter_type)
    ; )

    (:predicates
        (at ?uuv - uuv ?loc - location)                 ; states at what certain location the uuv is present
        (on-ship ?uuv - uuv ?ship - ship)         ; indicates the status of the uuv, whether it's currently on the ship or it hasn't been deployed
        (connected ?loc1 - location ?loc2 - location) ;sates 2 locations are connected & the uuv can move between them
        (captured-image ?uuv - uuv ?loc - location)   ; the uuv has captured a image at a specific location
        (scanned-sonar ?uuv - uuv ?loc - location)    ; uuv has performed a sonar scan at a specific location
        (collected-sample ?uuv - uuv ?loc - location) ; uuv have collected samples from a specific location
        (memory-full ?uuv - uuv)               ;indicates the storage memory of the uuv
        (deployed ?uuv - uuv)                         ;indicatesthe uuv have been deployed
    )


    ; -------------------------------
    ; Actions
    ; -------------------------------

    ; EXAMPLE

    ; (:action action-template
    ;     :parameters (?p - parameter_type)
    ;     :precondition (and
    ;         (one_arity_predicate ?p)
    ;     )
    ;     :effect 
    ;     (and 
    ;         (no_arity_predicate)
    ;         (not (one_arity_predicate ?p))
    ;     )
    ; )

    (:action deploy-uuv
        :parameters (?uuv - uuv ?loc - location ?ship - ship)          ;where it will be deployed
        :precondition (on-ship ?uuv ?ship)                               ;uuv must be on ship
        :effect (and 
            (deployed ?uuv)                                             ;indicates the uuv have been deployed
            (and (at ?uuv ?loc))
            (not (on-ship ?uuv ?ship)))                                 ; uuv is now at the location and not on the ship
    )

    (:action move-uuv
        :parameters(?uuv - uuv ?loc1 - location ?loc2 - location)
        :precondition(and (at ?uuv ?loc1) (connected ?loc1 ?loc2))     ;uuv must be at one location and the other location should be connected
        :effect(and (at ?uuv ?loc2) (not (at ?uuv ?loc1)))             ;after the move uuv must be at loc1 not at loc2
    )

    (:action capture-image
        :parameters(?uuv - uuv ?loc - location) 
        :precondition(and 
                          (at ?uuv ?loc)                         ;uuv must be at the location
                          (not (memory-full ?uuv)))              ;uuv memory must not be full
        :effect (and (captured-image ?uuv ?loc)
                     (memory-full ?uuv))                         ;capture the image at location
    )

    (:action collect-sample
        :parameters(?uuv - uuv ?loc - location)
        :precondition(and (at ?uuv ?loc) (not (memory-full ?uuv)))    ;uuv must be at the location
        :effect(and (collected-sample ?uuv ?loc)
                    (memory-full ?uuv))                               ;after the collection, it must be saved that the sample is collected at the location
    )

    (:action sonar-scan
        :parameters (?uuv - uuv ?loc - location)
        :precondition (and(at ?uuv ?loc) (not(memory-full ?uuv)))      ;uuv must be at the location
        :effect (and (scanned-sonar ?uuv ?loc)
                      (memory-full ?uuv))                               ;after sonar scan, the scan should be saved
    )

    (:action send-data                                                   ;sends memory after each task and perform additional tasks 
        :parameters (?uuv - uuv)
        :precondition (memory-full ?uuv)
        :effect (not (memory-full ?uuv))
    )


)