import UIKit

//MARK: - 1. Arrays
//- Mảng, tập hợp các phần tử có cùng kiểu giá trị
var someInts: [Int] = []
//
//MARK: - 2. Sets
//- Set: tập hợp các phần tử không trùng nhau sắp xếp ngẫu nhiên
//- Muốn tạo thì phải truyền vào 1 mảng các giá trị
var letters = Set<Int>()

//MARK: - 3. Tuple
//- Nhóm nhiều giá trị thành 1 giá trị mới đơn lẻ
var person = (name: "Paul", age: 40, isMarried: true)
let http404Error = (404, "Not Found")

//MARK: - 4. Dictionary
var namesOfIntegers: [Int: String] = [:]
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//var abc = [key: value]
// Default value for dictionary:
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
favoriteIceCream["Charlotte", default: "Unknown"]
//MARK: - 5. Create empty collection
var teams = [String: String]()
var teamss = Dictionary<String, String>()
teams["Paul"] = "Red"
var result = [Int]()
var results = Array<Int>()
// Set:
var words = Set<String>()
let usedWord = Set(["hello", "world"])

//MARK: - 6. Enums
///Enum định nghĩa 1 nhóm các giá trị có liên quan đến nhau và cho phép bạn làm việc với những giá trị đó 1 cách an toàn trong code của bạn
struct Character {
   enum CharacterType {
    case Thief
    case Warrior
    case Knight
  }
  enum Weapon {
    case Bow
    case Sword
    case Lance
    case Dagger
  }
  let type: CharacterType
  let weapon: Weapon
}

let warrior = Character(type: .Warrior, weapon: .Sword)

enum Result {
    case success
    case failure
}
let resultTest = Result.failure

// MARK: - 7. Enum associated
/// Thêm thông tin chi tiết
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")

// MARK: - 8. Enum raw values
enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

print(Planet.mercury.rawValue) // 0
print(Planet.venus.rawValue) // 1

//MARK: - SUMMARY
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// Prints "Mostly harmless"

let ages: [Int] = [4,5,3]
