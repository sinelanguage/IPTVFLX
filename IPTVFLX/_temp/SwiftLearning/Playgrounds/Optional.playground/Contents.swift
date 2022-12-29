import UIKit

var greeting = "Hello, playground"

// optionals, there might be data in the box, there might not, you need to unwrap the box (unwrap the optional) to see

let demoOptionalArray = [
    "Adam": "Dad",
    "Sylvia": "Mom",
    "Cassia": "Daughter"
]

var dog: String? = demoOptionalArray["Dog"]

if let dog = demoOptionalArray["Dog"] {
    print("Found a dog")
} else {
    print("no dog here")
}

print("WTF")

// second way to unwrap optionals is to use guard, only works in a fn and needs a return statement
// guard let dogTwo = demoOptionalArray["Dog"] else {
//     print("no dog here")
// }

// nil coalescing
let myVar = demoOptionalArray["Cat"] ?? "Allergies"

// option training

struct NewBook {
    let title: String
    let author: String?
}

var newBook: NewBook? = nil
let author = newBook?.author?.first?.uppercased() ?? "A"
print(author)

// put it all together, and handle function failure with optionals

enum DemoError: Error {
    case errorOne, errorTwo
}

func demoError() throws -> String {
    throw DemoError.errorOne
}

if let demoLet = try? demoError() {
    print("good")
}
