import UIKit

/* დაწერეთ ფუნქცია რომელიც იღებს 2 პარამეტრს(სტრინგებს), და აბრუნებს Boolean ს თუ ეს ორი სტრინგი შედგება ერთიდაიგივე ასოებისგან, რიგითობას მნიშვნელობა არ აქვს.
 დიდ და პატარა ასოებსაც ვითვალისწინებთ.
 
 მაგ:
 "abc" და "bca" დააბრუნებს true
 "Abc" და "abc" აბრუნებს false. A და a სხვადასხვად ითვლება! */
func haveSameCharacters(line1: String, line2: String) -> Bool {
    var dictionaryLine1 = [Character: Int]()
    for char in line1 {
        if dictionaryLine1[char] == nil {
            dictionaryLine1[char] = 0
        } else {
            dictionaryLine1[char]! += 1
        }
    }
    var dictionaryLine2 = [Character: Int]()
    for char in line2 {
        if dictionaryLine2[char] == nil {
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
func getRidOfSpaces (line: String) -> String {
    var spaceCounter = 0
    var newString = ""
    for char in line {
        if char == " " {
            if spaceCounter < 1 {
                newString += String(char)
            }
            spaceCounter += 1
        }
        else {
            newString += String(char)
            spaceCounter = 0
        }
    }
    return newString
}

getRidOfSpaces(line: "   ABBB   B  C ")
/* დაწერეთ ფუნქცია რომელიც იღებს სტრინგს(ეს სტრინგი მოიცავს ასევე ციფრებს), გაფილტრეთ/მოაშორეთ ასოები და დარჩენილი ციფრების ჯამს აბრუნებთ.
 
 მაგ:
 “a1b2c3” აბრუნებს 6  ანუ(1+2+3)
 “asdf10b20c30” აბრუნებს 60 ს  (10 + 20 + 30) და ა შ. */
func findSumInString (line: String) -> Int {
    var stringToTurnToInt = ""
    var sum = 0
    for char in line {
        if char >= "0" && char <= "9" {
            stringToTurnToInt += String(char)
        } else {
            if stringToTurnToInt == "" {
                continue
            } else {
                sum += Int(stringToTurnToInt)!
                stringToTurnToInt = ""
            }
        }
    }
    if stringToTurnToInt != "" {
        sum += Int(stringToTurnToInt)!
        stringToTurnToInt = ""
    }
    return sum
}
findSumInString(line: "asdf10b20c30")
