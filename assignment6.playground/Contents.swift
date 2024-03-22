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
