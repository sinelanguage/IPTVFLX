//
//  Structs.swift
//  IPTVFLX
//
//  Created by Adam Winick on 2022-12-21.
//

import Foundation

struct Me {
    var name: String
}

var adam = Me(name: "Adam Winick")

struct IPTVProvider {
    let id: String
    let name: String
    let meta: [String: String]
    let data: [String: String]
    
    // Adding mutating keyword allows us to call the FN if it changes any
    // struct data when using let to create instance of this struct
    
    mutating func getId() -> String {
        return id
    }
}

struct DumbStruct {
    let dumbInt = 10
    var dumbStr = "Adam"
}

// you can call .init on a struct, or just leave it out, as a shortform
// IPTVProvider(id: "1"....
var ExampleIPTVProvider = IPTVProvider.init(
    id: "1", name: "Epic", meta: ["someKey": "someValue"], data: ["someKey": "someValue"]
)

// I can leave out props, and I can set default values in the struct itself
var ADumbStruct = DumbStruct(dumbStr: "Winick")

// Computed properties: calc's the value of a struct property
// Every time a new instance is created

struct NonComputedPropertyStructExample {
    let name: String
    var vacationRemaining: Int
}

var nonComputedPropInstance = NonComputedPropertyStructExample(
    name: "Adam", vacationRemaining: 10
)

func testNonComputedProperty () {
    let _ = nonComputedPropInstance.vacationRemaining -= 5
}

struct ComputedPropertyStructExample {
    let name: String
    var vacationAllocated = 15
    var vacationTaken = 0
    
    // computed property
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}

var testComputedPropertyStruct =
ComputedPropertyStructExample(name: "Adam")

// getters and setters
struct ComputedPropertyWithGetSetStructExample {
    let name: String
    var vacationAllocated = 15
    var vacationTaken = 0
    
    // computed property
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            // newValue is a built in var supplied by Swift automagically
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var testGetSetPropertyStruct = ComputedPropertyWithGetSetStructExample.init(name: "Adam")

func getStuff() -> Void {
    testGetSetPropertyStruct.vacationTaken += 4
    testGetSetPropertyStruct.vacationRemaining = 6
}

// didSet and willSet obvservers

struct Game {
    var score = 0 {
        willSet {
            // newValue is built in by Swift
            print("score is about to change \(newValue)")
        }
        didSet {
            // oldValue is built in by Swift
            print("\(oldValue) \(score)")
        }
    }
}

// custom initializers
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...50)
    }
}

let player = Player(name: "Adam W")

// access control: public private mutating fileprivate and private(set)
struct AccessControl {
    private var canNavigate = false
    
    mutating func enableNav(flag: Bool) -> Bool {
        canNavigate = flag
        return canNavigate
    }
}

// Static properties and methods
// Static means the properties and methods belong to the
// Struct itself, and not to the instances.

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) is here")
        studentCount += 1
    }
}

// School.add(student: "Adam W")
// print(School.studentCount)

// Static props are good for static data and mock data
// A good way to accomplish this is use an example property like this:

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee.init(username: "sine", password: "pw123")
}

// in swift UI you can use this to populate a component with example data like this:

func getEmployee() -> Void {
    let _ = Employee.example
}

struct Car {
    private let model: String
    private let numberOfSeats: Int
    var gear: Int = 0
    
    init(model: String, numberOfSeats: Int){
        self.model = model
        self.numberOfSeats = numberOfSeats
    }
    
    mutating func shiftGears(nextGear: Int) -> Int {
        if(gear != nextGear){
           return nextGear
        }
        return gear
    }
}

var TypeR = Car.init(model: "Type R", numberOfSeats: 4)

func typeR() -> Void {
    let _ = TypeR.shiftGears(nextGear: 3)
}
