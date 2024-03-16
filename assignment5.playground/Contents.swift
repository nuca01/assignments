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

/* დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება. */
func sum (array: [Int], closure: @escaping (Int) -> ()) -> Int {
    var sum = 0
    for element in array {
        sum += element
    }
    DispatchQueue.main.asyncAfter(deadline: .now()+5) {
        closure(sum)
    }
    return sum
}
var array = [1,5,7,]
var closure: (Int) -> () = { sum in
    print("ჯამი ტოლია: \(sum)")
    
    
}
sum(array: array, closure: closure)

/* შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი */
var contacts: [String: Int] = [:]
contacts["Nuca"] = 592501035
print("Nuca-ს ტელეფონის ნომერია: \(contacts["Nuca"] ?? 0)")
contacts.removeValue(forKey: "Nuca")

/* დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს. */
func alphabetSort (dictionary: [String: Int]) -> [String] {
    return Array(dictionary.keys).sorted()
}

/* შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ. */
var doubleArray = [5.3, 56.7, 4.2, -53.8]
var biggestNumber = 0.0
for element in doubleArray {
    if element > biggestNumber {
        biggestNumber = element
    }
}
print("ყველაზე დიდი რიცხვია: \(biggestNumber)")

