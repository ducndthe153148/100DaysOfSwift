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

func getDirections(to destination: String, then travel: ([String]) -> Void) {
    let directions = [
        "Go straight ahead",
        "Turn left onto Station Road",
        "Turn right onto High Street",
        "You have arrived at \(destination)"
    ]
    travel(directions)
}
getDirections(to: "London") { (directions: [String]) in
    print("I'm getting my car.")
    for direction in directions {
        print(direction)
    }
}


func travelTest(action: (String) -> String) {
    print("I'm getting ready to go.")
    print(action("London"))
    print("I arrived!")
}

travelTest { place in
    print("This is: \(place)")
    return "HIHI place: \(place)"
}

// MARK: - Return closure
func travelReturn() -> (String) -> Void {
    // return a closure
    return {
        // a void closure
        print("i'm going to \($0)")
    }
}
let result2 = travelReturn()("London")

// More example
func makeRandomGenerator () -> () -> (Int) {
    let function = {
        return Int.random(in: 1...10)
    }
    return function
}

let generator = makeRandomGenerator()
let random1 = generator()
print(random1)

// Example 2
func createTravelMethod(distance: Int) -> (String) -> (Void) {
    if distance < 5 {
        return { value in
            print("Duong den \(value) ngan qua di")
        }
    } else if distance < 20 {
        return {
            value in
            print("Duong den \(value) xa qua di")
        }
    } else {
        return {
            print("Duong den \($0) het roi")
        }
    }
}

let duongDi = createTravelMethod(distance: 10)
duongDi("Trai tim crush")


// MARK: - Travel track

func travelTrack() -> (String) -> Void {
    // Vì counter nằm trong function chứ không nằm trong closure nên counter sẽ được tăng lên
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
let result = travelTrack()
result("London")
result("VietNam")
result("Americe")

