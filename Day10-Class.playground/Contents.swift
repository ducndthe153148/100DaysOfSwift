import UIKit

//MARK: - CLASS

/// Phải tự tạo hàm khởi tạo
///

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Con Cho", breed: "Thuc an")

// Khác nhau giữa struct và class
/// Class không tự khởi tạo
/// 1 class có thể kế thừa (properties và method) của class khác
/// copies của struct luôn unique, còn copies của class same shared data
/// class có deinit, struct không có
/// Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot.

class BoardGame {
    var name: String
    var minimumPlayers = 1
    var maximumPlayers = 4
    init(name: String) {
        self.name = name
    }
}

// MARK: - Inheritance/ Override method

class Vehicle {
    var wheels: Int
    init(wheels: Int) {
        self.wheels = wheels
    }
    func makeNoise(){
        print("Brm brm")
    }
}
class Truck: Vehicle {
    var goodsCapacity: Int
    init(wheels: Int, goodsCapacity: Int) {
        self.goodsCapacity = goodsCapacity
        super.init(wheels: wheels)
    }
    override func makeNoise() {
        print("LALALALA")
    }
}

let truck = Truck(wheels: 10, goodsCapacity: 8)
truck.makeNoise()

class Instrument {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Piano: Instrument {
    var isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
        super.init(name: "Piano")
    }
}

// MARK: - final keyword
/// Không thể inheritance từ class khác
/// Chỉ cần thêm chữ final trước class là được
///
///The third difference between classes and structs is how they are copied. When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.

class Author {
    var name = "Anonymous"
}
var dickens = Author()
dickens.name = "Charles Dickens"
var austen = dickens
austen.name = "Jane Austen"
print(dickens.name)
print(austen.name)

// print same of code

// MARK: - Class có thể deinit
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

/// Class thì không cần phải thêm mutating. Chỉ Struct cần
///
///

class Singer {
    var name = "Taylor Swift"
    // Nếu muốn không đổi được name thì đổi var thành let
}

let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)

class SingerHandsome {
    let name = "Trung Duc"
    let age: Int
    
    init(age: Int) {
        self.age = age
    }
}

let trungDuc = SingerHandsome(age: 11)
print(trungDuc)


//MARK: - TỔNG Kết

/// Class và struct khá giống nhau, có thể tạo được loại riêng với các thành phần
/// One class can inherit from another, and it gains all the properties and methods of the parent class. It’s common to talk about class hierarchies – one class based on another, which itself is based on another.
/// You can mark a class with the final keyword, which stops other classes from inheriting from it.
/// overriding lets a child class replace a method in its parent class with a new implementation.
/// When two variables point at the same class instance, they both point at the same piece of memory – changing one changes the other.
/// Classes can have a deinitializer, which is code that gets run when an instance of the class is destroyed.
/// Classes don’t enforce constants as strongly as structs – if a property is declared as a variable, it can be changed regardless of how the class instance was created.
