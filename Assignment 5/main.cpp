#include <iostream>
#include <vector>
#include <string>
#include <iomanip>
using namespace std;

class Ride {
protected:
    int rideID;
    string pickupLocation;
    string dropoffLocation;
    double distance;

public:
    Ride(int id, string pickup, string dropoff, double dist)
        : rideID(id), pickupLocation(pickup), dropoffLocation(dropoff), distance(dist) {}

    virtual double calculateFare() const {
        return distance * 2.0;
    }

    virtual void rideDetails() const {
        cout << "Ride ID: " << rideID << endl;
        cout << "Pickup: " << pickupLocation << endl;
        cout << "Dropoff: " << dropoffLocation << endl;
        cout << "Distance: " << distance << " miles" << endl;
        cout << "Fare: $" << fixed << setprecision(2) << calculateFare() << endl;
    }

    virtual ~Ride() {}
};

class StandardRide : public Ride {
public:
    StandardRide(int id, string pickup, string dropoff, double dist)
        : Ride(id, pickup, dropoff, dist) {}

    double calculateFare() const override {
        return distance * 2.00;
    }

    void rideDetails() const override {
        cout << "\n--- Standard Ride ---" << endl;
        Ride::rideDetails();
    }
};

class PremiumRide : public Ride {
public:
    PremiumRide(int id, string pickup, string dropoff, double dist)
        : Ride(id, pickup, dropoff, dist) {}

    double calculateFare() const override {
        return distance * 3.50;
    }

    void rideDetails() const override {
        cout << "\n--- Premium Ride ---" << endl;
        Ride::rideDetails();
    }
};

class Driver {
private:
    int driverID;
    string name;
    double rating;
    vector<Ride*> assignedRides;

public:
    Driver(int id, string driverName, double driverRating)
        : driverID(id), name(driverName), rating(driverRating) {}

    void addRide(Ride* ride) {
        assignedRides.push_back(ride);
    }

    void getDriverInfo() const {
        cout << "\n=== Driver Information ===" << endl;
        cout << "Driver ID: " << driverID << endl;
        cout << "Name: " << name << endl;
        cout << "Rating: " << rating << endl;
        cout << "Completed Rides: " << assignedRides.size() << endl;

        for (Ride* ride : assignedRides) {
            ride->rideDetails();
        }
    }
};

class Rider {
private:
    int riderID;
    string name;
    vector<Ride*> requestedRides;

public:
    Rider(int id, string riderName)
        : riderID(id), name(riderName) {}

    void requestRide(Ride* ride) {
        requestedRides.push_back(ride);
    }

    void viewRides() const {
        cout << "\n=== Rider Information ===" << endl;
        cout << "Rider ID: " << riderID << endl;
        cout << "Name: " << name << endl;
        cout << "Requested Rides: " << requestedRides.size() << endl;

        for (Ride* ride : requestedRides) {
            ride->rideDetails();
        }
    }
};

int main() {
    StandardRide ride1(101, "Campus", "Mall", 5.5);
    PremiumRide ride2(102, "Airport", "Hotel", 12.0);
    StandardRide ride3(103, "Library", "Downtown", 8.2);

    vector<Ride*> rides;
    rides.push_back(&ride1);
    rides.push_back(&ride2);
    rides.push_back(&ride3);

    cout << "=== Polymorphism Demonstration ===" << endl;
    for (Ride* ride : rides) {
        ride->rideDetails();
    }

    Driver driver1(1, "Alex Johnson", 4.8);
    driver1.addRide(&ride1);
    driver1.addRide(&ride2);

    Rider rider1(201, "Maria Lopez");
    rider1.requestRide(&ride1);
    rider1.requestRide(&ride3);

    driver1.getDriverInfo();
    rider1.viewRides();

    return 0;
}