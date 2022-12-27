import UIKit

var greeting = "Hello, playground"

//func commute(distance: Int, using vehicle: Car) {
//    // code
//}

// we only care about commuting, which is broader than caring about some props and methods on the vehicle itself in this case a car, so to bring those things along to shape the datatype we are using in a fn param, we use protocols

// They may not be travelling buy car
//func commute(distance: Int, using vehicle: Car) {
//    // code
//}

// Protocols are contracts that let us define what kinds of functionality a data type is meant to support

// Protocols allow us to define props and methods we want to use but it doesn't implement them.  Its a blueprint that they must exist

// They are similar to Typescript Interfaces
// so far they are only dealing with methods
// They don't have to adopt or conform ONLY to the methods in the protocol but all methods on the protocol must exist

// Protocols don't get a default value

//protocol Vehicle {
//    func time(for distance: Int) -> Int
//    func travel(distance: Int)
//}

// sample conforming struct

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    func time(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroom() {
        print("open")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func time(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm riding my bike \(distance)km")
    }
}

func commute(distance: Int, using vehicle: Vehicle) { // could be vehicle: Car for param labels: Type, or Vehicle
    if vehicle.time(for: 20) > 100 {
        print("too slow")
    } else {
        print("fast enough")
        vehicle.travel(distance: 50)
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 20, using: bike)


// No default values allowed when declaring a new protocol
protocol Vehicle {
    var name: String { get } // can be read only, not write
    var currentPassengers: Int { get set } // can be read/write
    func time(for distance: Int) -> Int
    func travel(distance: Int)
}

// So now we can write a fn, that accepts an array of Vehicles, and since the instances of car and bike conform to their protocols which conform to the Vehicle protocol, it halps ensure the behaviour of code is consistent

func getTravelTimes(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.time(for: 30)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")

    }
}

getTravelTimes(using: [car, bike], distance: 150)

// Protocols can be adopted or conformed to by classes or structs


// opaque return types
// two types conform to the same protocol


//The following code throws an error unless we add the "some" keyword


func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())
