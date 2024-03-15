import UIKit
/* while ციკლის გამოყენებით, 1-დან 20-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი. */
var number = 3 //დავიწყოთ სამიდან რადგან 1ზე გამრავლება არაფერს ცვლის
var result = 1
while (number < 20) {
    result *= number
    number += 2;
}
print("ნამრავლი უდრის: \(result)")

/* შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT” */
var line = "Test"
var reversed = ""
var index = line.count - 1
for _ in line {
    reversed.append(line[line.index(line.startIndex, offsetBy: index)])
    index -= 1
}

/* while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..." */
/*
var colour = "red"
while true {
    switch colour {
    case "red":
        print("🔴->", terminator: "")
        colour = "yellow"
    case "yellow":
        print("🌕->", terminator: "")
        colour = "green"
    case "green":
        print("🟢->", terminator: "")
        colour = "red"
    default:
        break;
    }
}
*/

/* Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე” */
func buyATicket (tickets: inout Int) -> () {
    //თავიდან 0-ზე არ ვამოწმებ რადგან მხოლოდ ლუპში ვიყენებ ფუნქციას
        tickets -= 1
        if tickets > 0 {
            print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(tickets) რაოდენობა")
        } else {
            print("ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე")
        }
}

var tickets = 15
while tickets > 0 {
    buyATicket(tickets: &tickets)
}

/* შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.) */
var array = [5, 9, 9, 55, 43]
var hasDuplicates = false;
for numberIndex in stride (from: 0, to: array.count-2, by: 1){
    if hasDuplicates {
        break
    }
    
    for otherIndex in stride (from: numberIndex+1, to: array.count, by: 1){
        if array[numberIndex] == array[otherIndex] {
            hasDuplicates = true
            break
        }
    }
}
if hasDuplicates {
    print("array შეიცავს მსგავს ელემენტებს")
} else {
    print("array-ში ყველა ელემენტი განსხვავებულია")
}

/* დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას */
var substract: (Int, Int) -> Int = { (number1, number2) in
    number1 - number2
}

/* დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის. */
func countNumberOfConsonants (line: String){
    var numberOfConsonats = 0;
    for character in line {
        switch character {
        case "a", "A" ,"e" ,"E", "i", "I", "o", "O", "u", "U":
            continue
        default:
            numberOfConsonats += 1
        }
    }
    print("თანხმვნების რაოდენობაა: \(numberOfConsonats)")
}
/* შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array. */
func mySort (arr1: [Int], arr2: [Int]) -> [Int] {
    
    var result = insertionSort(arr: arr1)
    var array2 = insertionSort(arr: arr2)
    var lastpositionResult = -1
    for elementofArray2 in array2 {
        for indexResultArray in stride (from: lastpositionResult+1, to: result.count, by: 1) {
            if elementofArray2 <= result[indexResultArray] {
                result.insert(elementofArray2, at: indexResultArray)
                lastpositionResult = indexResultArray
                break
            }
        }
    }
    return result
}
func insertionSort (arr: [Int]) -> [Int] {
    var array = arr
    for insertionIndex in stride (from: 1, to: array.count, by: 1) {
        for subArrayIndex in stride (from: 0, to: insertionIndex, by: 1) {
            if array[insertionIndex] <= array[subArrayIndex] {
                var insertionValue = array[insertionIndex]
                for movmentIndex in stride (from: insertionIndex, to: subArrayIndex, by: -1){
                    array[movmentIndex] = array[movmentIndex-1]
                }
                array[subArrayIndex] = insertionValue
                break
            }
        }
    }
    return array
}

var array1 = [8, 4, 9, 9, 0, 2]
var array2 = [1, 0, 9, 2, 3, 7, 0, 1]
print("დასორტილი მასივია: ")
for element in mySort(arr1: array1, arr2: array2){
    print (element, terminator: " ")
}
print()

/* დაწერეთ ფუნქცია, რომელსაც გადააწვდით int ტიპის პარამეტრს. გამოითვალეთ ამ პარამეტრის ფაქტორიალი და დაბეჭდეთ */
func factorial (number: Int) -> () {
    var result = 1
    for num in stride (from: number, to: 1, by: 1) {
        result *= num
    }
    print(" \(number)-ის ფაქტორიალია \(result)")
}

/* შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array. */
var numberArray : [Int] = []
var arrayOfEven : [Int] = []
var arrayOfOdd : [Int] = []
for num in stride (from: 0, to: 11, by: 1) {
    numberArray.append(num)
    if num % 2 == 1 { //0ს ლუწად ვთვლი
        arrayOfOdd.append(numberArray[num])
    } else {
        arrayOfEven.append(numberArray[num])
    }
}

