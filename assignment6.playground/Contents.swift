import UIKit

/* შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების. */
enum WeekDay {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}
func printIfWeekDayIsWorking(weekDay: WeekDay) {
    switch weekDay {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        print("It's a working day")
    case .saturday, .sunday:
        print("It's not a working day")
    }
}

/* შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს */
enum GialaSquad {
    case tsigroviManto
    case moshishvlebuliMkerdi
    case tuGapatio
    var price: Int {
        switch self {
        case .tsigroviManto:
            return 10
        case .moshishvlebuliMkerdi:
            return 15
        case .tuGapatio:
            return 20
        }
    }
    func printDonePrice() ->() {
        print("price is \(price)")
    }
}

var nuca = GialaSquad.tuGapatio
nuca.printDonePrice()

/* შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით. */
enum Weather {
    case sunny(celcius: Int)
    case cloudy(celcius: Int)
    case rainy(celcius: Int)
    case snowy(celcius: Int)
}

func giveRecomendation(weather: Weather) -> () {
    switch weather {
    case .sunny(let celcius):
        if celcius > 23 {
            print("wear light clothes")
        } else if celcius > 13 {
            print("bring a jacket")
        } else if celcius > 0 {
            print("puffer jacket weather")
        } else {
            print("wear the warmest clothes")
        }
    case .cloudy(let celcius):
        if celcius > 27 {
            print("wear light clothes")
        } else if celcius > 15 {
            print("bring a jacket")
        } else if celcius > 5 {
            print("puffer jacket weather")
        } else {
            print("wear the warmest clothes")
        }
    case .rainy(let celcius):
        if celcius > 27 {
            print("wear light clothes and bring an umbrella")
        } else if celcius > 15 {
            print("bring a jacket and an umbrella")
        } else if celcius > 5 {
            print("it's puffer jacket weather, bring an umbrella")
        } else if celcius > 0 {
            print("wear the warmest clothes and bring an umbrella")
        } else {
            print("wrong data")
        }
    case .snowy(let celcius):
        if celcius < 0 {
            print("wear a snowsuit and snowboots")
        } else {
            print("wrong data")
        }
    }
}

var weather = Weather.cloudy(celcius: 30)
giveRecomendation(weather: weather)

/* შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი. */
struct Kanye {
    var album : String
    var releaseYear : Int
    init(album: String, releaseYear: Int) {
        self.album = album
        self.releaseYear = releaseYear
    }
}
func kanyesAfter(kanyes: [Kanye], yearAfter: Int) -> [String] {
    var iMissTheOldKanye: [String] = []
    print("albums after \(yearAfter):")
    for kanye in kanyes {
        if (kanye.releaseYear > yearAfter){
            iMissTheOldKanye.append(kanye.album)
            print(kanye.album)
        }
    }
    return iMissTheOldKanye
}
var kanyes : [Kanye] = []
var kanye1 = Kanye(album: "Graduation", releaseYear: 2007)
var kanye2 = Kanye(album: "The life of Pablo", releaseYear: 2016)
var kanye3 = Kanye(album: "Donda 2", releaseYear: 2022)

kanyes.append(kanye1)
kanyes.append(kanye2)
kanyes.append(kanye3)

var albumsAfter2007 = kanyesAfter(kanyes: kanyes, yearAfter: 2007)

/* შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა */
@propertyWrapper
struct CachedData {
    lazy var wrappedValue: String = {
        return "lazy ინიციალიზებულია"
    }()
    init(){}
}
var cachedData = CachedData();
print(cachedData.wrappedValue)
