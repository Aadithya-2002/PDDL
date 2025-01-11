## Windfarm Mission Planning Using PDDL
This repository contains the PDDL (Planning Domain Definition Language) implementation for Part 1 of the Windfarm Mission Planning project. The project focuses on defining a planning domain and solving a problem instance related to deploying and managing unmanned underwater vehicles (UUVs) for tasks such as scanning, data transmission, and navigation within a windfarm.

## Table of Contents
1. Overview
2. Files
3. Features
4. Setup
5. Usage
6. Example Problem
7. Output and Goals

## Overview
In this project, we simulate a mission planning scenario involving UUVs, ships, engineers, and a windfarm environment. This implementation focuses on:

* Defining a domain (domain.pddl) that includes types, predicates, and actions for tasks such as deploying UUVs, returning UUVs to the ship, and transmitting data.
* Creating a problem (problem.pddl) that specifies initial conditions and goals for the mission.

## Files
Domain and Problem Files
* domain.pddl: Defines the actions, types, and predicates for the mission planning problem.
* problem.pddl: Specifies the initial state, objects, and goals for the mission.

## Features
1. Domain Definition:

* UUV Operations: Deployment, return, and data transmission.
* Engineer Actions: Movement between ship locations (bay and control center).
* Connections: Waypoints and ship locations are connected for navigation.
2. Problem Definition:

* Initial setup with UUV on the ship and the engineer at the bay.
* Defined connections between locations and waypoints.
* Goals include deploying the UUV to a specific waypoint and transmitting data.
3. Reusable Structure:

* The domain and problem files are modular and can be extended for more complex scenarios.

## Setup
To run the PDDL files, you will need a PDDL planner. Follow the steps below:

1. Install a PDDL planner, such as:

- Fast Downward
- OPTIC Planner
- PDDL Tools
2. Clone this repository:

```bash
git clone https://github.com/Aadithya-2002/Windfarm-Mission-Planning-Using-PDDL.git
cd Windfarm-Mission-Planning-Using-PDDL
```
3. Run the planner with the provided domain and problem files. For example:

```bash
./fast-downward.py domain.pddl problem.pddl --search "astar(lmcut())"
```

## Usage
1. Modify the Domain:

* Extend the domain.pddl file to add new actions or predicates for advanced operations.
2. Define a New Problem:

* Create new problem files (problem-2.pddl, etc.) to define different initial states and goals.
3. Test with a PDDL Planner:

* Use a PDDL planner to test the domain and problem definitions.

## Example Problem
# Initial State:
* The UUV (uuv1) is on the ship.
* The engineer (eng1) is at the bay.
* Locations (bay, control-centre, and waypoints) are connected.
# Goal:
* The UUV must:
- Reach waypoint 2.
- Transmit collected data (e.g., an image) while the engineer is in the control center.

## Output and Goals
When you run the domain and problem files with a PDDL planner, the planner will generate a sequence of actions to achieve the defined goals. For example:

```
1. Move-engineer eng1 bay control-centre
2. Deploy-uuv uuv1 waypoint2 eng1 ship
3. Transmit-data uuv1 eng1 ship image
```
