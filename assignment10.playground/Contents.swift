import UIKit
//შექმენით ციკლური რეფერენცები და გაწყვიტეთ
//აუცილებელია ქლოჟერების გამოყენება
//აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)
//აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც
//დაიჭირეთ self ქლოჟერებში
//გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით


//პრობლემა:
/*
enum Sex {
    case Female
    case Male
}

protocol Information {
    var name: String {get set}
    var surname: String {get set}
    var citizenship: String {get set}
    var dateOfBirth: Date {get set}
    var sex: Sex {get set}
    var personalNo: String {get set}
    var placeOfBirth: String {get set}
}

class Person: Information {
    var name: String
    var surname: String
    var citizenship: String
    var dateOfBirth: Date
    var sex: Sex
    var personalNo: String
    var placeOfBirth: String
    var passsport: Passport?
    var identityCard: IdentityCard?
    var changeSurname: (() -> ())?
    init(
        name: String,
        surname: String,
        citizenship: String,
        dateOfBirth: Date,
        sex: Sex,
        personalNo: String,
        placeOfBirth: String,
        passsport: Passport? = nil,
        identityCard: IdentityCard? = nil
    ) {
        self.name = name
        self.surname = surname
        self.citizenship = citizenship
        self.dateOfBirth = dateOfBirth
        self.sex = sex
        self.personalNo = personalNo
        self.placeOfBirth = placeOfBirth
        self.passsport = passsport
        self.identityCard = identityCard
        //უკვე ციკლი გვაქვს
        changeSurname = {
            self.surname = "new surname"
        }
    }
    deinit {
        print("deinitialization of person \(name)")
    }
}

struct Passport: Information {
    var name: String
    var surname: String
    var citizenship: String
    var dateOfBirth: Date
    var sex: Sex
    var personalNo: String
    var placeOfBirth: String
    var dateOfIssue: Date
    var issuingAuthority: String
    var passportNo: String
    var person: Person? = nil
}

class IdentityCard {
    var name: String
    var surname: String
    var citizenship: String
    var dateOfBirth: Date
    var sex: Sex
    var personalNo: String
    var placeOfBirth: String
    var dateOfIssue: Date
    var issuingAuthority: String
    var cardNo: String
    var person: Person? = nil
    var changeName: (() -> ())?
    init(
        name: String,
        surname: String,
        citizenship: String,
        dateOfBirth: Date,
        sex: Sex,
        personalNo: String,
        placeOfBirth: String,
        dateOfIssue: Date,
        issuingAuthority: String,
        cardNo: String,
        person: Person?
    ) {
        self.name = name
        self.surname = surname
        self.citizenship = citizenship
        self.dateOfBirth = dateOfBirth
        self.sex = sex
        self.personalNo = personalNo
        self.placeOfBirth = placeOfBirth
        self.dateOfIssue = dateOfIssue
        self.issuingAuthority = issuingAuthority
        self.cardNo = cardNo
        self.person = person
        //უკვე ციკლი გვაქვს
        changeName = {
            self.name = "new name"
        }
    }
    deinit {
        print("deinitialization of Identity Card of \(name)")
    }
}

let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd"
var sexOfPerson1: Sex? = Sex.Female
var person1: Person? = Person(
    name: "Nuca",
    surname: "Beriashvili",
    citizenship: "Georgian",
    dateOfBirth: formatter.date(from: "2004/06/19")!,
    sex: sexOfPerson1!,
    personalNo: "0100673429",
    placeOfBirth: "Tbilisi"
)
var passport1: Passport? = Passport(
    name: "Nuca",
    surname: "Beriashvili",
    citizenship: "Georgian",
    dateOfBirth: formatter.date(from: "2004/06/19")!,
    sex: sexOfPerson1!,
    personalNo: "0100673429",
    placeOfBirth: "Tbilisi",
    dateOfIssue: formatter.date(from: "2022/05/19")!,
    issuingAuthority: "Ministry of Justice",
    passportNo: "14AD65397",
    person: person1
)
var identityCard1: IdentityCard? = IdentityCard(
    name: "Nuca",
    surname: "Beriashvili",
    citizenship: "Georgian",
    dateOfBirth: formatter.date(from: "2004/06/19")!,
    sex: sexOfPerson1!,
    personalNo: "0100673429",
    placeOfBirth: "Tbilisi",
    dateOfIssue: formatter.date(from: "2022/05/14")!,
    issuingAuthority: "Ministry of Justice",
    cardNo: "19OT729374",
    person: person1
)
identityCard1?.person = nil
identityCard1 = nil
person1!.passsport = passport1!
person1!.identityCard = identityCard1!
sexOfPerson1 = nil
//სტრუქტურებზე არ მოხდება ციკლი
passport1 = nil
//ეს ციკლია
person1 = nil
identityCard1 = nil
 */
//გამოსწორება:
enum Sex {
    case Female
    case Male
}

protocol Information {
    var name: String {get set}
    var surname: String {get set}
    var citizenship: String {get set}
    var dateOfBirth: Date {get set}
    var sex: Sex {get set}
    var personalNo: String {get set}
    var placeOfBirth: String {get set}
}

class Person: Information {
    var name: String
    var surname: String
    var citizenship: String
    var dateOfBirth: Date
    var sex: Sex
    var personalNo: String
    var placeOfBirth: String
    var passsport: Passport?
    var identityCard: IdentityCard?
    var changeSurname: (() -> ())?
    init(
        name: String,
        surname: String,
        citizenship: String,
        dateOfBirth: Date,
        sex: Sex,
        personalNo: String,
        placeOfBirth: String,
        passsport: Passport? = nil,
        identityCard: IdentityCard? = nil
    ) {
        self.name = name
        self.surname = surname
        self.citizenship = citizenship
        self.dateOfBirth = dateOfBirth
        self.sex = sex
        self.personalNo = personalNo
        self.placeOfBirth = placeOfBirth
        self.passsport = passsport
        self.identityCard = identityCard
        changeSurname = { [unowned self] in
            self.surname = "new surname"
        }
    }
    deinit {
        print("deinitialization of person \(name)")
    }
}

struct Passport: Information {
    var name: String
    var surname: String
    var citizenship: String
    var dateOfBirth: Date
    var sex: Sex
    var personalNo: String
    var placeOfBirth: String
    var dateOfIssue: Date
    var issuingAuthority: String
    var passportNo: String
    weak var person: Person?
}

class IdentityCard {
    var name: String
    var surname: String
    var citizenship: String
    var dateOfBirth: Date
    var sex: Sex
    var personalNo: String
    var placeOfBirth: String
    var dateOfIssue: Date
    var issuingAuthority: String
    var cardNo: String
    weak var person: Person?
    var changeName: (() -> ())?
    init(
        name: String,
        surname: String,
        citizenship: String,
        dateOfBirth: Date,
        sex: Sex,
        personalNo: String,
        placeOfBirth: String,
        dateOfIssue: Date,
        issuingAuthority: String,
        cardNo: String,
        person: Person?
    ) {
        self.name = name
        self.surname = surname
        self.citizenship = citizenship
        self.dateOfBirth = dateOfBirth
        self.sex = sex
        self.personalNo = personalNo
        self.placeOfBirth = placeOfBirth
        self.dateOfIssue = dateOfIssue
        self.issuingAuthority = issuingAuthority
        self.cardNo = cardNo
        self.person = person
        //უკვე ციკლი გვაქვს
        changeName = { [unowned self] in
            self.name = "new name"
        }
    }
    deinit {
        print("deinitialization of Identity Card of \(name)")
    }
}

let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd"
var sexOfPerson1: Sex? = Sex.Female
var person1: Person? = Person(
    name: "Nuca",
    surname: "Beriashvili",
    citizenship: "Georgian",
    dateOfBirth: formatter.date(from: "2004/06/19")!,
    sex: sexOfPerson1!,
    personalNo: "0100673429",
    placeOfBirth: "Tbilisi"
)
var passport1: Passport? = Passport(
    name: "Nuca",
    surname: "Beriashvili",
    citizenship: "Georgian",
    dateOfBirth: formatter.date(from: "2004/06/19")!,
    sex: sexOfPerson1!,
    personalNo: "0100673429",
    placeOfBirth: "Tbilisi",
    dateOfIssue: formatter.date(from: "2022/05/19")!,
    issuingAuthority: "Ministry of Justice",
    passportNo: "14AD65397",
    person: person1
)
var identityCard1: IdentityCard? = IdentityCard(
    name: "Nuca",
    surname: "Beriashvili",
    citizenship: "Georgian",
    dateOfBirth: formatter.date(from: "2004/06/19")!,
    sex: sexOfPerson1!,
    personalNo: "0100673429",
    placeOfBirth: "Tbilisi",
    dateOfIssue: formatter.date(from: "2022/05/14")!,
    issuingAuthority: "Ministry of Justice",
    cardNo: "19OT729374",
    person: person1
)
person1!.passsport = passport1!
person1!.identityCard = identityCard1!

identityCard1 = nil
person1 = nil
passport1 = nil
