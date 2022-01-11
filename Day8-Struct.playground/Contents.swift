import UIKit

// MARK: - struct trong swift

// Demo:
struct User {
    var name: String
    var age: Int
    var city: String
}


struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)
// change name
tennis.name = "abcdxyz"

// MARK: - EXAMPLE 2
/// Có property name chứa String (gọi là stored propertíes)

struct Sport2 {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            // type string nên phải return 1 string
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

// olympicStatus has different return when input different name
let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// MARK: - Property observer
/// Chạy code trước và sau khi một  property nào đó thay đổi
/// willSet: diễn ra trước khi một property thay đổi, sử dụng khi muốn biết trạng thái của chương trình trước khi có thay đổi mới

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)%")
        }
    }
}
var progress = Progress(task: "Quet nha", amount: 100)
progress.task = "dad"
progress.amount = 89

// MARK: - Methods (Function in struct)
/// Có thể viết 1 func trong struct

struct city {
    var population: Int
    func collectMoney() -> Int {
        return population * 1000
    }
}

let london = city(population: 400)
london.collectMoney()

/// Khác nhau giữa Function và methods:
/// methods belong to a type, such as structs, enums, and classes, whereas functions do not.
///

// MARK: - Mutating methods
/// Dùng khi muốn sử dụng methods để thay đổi properties bên trong struct
///

struct PersonMutate {
    var name: String
    mutating func makeNameAnonymous(nameAn: String){
        name = "\(nameAn)"
    }
}
var personTest = PersonMutate(name: "Trung Duc")
personTest.makeNameAnonymous(nameAn: "Trung Kien")
print("This name is: \(personTest.name )")

class Person {

    var name: String

    init(name: String) {
        self.name = name
    }
    
}

let person1 = Person(name: "Trung Duc")
var person2 = person1
person1.name = "Hai"
print(person2.name)

struct Rectangle {
    var width = 1
    var height = 1
    
    func area(){
        
    }
}

// MARK: So sánh struct và class
/**
 
 Struct là value type (biến giá trị), đồng nghĩa nó là immutable (không thể thay đổi nội dung).

 class là reference type (kiểu tham chiếu)


 So sánh class và struct:
 Cho phép khai báo những thuộc tính (property) dễ lưu trữ giá trị, những methods để cung cấp chức năng, khai báo subscripts để cung cấp khả năng truy cập giá trị của chúng sử dụng cú pháp subcript.
 Cho phép định nghĩa constructer (init) để khởi tạo giá trị ban đầu (//3)
 Cho phép mở rộng chức năng xa so với hiện thực mặc định ban đầu (//4)
 Cho phép hiện thực protocols để cung cấp những chức năng tiêu chuẩn của một loại hình nào đó (//4). Protocol trong Swift tương tự như interface trong ngôn ngữ lập trình Java. Một protocol bao gồm tên những hàm chưa được hiện thực chi tiết. Khi một class hay struct adopt protocol đó, nó phải hiện thực tất cả các hàm đó.

 Khác nhau:
 Classes hỗ trợ thừa kế trong khi Structs thì không.
 
 
 */
