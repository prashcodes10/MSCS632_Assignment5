Object subclass: #Ride
    instanceVariableNames: 'rideID pickupLocation dropoffLocation distance'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideShareSystem'!

!Ride methodsFor: 'accessing'!

setRideID: id pickup: pickup dropoff: dropoff distance: dist
    rideID := id.
    pickupLocation := pickup.
    dropoffLocation := dropoff.
    distance := dist.
!

calculateFare
    ^distance * 2.0
!

rideDetails
    Transcript show: 'Ride ID: ', rideID printString; cr.
    Transcript show: 'Pickup: ', pickupLocation; cr.
    Transcript show: 'Dropoff: ', dropoffLocation; cr.
    Transcript show: 'Distance: ', distance printString, ' miles'; cr.
    Transcript show: 'Fare: $', self calculateFare printString; cr.
!

!!

Ride subclass: #StandardRide
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideShareSystem'!

!StandardRide methodsFor: 'accessing'!

calculateFare
    ^distance * 2.0
!

rideDetails
    Transcript cr; show: '--- Standard Ride ---'; cr.
    super rideDetails.
!

!!

Ride subclass: #PremiumRide
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideShareSystem'!

!PremiumRide methodsFor: 'accessing'!

calculateFare
    ^distance * 3.5
!

rideDetails
    Transcript cr; show: '--- Premium Ride ---'; cr.
    super rideDetails.
!

!!

Object subclass: #Driver
    instanceVariableNames: 'driverID name rating assignedRides'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideShareSystem'!

!Driver methodsFor: 'accessing'!

setDriverID: id name: driverName rating: driverRating
    driverID := id.
    name := driverName.
    rating := driverRating.
    assignedRides := OrderedCollection new.
!

addRide: ride
    assignedRides add: ride.
!

getDriverInfo
    Transcript cr; show: '=== Driver Information ==='; cr.
    Transcript show: 'Driver ID: ', driverID printString; cr.
    Transcript show: 'Name: ', name; cr.
    Transcript show: 'Rating: ', rating printString; cr.
    Transcript show: 'Completed Rides: ', assignedRides size printString; cr.
    assignedRides do: [:ride | ride rideDetails].
!

!!

Object subclass: #Rider
    instanceVariableNames: 'riderID name requestedRides'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideShareSystem'!

!Rider methodsFor: 'accessing'!

setRiderID: id name: riderName
    riderID := id.
    name := riderName.
    requestedRides := OrderedCollection new.
!

requestRide: ride
    requestedRides add: ride.
!

viewRides
    Transcript cr; show: '=== Rider Information ==='; cr.
    Transcript show: 'Rider ID: ', riderID printString; cr.
    Transcript show: 'Name: ', name; cr.
    Transcript show: 'Requested Rides: ', requestedRides size printString; cr.
    requestedRides do: [:ride | ride rideDetails].
!

!!

| ride1 ride2 ride3 rides driver rider |

ride1 := StandardRide new.
ride1 setRideID: 101 pickup: 'Campus' dropoff: 'Mall' distance: 5.5.

ride2 := PremiumRide new.
ride2 setRideID: 102 pickup: 'Airport' dropoff: 'Hotel' distance: 12.0.

ride3 := StandardRide new.
ride3 setRideID: 103 pickup: 'Library' dropoff: 'Downtown' distance: 8.2.

rides := OrderedCollection new.
rides add: ride1.
rides add: ride2.
rides add: ride3.

Transcript show: '=== Polymorphism Demonstration ==='; cr.
rides do: [:ride | ride rideDetails].

driver := Driver new.
driver setDriverID: 1 name: 'Alex Johnson' rating: 4.8.
driver addRide: ride1.
driver addRide: ride2.

rider := Rider new.
rider setRiderID: 201 name: 'Maria Lopez'.
rider requestRide: ride1.
rider requestRide: ride3.

driver getDriverInfo.
rider viewRides.