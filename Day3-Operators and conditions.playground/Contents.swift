import UIKit

// MARK: - DAY 3
let firstCard = 10
let secondCard = 11

print(firstCard == secondCard ? "Equal" : firstCard > secondCard ? "Lon hon" : "Nho hon")
///Equal with:
///if firstCard == secondCard { print("Equal") }
///else if firstCard > secondCard { print("Lon hon) }
///else { print("Nho Hon") }


// Sử dụng fallthrough khi muốn nếu rơi vào case đó, sẽ thực hiện tiếp case tiếp theo sau nó
let weather = "rain"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

// MARK: - DAY 4: Loops

for beatle in ["John", "Paul", "Ringo"] {
    print("\(beatle) was in the Beatles")
}

//MARK: MULTIPLE LOOP
/// Nếu muốn thoát vòng lặp bên ngoài thì thêm outerLoop là được
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

// MARK: CONTINUE
/// Nếu muốn bỏ 1 giá trị nào đó rồi tiếp tục xét tiếp điều kiện thì sử dụng continue (không break hẳn ra ngoài)
///

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}
