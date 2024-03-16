import UIKit
/* დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”) */
func isMirrorlike (line: String) -> Bool {
    var length = line.count
    if length <= 1 {
        return true
    } else {
        var middle : Int = length / 2
        if length % 2 == 0 {
            for index in 0...middle-1 {
                var rightValue = line[line.index(line.startIndex, offsetBy: index+middle)]
                var leftValue = line[line.index(line.startIndex, offsetBy: middle-index-1)]
                if leftValue != rightValue {
                    return false
                }
            }
        } else {
            for index in 1...middle {
                var rightValue = line[line.index(line.startIndex, offsetBy: index+middle)]
                var leftValue = line[line.index(line.startIndex, offsetBy: middle-index)]
                if leftValue != rightValue {
                    return false
                }
            }
        }
        return true
    }
}

isMirrorlike(line: "bnnb")
