//
//  Classes.swift
//  IPTVFLX
//
//  Created by Adam Winick on 2022-12-23.
//

import Foundation

// Classes extend, structs don't

class GameTwo {
    var score = 0 {
        didSet {
            print(score)
        }
    }
}

var newGame = GameTwo()
// newGame.score += 10

class EmployeeTwo {
    let hours: Int
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) per day")
    }
}

class Developer: EmployeeTwo {
    func code() {
        print("I code for \(hours) hours")
    }
}

class SeniorDev: EmployeeTwo {
    func code() {
        print("I code for \(hours) hours")
    }
}

let adamTwo = Developer(hours: 15)
let nathan = SeniorDev(hours: 15)

// if a class is an instance of another class, if that instance class has an initializer, then it needs to call super in order to initiate the parent class too

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class CarTwo: Vehicle {
    let isConvertable: Bool
    
    init(isElectric: Bool, isConvertable: Bool) {
        self.isConvertable = isConvertable
        super.init(isElectric: isElectric)
    }
}

let CivicSi = CarTwo(isElectric: false, isConvertable: false)

// Classes work by interitance and data is referenced and shared
// To deep copy a class, you have a write a method that does it internally
// on the root class.  No idea

class UserTwo {
    var username = "none"
    
    func copy() -> UserTwo {
        let user = UserTwo()
        user.username = username
        return user
    }
}
