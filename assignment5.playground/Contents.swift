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

/* დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას. */
func squareUp (arr: [Int]) -> [Int] {
    var array = arr
    for index in 0...array.count-1 {
        array [index] *= array [index]
    }
    return array
}

/* დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან. */
var filterEven: ([Int]) -> [Int] = { arr in
    var arrayOfEven: [Int] = []
    for element in arr {
        if element % 2 == 0 {
            arrayOfEven.append(element)
        }
    }
    return arrayOfEven
}
