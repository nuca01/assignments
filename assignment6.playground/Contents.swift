import UIKit

/* შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების. */
enum WeekDay {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}
func printIfWeekDayIsWorking(weekDay: WeekDay) {
    switch weekDay {
    case .Monday, .Tuesday, .Wednesday, .Thursday, .Friday:
        print("It's a working day")
    case .Saturday, .Sunday:
        print("It's not a working day")
    }
}

/* შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს */
enum GialaSquad {
    case TsigroviManto
    case MoshishvlebuliMkerdi
    case TuGapatio
    var price: Int {
        switch self {
        case .TsigroviManto:
            return 10
        case .MoshishvlebuliMkerdi:
            return 15
        case .TuGapatio:
            return 20
        }
    }
    func printDonePrice() ->() {
        print("price is \(price)")
    }
}

var nuca = GialaSquad.TuGapatio
nuca.printDonePrice()

/* შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით. */
enum Weather {
    case Sunny(celcius: Int)
    case Cloudy(celcius: Int)
    case Rainy(celcius: Int)
    case Snowy(celcius: Int)
}

func giveRecomendation(weather: Weather) -> () {
    switch weather {
    case .Sunny(let celcius):
        if celcius > 23 {
            print("wear light clothes")
        } else if celcius > 13 {
            print("bring a jacket")
        } else if celcius > 0 {
            print("puffer jacket weather")
        } else {
            print("wear the warmest clothes")
        }
    case .Cloudy(let celcius):
        if celcius > 27 {
            print("wear light clothes")
        } else if celcius > 15 {
            print("bring a jacket")
        } else if celcius > 5 {
            print("puffer jacket weather")
        } else {
            print("wear the warmest clothes")
        }
    case .Rainy(let celcius):
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
    case .Snowy(let celcius):
        if celcius < 0 {
            print("wear a snowsuit and snowboots")
        } else {
            print("wrong data")
        }
    }
}

var weather = Weather.Cloudy(celcius: 30)
giveRecomendation(weather: weather)
