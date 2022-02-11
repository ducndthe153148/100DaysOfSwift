Link các tài liệu: 
https://www.appbrewery.co/p/ios-course-resources/

Stuck thì note lại và coi là challenge 

18. Overview of XCode
- Trong mục Deployment Info
    + chọn iOS version nào thì đó là minimum version (version lớn hơn có thể chạy) 
    +
    
20. Thêm ảnh riêng của mình vào assert
- Image view là simply view nó như một picture frame 
- Nó là 1 khung tranh (picture frame) mà có thể cho ảnh vào
- Có thể change size, color của khung

    + Sử dụng App icon generator để tạo ảnh 1x, 2x và 3x
https://appicon.co/#image-sets

36. Design your app: 
- Khi add thêm image view 
    + Content mode sẽ quyết định ảnh đó sẽ như nào trong uiimage 
    + Scale to fill: stretch the image up and down until fills the entire area (sẽ bị kéo dãn ra)
    + Aspect fill: giữ đúng tỉ lệ ảnh, phóng to cho vừa
    + Aspect fit: keep đúng ảnh
    
- Độ mờ đục của ảnh
    + Alpha là thành phần mờ đục của ảnh, transparency 
    
    
61. Setting constraint: 
- Superview là cover the entire screen (cả phần tai thỏ và bên dưới)
- Safe area thì sẽ không tính phần trên cùng của pin và dưới cùng của home 

63. Working with constraint 
- Muốn autolayout cho portrait với landscape, nên chia màn hình thành nhiều uiview nhỏ bên trong 
- equal or larger mean minimum or maximum number of size (relative)
- 

67. Stack view test 
- Khi muốn cho view trong stack view khác kích cỡ, ta chỉ cần cho 1 view vào 1 stack view khác rồi chỉnh 


* Section 7: Xylophone
74. Linking multiple buttons to the same IBAction 
- Change tag của từng button/ Lấy bằng title label
- lấy tag bằng sender.tag 

81: Label 
- Khi muốn chỉnh cho label có thể tự co giãn theo space của view. 
- Trong Autoshrink, chọn minimum font size để khi có nhiều chữ thì sẽ tự co label

90: Use progress View show time remain
- 


91: Tip
- Set expectation
97. Two dimension array
let array = [
[1,2,3]
[4,5,6]
[7,8,9]
]

98. Struct, method and properties
- Struct: Own data type (Kiểu dữ liệu)

Using scheduled timer to delay time

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
101. Design pattern 
- MVC 

105. Immutability
- Struct - immutable 

Animation của uiview 

Giải thích các tham số:
        UIView.transition(from: backCard, to: imageCard, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft],animations: {
                self.username.center.x += self.view.bounds.width
                }
            , completion: nil)
        
    - withDuration: Thời gian thực hiện animation.
    - delay: Nó sẽ bắt đầu animation sau một khoảng thời gian (ở đây là đợi 0.3s)
    - options: Tham số tuỳ chọn cho animation, tạm thời bạn sẽ để nó là [] - có nghĩa là “không có tuỳ chọn gì đặc biệt”. Mình sẽ nói về cái này ở một phần khác.
    - animations: closure thực hiện các biểu thức animation (chỉnh toạ độ,...)
    - completion: closure thực hiện khi animation vừa kết thúc.

120. Learn UISlider
- Minimum and maximum to set the range of slide 

128. Các loại Optional
- Force unwrapping (Dung khi chac chan) optional!
- Check for nil value 
    if optional! != nil { 
        optional!
    }
- Optinal binding 
    if let safeOptional = optional { 
        safeOptional...
    }
    
    
- Nil Coalescing Operator 
    optional ?? defaultValue
    
- Optional Chaining 
    optional?.property
    optional?.method()
