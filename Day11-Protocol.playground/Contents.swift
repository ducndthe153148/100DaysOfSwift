import UIKit

//MARK: - Protocol
/// Các thuộc tính, phương thứ
///  Có thể implement bởi class, struct hay enm
///  implement protocol phải khai báo, định nghĩa lại các thuộc tính, phương thức
///  Phải khai báo var


protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func write(_ name: Identifiable) {
    print("This is: \(name.id)")
}

/// 1 protocol có thể kết thừa từ nhiều protocol
protocol PersonalInfor {
    var age: Int { get set }
    var homeAdress: String { get set}
}

protocol Person: Identifiable, PersonalInfor {
    
}
