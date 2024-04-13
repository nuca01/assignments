enum Gender {
    case Male
    case Female
}
class Person: Comparable {
    
    var name: String
    var surname: String
    var hobby: String
    var age: Int8
    var Image: String
    var gender: String
    
    init(name: String, surname:String, hobby: String, age: Int8, Image: String, gender: Gender) {
        self.name = name.capitalized
        self.surname = surname.capitalized
        self.hobby = hobby
        self.age = age
        self.Image = Image
        if gender == .Male {
            self.gender = "Male"
        } else {
            self.gender = "Female"
        }
    }
    static func < (lhs: Person, rhs: Person) -> Bool {
        return "\(lhs.name) \(lhs.surname)" < "\(rhs.name) \(rhs.surname)"
    }
    static func == (lhs: Person, rhs: Person) -> Bool {
        return "\(lhs.name) \(lhs.surname)" == "\(rhs.name) \(rhs.surname)"
    }
}
