import UIKit

/// Tái sử dụng code
///

func sendMessage() {
    print("Sending message...")
}
sendMessage()

// MARK: - return two or more values from a function

///Using a tuple, such as (name: String, age: Int)
///Using some sort of collection, such as an array or a dictionary.

func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print(user[0])

func getUser1() -> [String: String] {
    ["first": "Taylor", "last": "Swift"]
}

let user1 = getUser1()
print(user1["first"])

func getUser2() -> (first: String, last: String) {
    (first: "Taylor", last: "Swift")
}

let user2 = getUser2()
print(user2.first)

// MARK: - Parameter Label

func setAge(for person: String, to value: Int) {
    print("\(person) is now \(value)")
}
setAge(for: "Trung Duc", to: 18)

// MARK: - DEFAULT PARAMETER

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)")
    } else {
        print("Oh no, it's \(person) again")
    }
}

greet("Taylor")
greet("Taylor", nicely: false)

// MARK: - Varidic Function:
/// Ví dụ về pass nhiều data vào
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)

// MARK: - THROWING Function
/// Nếu không có throws thì trong function k thể throw error
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}
