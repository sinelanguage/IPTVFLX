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

class UserTwoTwo {
    var username = "none"
    
    init(){
        print("I'm the parent class")
    }
    
    func copy() {
        print("i'm the original method")
    }
}

class UserTwoOne: UserTwoTwo {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        super.init()
        print("I'm the child class")
    }
    
    override func copy() {
        print("i'm an overridden fn")
    }
}
