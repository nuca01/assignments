import UIKit
//შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)
enum Gender {
    case female
    case male
}

//შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender
protocol SuperBeing {
    var name: String {get set}
    var strength: Int {get set}
    var _strength: Int? {get set}
    var speed: Int {get set}
    var _speed: Int? {get set}
    var weakness: String {get set}
    var gender: Gender {get set}
}

//SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა
extension SuperBeing {
    //თუ მნიშვნელობა ნილია მაშინ დავაბრუნოთ default მნიშვნელობა
    var speed: Int {
        get {
            _speed ?? 50
        }
        set{
            _speed = newValue
        }
    }
    var strength: Int {
        get {
            _strength ?? 60
        }
        set{
            _strength = newValue
        }
    }
}

//შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.
//გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String
//გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს -
//“‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).
//გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -
//“‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)

class Superhero: SuperBeing {
    var name: String
    var weakness: String
    var _strength: Int?
    var _speed: Int?
    var gender: Gender
    var outfitColor: String
    var equipment: String
    var vehicle: String
    init(name: String, weakness: String, strength: Int? = nil, speed: Int? = nil, gender: Gender, outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.weakness = weakness
        self._strength = strength
        self._speed = speed
        self.gender = gender
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
    }
    func rescue(victimName: String) -> () {
        print("\(self.name) არ შეუშინდა სახიფათო სიტუაციას და \(victimName) გადაარჩინა სიკვდილს")
    }
    func combat(supervillain: Supervillain) -> () {
        print("\(self.name) შეერკინა და დაამარცხა \(supervillain.name)")
    }
}

//გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String
//გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს -
//“ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)
//გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -
//“‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)
class Supervillain: SuperBeing {
    var name: String
    var weakness: String
    var _strength: Int?
    var _speed: Int?
    var gender: Gender
    var evilScheme: String
    var obsession: String
    var rivalry: String
    init(name: String, weakness: String, strength: Int? = nil, speed: Int? = nil, gender: Gender, evilScheme: String, obsession: String, rivalry: String) {
        self.name = name
        self.weakness = weakness
        self._strength = strength
        self._speed = speed
        self.gender = gender
        self.evilScheme = evilScheme
        self.obsession = obsession
        self.rivalry = rivalry
    }
    func attack(superhero: Superhero) -> () {
        print("\(self.name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(superhero.name) მის შეჩერებას თუ შეძლებს")
    }
    func experimentation(subject: String) -> () {
        print("\(self.name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(subject) აღმოჩნდა")
    }
}

var superhero1 = Superhero(name: "Giorgi Kochorashvili", weakness: "Volleys", strength: 52, speed: 67, gender: Gender.male, outfitColor: "red and blue", equipment: "ball", vehicle: "legs")
var superhero2 = Superhero(name: "Zuriko Davitashvili", weakness: "Holding on to the ball", strength: 66, speed: 73, gender: Gender.male, outfitColor: "black", equipment: "ball", vehicle: "legs")
var superhero3 = Superhero(name: "Lasha Dvali", weakness: "Tackling", strength: 80, speed: 54, gender: Gender.male, outfitColor: "yellow and blue", equipment: "ball", vehicle: "legs")
var superhero4 = Superhero(name: "Nika Kvekveskiri", weakness: "Heading accuracy", strength: 60, speed: 55, gender: Gender.male, outfitColor: "blue", equipment: "ball", vehicle: "legs")
var superhero5 = Superhero(name: "Giorgi Mamardashvili", weakness: "Long passing", strength: 74, speed: 48, gender: Gender.male, outfitColor: "green", equipment: "gloves", vehicle: "legs")


var supervillain1 = Supervillain(name: "Lazaros Rota", weakness: "Crossing", strength: 65, speed: 80, gender: Gender.male, evilScheme: "Win against Georgian national team", obsession: "qualify for the tournament", rivalry: "European Qualifiers Play-off match")
var supervillain2 = Supervillain(name: "Giannis Konstantelias", weakness: "heading accuracy", strength: 44, speed: 74, gender: Gender.male, evilScheme: "Win against Georgian national team", obsession: "qualify for the tournament", rivalry: "European Qualifiers Play-off match")
var supervillain3 = Supervillain(name: "Giorgos Masouras", weakness: "tackling", strength: 69, speed: 79, gender: Gender.male, evilScheme: "Win against Georgian national team", obsession: "qualify for the tournament", rivalry: "European Qualifiers Play-off match")
var supervillain4 = Supervillain(name: "Andreas Bouchalakis", weakness: "tackling", strength: 77, speed: 45, gender: Gender.male, evilScheme: "Win against Georgian national team", obsession: "qualify for the tournament", rivalry: "European Qualifiers Play-off match")
var supervillain5 = Supervillain(name: "Giorgos Giakoumakis", weakness: "passing", strength: 84, speed: 73, gender: Gender.male, evilScheme: "Win against Georgian national team", obsession: "qualify for the tournament", rivalry: "European Qualifiers Play-off match")

supervillain1.experimentation(subject: "ქართველი ფეხბურთელის ფეხი")
superhero1.rescue(victimName: "ქართველი გულშემატკივრების სიამაყე")
superhero2.rescue(victimName: "ქართველი გულშემატკივრების იმედი")
superhero3.rescue(victimName: "ქართველი გულშემატკივრების თავდაჯერება")
supervillain5.attack(superhero: superhero5)
superhero5.combat(supervillain: supervillain5)
superhero4.rescue(victimName: "ქართველი გულშემატკივრების ნერვები")
