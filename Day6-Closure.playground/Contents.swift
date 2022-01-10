import UIKit

//MARK: Closures:
/// Hiểu đơn giản là khi truyền 1 function vào làm parameter của 1 function
///

// Closure don gian:

let driving = {
    print("I'm driving car")
}
driving()

// Accepting a parameter

let driving1 = { (place: String) in
    print("I'm going to \(place) in my car")
}

driving1("London")

// More example
var pickFruit = { (name: String) in
    switch name {
    case "strawberry":
        fallthrough
    case "raspberry":
        print("Strawberries and raspberries are half price!")
    default:
        print("We don't have those.")
    }
}

pickFruit("strawberry")

// Return value

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

let payment = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}

// Closure as parameter

func travel (action: () -> Void) {
    print("ABCXYZ")
    action()
    print("XYZZ")
}

//travel(action: driving)
travel {
    print("Hula")
}

// MARK: - trailing closure

func travel2(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel2{
    print("i'm driving car4")
}

//
func travel3(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel3 { (place: String) in
    print("I'm going to place \(place)")
}
