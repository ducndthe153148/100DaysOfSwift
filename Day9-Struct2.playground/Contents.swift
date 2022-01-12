import UIKit

struct User {
    var name: String
    init() {
        name = "Anonymous"
        print("i'm trung duc")
    }
}

var user = User()
user.name = "Trung Dic"

// using init
 
struct Employee {
    var name: String
    var yearsActive = 0
}

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee()

//

struct Person {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age 
    }
}
