import UIKit

// Extend cả protocol giúp cho những thành phần nào trong protocol đó đều được sử dụng chung extension

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    
//    var name: Int = 2 Cú pháp như này sẽ sai vì extension không thể chứa stored properties
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
print("Hello world: \(pythons.count)")

pythons.summarize()
beatles.summarize()

// MARK: - Protocol-oriented program
protocol Identifiable {
    var id: String {get set}
    func identify()
}

extension Identifiable {
    func identify(){
        print("My ID is: \(id)")
    }
}

struct User: Identifiable {
    var id: String
}

let twoStraws = User(id: "TRung Duc")
twoStraws.identify()

/// Tổng hợp
///
/// 1. Protocol mô tả các phương thức và thuộc tính 1 kiểu dữ liệu phải có, nhưng không implementations methods
///
/// 2. Có thêr build protocol từ các protocol khác
///
/// 3. Extension giúp chúng ta thêm các methods và computed property vào cái mình muốn
///

// MARK: - Optional

var name: String? = "Duc"
// Su dung if let de unwrap, neu khong unwrap thi van la optional
if let unwrapped = name {
    print("\(unwrapped.count) letter")
} else {
    print("Missing name")
}

// Chỉ force unwrap (dấu !) khi biết chắc chắn k nil

// Sử dụng guard let để force unwrap
func greet(_ name: String?){
    guard let unwrapped = name else {
        print("You didn't provice name")
        return
    }
    print("Hello \(name)")
}

// MARK: - Implicity unwrapped optionals

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

// MARK: - Nil coalescing
/// Dùng dấu ??
func userName (for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = userName(for: 15) ?? "Anonymous"


// MARK: - OPTIONAL CHAINING
/// Nếu muốn truy cập a.b.c và b là optional, ta có thể viết là a.b?.c
/// Nếu b nil thì sẽ return nil luôn
///

let names = ["Trung Duc": "Trung Kien", "Nam" : "Hao"]
let beatle = names["Trung Duc"]?.first?.uppercased()

let surnameLetter = names["rung Duc"]?.first?.uppercased() ?? "?"

func countLettersInString(str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString(str: "Hello")
