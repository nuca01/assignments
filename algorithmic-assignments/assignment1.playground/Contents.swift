import UIKit

/* დაწერეთ ფუნქცია რომელიც იღებს 2 პარამეტრს(სტრინგებს), და აბრუნებს Boolean ს თუ ეს ორი სტრინგი შედგება ერთიდაიგივე ასოებისგან, რიგითობას მნიშვნელობა არ აქვს.
 დიდ და პატარა ასოებსაც ვითვალისწინებთ.

 მაგ:
  "abc" და "bca" დააბრუნებს true
 "Abc" და "abc" აბრუნებს false. A და a სხვადასხვად ითვლება! */
func haveSameCharacters(line1: String, line2: String) -> Bool {
    var dictionaryLine1 = [Character: Int]()
    for char in line1 {
        if (dictionaryLine1[char] == nil) {
            dictionaryLine1[char] = 0
        } else {
            dictionaryLine1[char]! += 1
        }
    }
    var dictionaryLine2 = [Character: Int]()
    for char in line2 {
        if (dictionaryLine2[char] == nil) {
            dictionaryLine2[char] = 0
        } else {
            dictionaryLine2[char]! += 1
        }
    }
    return dictionaryLine1 == dictionaryLine2
}
haveSameCharacters(line1: "abc", line2: "cb")

/* დაწერეთ ფუნქცია რომელიც მიიღებს და დააბრუნებს სტრინგს სადაც ზედმეტ სფეისებს მოაშორებს.
 
 მაგ:
 "A[space][space][space]B[space][space]C" დააბრუნებს "A[space]B[space]C"
 "[space][space][space]a" დააბრუნებს "[space]a" ანუ 1 სფეისი ყოველთვის რჩება, ამ შემთხვევაში წინაც. */
