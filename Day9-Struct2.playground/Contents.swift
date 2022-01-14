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

// MARK: - Lazy properties
/// lazy khi được sử dụng sẽ khiến cho func chỉ khởi tạo khi được gọi tới
// lazy var personLazy = Person(name: "ABC", age: 12)

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

print(Student.classSize)

// MARK: - PRIVATE
// Nếu thuộc tính là private, hàm sẽ không tự động gen code init

struct PersonPri {
    private var socialSecurityNumber: String
    init(ssn: String) {
        socialSecurityNumber = ssn
    }
}
let sarah = PersonPri(ssn: "555-55-5555")
