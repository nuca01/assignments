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
    
    func printDonePrice() -> () {
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

/* ბარბარემ გადაწყვიტა პროგრამირებასთან ერთად დამატებითი სამსახური დაეწყო და ტაროს სამკითხაო ჯიხური გახსნა. მისი სახელი უცებ გავარდა და ქართველი ვარსკვლავების ყურამდეც მივიდა. ერთ დღეს მას ჯიხურში ძალიან ნაცნობი სახეები გამოეცხადა, ბედინა და შავი პრინცი. პროფესიონალმა ნათელმხილველმა გაშალა კარტი და დაიწყო მათ მომავალში ხელების ფათური. ბარბარეს ტაროს დასტა საკმაოდ უნიკალურია, ის მხოლოდ 12 კარტს შეიცავს - Star, Empress, Tower, Hanged Man, Chariot, Moon, Hierophant, Devil, Lovers, Wheel of Fortune, Fool, Magician და მათ აღწერებს -
 
 
 
 * Star: წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას.

 * Empress: განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში.

 * Tower: ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის.

 * Hanged Man: წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს.

 * Chariot: განასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით.

 * Moon: აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს.

 * Hierophant: წარმოადგენს ტრადიციას, შესაბამისობას და სულიერ ხელმძღვანელობას. ეს ნიშნავს სიბრძნის ძიებას დამკვიდრებული რწმენებისგან, ინსტიტუტებისა და მენტორებისგან.

 * Devil: განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას.

 * Lovers: აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით.

 * Wheel of Fortune: წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია.

 * Fool: განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას.

 * Magician: აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს, იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით.



 შექმენით Enum სახელად TarotCard და განსაზღვრეთ მასში 12 კარტის ქეისი.

 შექმენით სტატიკური მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტს შერჩევითად

 შექმენით მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტის აღწერას string-ის სახით

 შექმენით სტრუქტურა სახელად TarotReading. გაუწერეთ ფროფერთიები წარსული, აწმყო და მომავალი. გაუკეთეთ ინიციალიზაცია ამ ფროპერთიებს რათა მათ მიიღონ შერჩევითი ტაროს კარტის აღწერის მნიშვნელობა.

 შექმენით მეთოდი TarotReading-ში, რომელიც დაბეჭდავს ამ სამ არჩეულ ტაროს კარტს. */
enum TarotCard {
    case star
    case empress
    case tower
    case hangedMan
    case chariot
    case moon
    case hierophant
    case devil
    case lovers
    case wheelOfFortune
    case fool
    case magician
    
    static func destinedCard() -> TarotCard {
        let destiny = Int.random(in: 1..<13)
        switch destiny {
        case 1:
            return star
        case 2:
            return empress
        case 3:
            return tower
        case 4:
            return hangedMan
        case 6:
            return moon
        case 7:
            return hierophant
        case 8:
            return devil
        case 9:
            return lovers
        case 10:
            return wheelOfFortune
        case 11:
            return fool
        case 12:
            return magician
        default:
            return star
        }
    }
    
    func getDescription() -> String {
        switch self {
        case .star:
            return "წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას."
        case .empress:
            return "განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში."
        case .tower:
            return "ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის."
        case .hangedMan:
            return "წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს."
        case .chariot:
            return "განასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით."
        case .moon:
            return "აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს."
        case .hierophant:
            return "წარმოადგენს ტრადიციას, შესაბამისობას და სულიერ ხელმძღვანელობას. ეს ნიშნავს სიბრძნის ძიებას დამკვიდრებული რწმენებისგან, ინსტიტუტებისა და მენტორებისგან."
        case .devil:
            return "განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას."
        case .lovers:
            return "აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით."
        case .wheelOfFortune:
            return "წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია."
        case .fool:
            return "განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას."
        case .magician:
            return "აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს, იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით."
        }
    }
}

struct TarotReading {
    let past: String = TarotCard.destinedCard().getDescription()
    let present: String = TarotCard.destinedCard().getDescription()
    let future: String = TarotCard.destinedCard().getDescription()
}

var myLife = TarotReading ()
print ("my past: \(myLife.past)")
print ("my present: \(myLife.present)")
print ("my future: \(myLife.future)")
