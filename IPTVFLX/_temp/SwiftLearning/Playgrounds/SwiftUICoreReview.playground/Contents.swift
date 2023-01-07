import UIKit

var greeting = "Hello, playground"

// Strings
let me = "Adam Winick"
print(me.hasPrefix("ad"))
print(me.hasSuffix("ck"))

//Ints
var age = 47
age += 1
print(age)
print(age.isMultiple(of: 3))

// Generate random int within a range
var ageRange = Int.random(in: 1...1000)
print(ageRange)

// Bools
var isAuthorized = true
isAuthorized.toggle()

// Collections

// Arrays
var carsBrands = ["Koenigsegg", "McLaren", "Lamborghini"]
carsBrands.append("Zenvo")
print(carsBrands)
carsBrands.remove(at: 2)
print(carsBrands)
carsBrands.contains("McLaren")

// Dictionaries
var Jesko = ["brand": "Koenigsegg", "model": "Jesko"]

// Sets
var numbers = Set([1,1,1,5,5,5,6,6,2,3,1])
print(numbers)
numbers.insert(14)
print(numbers)

//enums

enum Weekday {
    case money, tuesday, wednesday, thursday, friday
}

var day = Weekday.money
day = .friday
print(day)

// Type annotations
let firstName: String = "Adam"
let cars: Int = 2
var isEnabled: Bool = false
var albums: [String] = ["pablo honey", "violator"]
var radioHead: [String: String] = ["leadSinger": "Thom Yorke"]
var plates: Set<Int> = Set([25, 25, 35 ,35 ,35, 10, 10, 5, 5, 5, 45, 45])

// Enum type annotations

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = .light

// Functions
// Vanilla

func getPlates(platesSet: Set<Int>) -> [Int]{
    let plates = platesSet
    return Array(plates)
}

print(getPlates(platesSet: plates))

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Adam", lastName: "Winick")
}

let adam = getUser()
print(adam.firstName, adam.lastName)

// func name(_ paramName: String) -> String { ...
// name("Whatever, there's no param name with _")

// func name(who isHere: String) -> String {
//      return isHere
// }
// call func with first param label, use second label in the fn body
// name(who: "Adam")

// Errors
// tell swift what errors to handle, write a fn that can throw them, then call them in error handlers

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "123" {
        throw PasswordError.obvious
    } else {
        return "Good"
    }
}

let password = "123"

// do try catch
// have a catch clause block for each error and every error
do {
    let pw = try checkPassword(password)
    print("Raing \(pw)")
} catch PasswordError.obvious {
    print("shitty suggestion, too easy to guess")
} catch PasswordError.short{
    print("too short")
} catch {
    print("There was an error")
}

// Closures

let sayHello = {
    print("hi")
}
sayHello()

// the in keyword marks the end of parameters and return types
// everything else that follows is ht body of the closure itself
let sayHello2 = {
    (name: String) -> String in
    "Hi \(name)"
}

print(sayHello2("Adam"))

let team = ["Adam", "Cassia", "Lily", "Sylvia"]

let onlyA = team.filter { (name: String) -> Bool in
    return name.hasPrefix("Ad") // we can remove the return statement if its only 1 line in the body
}

// shorthand trailing closures
// in 3 steps, we can remove types because its a closure that's passed into filter method

let onlyB = team.filter({ name in
    name.hasPrefix("Ad")
})

let onlyC = team.filter { name in
    name.hasPrefix("Ad")
}


let onlyD = team.filter {
    $0.hasPrefix("Ad")
}

// Structs

struct Album {
    let title: String
    let artist: String
    var isReleased = true
    static let provider = "Apple Music"
    
    var titleArtist: String {
        get {
            title + artist
        }
        set {
            title + artist
        }
    }
    
    func printSummary() {
        print("\(title), \(artist)")
    }
    
    mutating func removeFromSale() {
        isReleased = false
    }
    
    init(title: String, artist: String){
        self.title = title
        self.artist = artist
    }
}
               
let pabloHoney = Album(title: "Pablo Honey", artist: "Radiohead")
               
print(pabloHoney.title)
pabloHoney.printSummary()

// Classes
// 5 differences, class inheritance from others, initializers are trickier, you have to call super and pass in the initialized members from the parent class, but only if the child has its own initializer, otherwise it inherit's the parents, all copies share the same data, you can deinit, and also you can change variable class props even if the class itself is a constant

class Employee {
    var hours: Int
    
    init (hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work for \(hours)")
    }
    
}

class Developer: Employee {
    var overtimeHours: Int
    
    func work() {
        print("I'm coding for \(hours)")
    }
    
    override func printSummary() {
        print("I spend \(hours) \(overtimeHours) hours a day searching Stack Overflow.")
    }
    
    init(hours: Int, overtimeHours: Int){
        self.overtimeHours = overtimeHours
        super.init(hours: hours)
    }
    
    deinit {
        print("Class destroyed")
    }
}

let novall = Developer(hours: 99, overtimeHours: 99)

novall.work()
novall.printSummary()

let constantClassInstantExample = Developer(hours: 99, overtimeHours: 99)

constantClassInstantExample.hours = 80
constantClassInstantExample.work()

// Protocols define functionality we expect a data type to support and ensure the code follows those rules

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
}

// All the methods listed in Vehicle must exist exactly in Car, with the same name, parameters, and return types.

// Now you can write a function that accepts any kind of type that conforms to Vehicle, because Swift knows it implements both estimateTime() and travel():

func commute(distance: Int, using vehicle: Vehicle, of number: Int?) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
    
    guard let number = number else {
        print("no number")
        return
    }
}

let car = Car()
commute(distance: 100, using: car, of: nil)
