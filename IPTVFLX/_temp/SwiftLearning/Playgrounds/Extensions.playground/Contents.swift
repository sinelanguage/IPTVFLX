import UIKit
import SwiftUI

var greeting = "Hello, playground"

// Extensions are like the prototype chain but for types

extension String {
    func trimmed() -> Void { // trimmed is fn name
        self.trimmingCharacters(in: .whitespacesAndNewlines) // you can use self to refer the current string instance
    }
}

// naming fn, if it has a return value, use 'ed' suffix like "reversed" as opposed to modifying a value in place (mutating it), use the present tense "reverse"

// using extensions to add properties to types, must be computed properties
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 10
    }
}

// Protocol Extensions
// here's a use case

let guests = ["Syl", "Cassia", "Ad"]

if guests.isEmpty == false {
    print(guests.count)
}

// doesn't read naturally, "if not some array isEmpty"
// instead , write an extension to the Collection protocol
// Collections is adopted and conformed by Array, Set and Dictionary

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

// now we can use isNotEmpty on arrays, sets and dicts
// by doing this we add functionality that would otherwise have to be done on a Struct:
// protocol-oriented programming
// example

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("hi i'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "T Swift")
taylor.sayHello()
