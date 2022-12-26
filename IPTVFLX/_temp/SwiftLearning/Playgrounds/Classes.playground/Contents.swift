import UIKit

var greeting = "Hello, playground"

print(greeting)


// working with classes and how they are init, referenced and destroyed/cleaned up

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Class initiated \(id)")
    }
    
    deinit {
        print("Class destroyed \(id)")
    }
}

var users = [User]()

for i in 1...5 {
    let user = User(id: i)
    users.append(user)
}

print("finished")
users.removeAll()
print("clear")

class UserThree {
    var name = "Paul"
}

var user = UserThree()
user.name = "Alan"
print(user.name)
user = UserThree()
print(user.name)


class UserFour {
    var name = "Adam W"
}

let user4 = UserFour()
let user5 = UserFour()
let user6 = user4
user6.name = "Cassia W"
user5.name = "Sylvia O"
print(user4.name, user5.name, user6.name)

class UserTwo {
    var username = "none"
    init(){
        print("I'm the parent class")
    }
    
    func copy() {
        print("i'm the root class method")
    }
}

class UserTwoOneTwo: UserTwo {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        super.init()
        print("I'm the child class")
    }
    
    override func copy() -> Void{
        print("i'm an overridden fn")
    }
}
