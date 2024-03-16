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

/* მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:
 
 let lelaWhatMovementIsThis: [String: Int] = [

     “ღამის “სიჩუმე გაფანტე: 235,

     “ვიხსენებ ყველაფერს თავიდან”: 219,

     “სულელი წვიმა“: 231,

     “ალალ მე”: 231,

     “იდუმალი ღამე”: 221,

     “ჩუმად ნათქვამი”: 199,

     "თეთრი ქარავანი”: 221,

     “ძველი ვერხვები”: 193

 ]



 დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში
 დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.
 დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას
 დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს*/

let lelaWhatMovementIsThis: [String: Int] = [

    "ღამის სიჩუმე გაფანტე": 235,

    "ვიხსენებ ყველაფერს თავიდან": 219,

    "სულელი წვიმა": 231,

    "ალალ მე": 231,

    "იდუმალი ღამე": 221,

    "ჩუმად ნათქვამი": 199,

    "თეთრი ქარავანი": 221,

    "ძველი ვერხვები": 193

]

func printSongsInSeconds (dictionary: [String: Int]) -> () {
    var duration = 0
    for songSecond in dictionary.values {
        duration += songSecond
    }
    print("საერთო ხანგრძლივობა წამებში: \(duration) წუთებში: \(duration/60)")
}

printSongsInSeconds(dictionary: lelaWhatMovementIsThis)
func printLongestAndShortestSongNames (dictionary: [String: Int]) -> () {
    var longestName = ""
    for songName in dictionary.keys {
        if songName.count > longestName.count {
            longestName = songName
        }
    }
    var shortestName = longestName
    for songName in dictionary.keys {
        if songName.count < shortestName.count {
            shortestName = songName
        }
    }
    print("ყველაზე გრძელი სახელია: \(longestName) ყველაზე მოკლეა: \(shortestName)")
}
printLongestAndShortestSongNames(dictionary: lelaWhatMovementIsThis)

func averageSongDuration(dictionary: [String: Int]) -> Double {
    var duration = 0.0
    for songSecond in dictionary.values {
        duration += Double(songSecond)
    }
    return duration/Double(dictionary.count)
}

print("სიმღერების საშუალო ხანგრძლივობაა: \(averageSongDuration(dictionary: lelaWhatMovementIsThis))")

func printRandomSong(dictionary: [String: Int]) -> () {
    var randomCouple = dictionary.index(dictionary.startIndex, offsetBy: Int.random(in: 0...dictionary.count))
    print("რენდომ სიმღერა: \(dictionary[randomCouple].key)")
}
printRandomSong(dictionary: lelaWhatMovementIsThis)
