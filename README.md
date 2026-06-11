# RideShareSystem

## Overview

RideShareSystem is a class-based ride-sharing application implemented in both **C++** and **Smalltalk**. The project demonstrates key Object-Oriented Programming (OOP) concepts by modeling rides, drivers, and riders within a ride-sharing environment.

The system allows riders to request rides, drivers to manage assigned rides, and different ride types to calculate fares using their own pricing rules.

---

## OOP Principles Demonstrated

### Encapsulation

Encapsulation is implemented by restricting direct access to object data and providing methods to interact with that data.

Examples:

- The `Driver` class maintains a private collection of assigned rides.
- The `Rider` class maintains a private collection of requested rides.
- Ride information is accessed through class methods rather than direct manipulation.

### Inheritance

Inheritance is demonstrated through the ride hierarchy.


class StandardRide : public Ride. 

class PremiumRide : public Ride
