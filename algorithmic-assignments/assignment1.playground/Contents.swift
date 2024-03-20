import UIKit

/* დაწერეთ ფუნქცია რომელიც იღებს 2 პარამეტრს(სტრინგებს), და აბრუნებს Boolean ს თუ ეს ორი სტრინგი შედგება ერთიდაიგივე ასოებისგან, რიგითობას მნიშვნელობა არ აქვს.
 დიდ და პატარა ასოებსაც ვითვალისწინებთ.

 მაგ:
  "abc" და "bca" დააბრუნებს true
 "Abc" და "abc" აბრუნებს false. A და a სხვადასხვად ითვლება! */
func haveSameCharacters(line1: String, line2: String) -> Bool {
    var dictionaryLine1 = [Character: Int]()
    for char in line1 {
        dictionaryLine1[char] = 0
    }
    for char in line1 {
        dictionaryLine1[char]! += 1
    }
    var dictionaryLine2 = [Character: Int]()
    for char in line2 {
        dictionaryLine2[char] = 0
    }
    for char in line2 {
        dictionaryLine2[char]! += 1
    }
    return dictionaryLine1 == dictionaryLine2
}
haveSameCharacters(line1: "abc", line2: "aacb")
