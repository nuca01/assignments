import UIKit

//შევქმნათ Class Book.
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.
//

class Book {
    private static var counter = 1
    let bookId: Int
    var title: String
    var author: String //var ტიპის იმიტომ არიან რომ შეიძლება შეცდომით გადმოაწოდეს სახელი და ჩასწორება რომ შეიძლებოდეს თუ რამე
    private var _isBorrowed: Bool = false
    var isBorrowed: Bool {
        _isBorrowed
    }
    init(title: String, 
         author: String) {
        self.bookId = Book.counter
        self.title = title
        self.author = author
        Book.counter += 1 //bookId რომ უნიკალური იყოს
    }
    
    func borrowBook() -> () {
        _isBorrowed = true
    }
    func returnBook() -> () {
        _isBorrowed = false
    }
}

//შევქმნათ Class Owner
//
//Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
//Designated Init.
//Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
//Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.
 
class Owner {
    private static var counter = 1
    let ownerID: Int
    var name: String
    private var _borrowedBooks: [Book] = []
    var borrowedBooks: [Book] {
        _borrowedBooks
    }
    init(name: String) {
        self.ownerID = Owner.counter
        self.name = name
        Owner.counter += 1
    }
    func allowedBorriwing(book: Book) -> Bool {
        if(!book.isBorrowed){
            book.borrowBook()
            _borrowedBooks.append(book)
            return true
        }
        return false
    }
    func allowedReturning(book: Book) -> Bool {
        for (index, bookInArray) in _borrowedBooks.enumerated() {
            if  bookInArray === book {
                book.returnBook()
                _borrowedBooks.remove(at: index)
                return true
            }
        }
        return false
    }
}


//შევქმნათ Class Library
//
//Properties: Books Array, Owners Array.
//Designated Init.
//Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
//Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
//Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
//Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
//Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
//Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.

class Library {
    var books: [Book]
    var owners: [Owner]
    init(books: [Book] = [],
         owners: [Owner] = []) {
        self.books = books
        self.owners = owners
    }
    func getAllAvailableBooks() -> [Book] {
        var availableBooks: [Book] = []
        for book in books {
            if !book.isBorrowed {
                availableBooks.append(book)
            }
        }
        return availableBooks
    }
    func getAllBorrowedBooks() -> [Book] {
        var borrowedBooks: [Book] = []
        for book in books {
            if book.isBorrowed {
                borrowedBooks.append(book)
            }
        }
        return borrowedBooks
    }
    func ownerExists(ownerID: Int) -> Bool {
        for owner in owners {
            if owner.ownerID == ownerID {
                return true
            }
        }
        return false
    }
    func bookExists(bookID: Int) -> Bool {
        for book in books {
            if book.bookId == bookID {
                return true
            }
        }
        return false
    }
    func booksBorrowedByOwner(owner: Owner) -> [Book] {
        var booksBorrowedInLibrary: [Book] = []
        if ownerExists(ownerID: owner.ownerID) {
            for book in owner.borrowedBooks {
                if bookExists(bookID: book.bookId) {
                    booksBorrowedInLibrary.append(book)
                }
            }
        } else {
            print("Owner is not in the library")
        }
        return booksBorrowedInLibrary
    }
    func borrowABook(book: Book, 
                     owner: Owner) -> () {
        if ownerExists(ownerID: owner.ownerID) && bookExists(bookID: book.bookId) {
            if owner.allowedBorriwing(book: book){
                print("\(book.title) is borrowed by \(owner.name)")
            } else {
                print("\(book.title) is unavailable")
            }
        } else {
            print("Owner or/and the book is not in the library")
        }
    }
    //პირობაში არ ეწერა მარა მგონი ესეც საჭიროა
    func returnABook(book: Book, owner: Owner) -> () {
        if ownerExists(ownerID: owner.ownerID) && bookExists(bookID: book.bookId) {
            if owner.allowedReturning(book: book) {
                print("\(book.title) is returned by \(owner.name)")
            } else {
                print("\(book.title) was not borrowed by \(owner.name), so they can't return it")
            }
        } else {
            print("Owner or/and the book is not in the library")
        }
    }
}

var book1 = Book(title: "The Maze Runner", 
                 author: "James Dashner")
var book2 = Book(title: "Flowers for Algernon",
                 author: "Daniel Keyes")
var book3 = Book(title: "Crime and Punishment", 
                 author: "Fyodor Dostoevsky")
var book4 = Book(title: "The Right Hand of the Grand Master",
                 author: "Konstantine Gamsaxurdia")
var book5 = Book(title: "The Knight in the Panther's Skin",
                 author: "Shota Rustaveli")
var book6 = Book(title: "The Mysterious Island",
                 author: "Jules Verne")

var owner1 = Owner(name: "Nuca")
var owner2 = Owner(name: "Giorgi")
var owner3 = Owner(name: "Lika")
var owner4 = Owner(name: "Zura")

var library = Library(books: [book1, book2, book3, book4, book5],
                      owners: [owner1, owner2, owner3])

library.borrowABook(book: book1, owner: owner1)
library.borrowABook(book: book1, owner: owner2)
library.borrowABook(book: book2, owner: owner3)
library.borrowABook(book: book4, owner: owner3)
library.borrowABook(book: book5, owner: owner1)

library.returnABook(book: book1, owner: owner2)
library.returnABook(book: book1, owner: owner1)
library.returnABook(book: book2, owner: owner3)

print("books borrowed by \(owner2.name):")
for book in library.booksBorrowedByOwner(owner: owner2) {
    print(book.title)
}
print("books borrowed by \(owner3.name):")
for book in library.booksBorrowedByOwner(owner: owner3) {
    print(book.title)
}
print("books borrowed by \(owner4.name):")
for book in library.booksBorrowedByOwner(owner: owner4) {
    print(book.title)
}
library.borrowABook(book: book1, owner: owner4)
library.borrowABook(book: book6, owner: owner1)

print("all available books:")
for book in library.getAllAvailableBooks() {
    print("\(book.title)")
}

print("all unavailable books:")
for book in library.getAllBorrowedBooks() {
    print("\(book.title)")
}

//შექმენით კლასი გამონათქვამების გენერატორი, სადაც განმარტავთ გამონათქვამს-ს რომელიც იქნება სტრინგებისგან შემდგარი კოლექცია. შექმენით მეთოდი სადაც დააბრუნებთ შერჩევითად სხვადასხვა ჯოუქს და დაბეჭდავთ მას, ასევე ჩაამატეთ მეთოდი, რომელიც ჩასვამს ან ამოაკლებს გამონათქვამს სიიდან. მოცემული გაქვთ “ქილერ” გამონათქვამების სია:
//
//დავინახე თუ არა მივხვდი, რომ – ” დევიღუპე. ”
//
//ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად
//
//სულის ტკივილამდე ვტკივილობ….
//
//იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ
//
//არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ
//
//ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე
//
//თქვენ მოჰკალით ძერა?
//
//ბებიააა... ბებია... ოლია მათხოვარი მევიდა...
//
//მზე აღარ ამოდის ჩაგვიჭრეს

class Generator {
    private var sayings: [String: String] = [
        "დავინახე თუ არა მივხვდი, რომ – \" დევიღუპე.\" ": "შემიყვარდა",
        "ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად": "იმდენად მატყუარაა თბსის დველოპერების დაწერილ კოდსაც კი რევს",
        "სულის ტკივილამდე ვტკივილობ": "მტკივა",
        "იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ": "იმედის ამოწურვა და იუმორის მარაგზე გადართვა",
        "არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ": "თავმდაბალიც ვარ და თავშიავარდნილიც",
        "ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე": "არც ბედი მაქვს არც ფული, რომელი რომელმა გამოიწვია არც ეგ ვიცი",
        "თქვენ მოჰკალით ძერა?": "გამონათქვამი ცნობილი ქართული ფილმიდან \"ჭრიჭინა\" სადაც მთავარი გმირი მარინე თოფის გასროლას შეეცდება და შემთხვევით ძერას მოკლავს. ამას ამჩნევს კაცი რომელიც ოთახიდან გამორბის.",
        "ბებიააა... ბებია... ოლია მათხოვარი მევიდა...": "ცნობილი ფრაზა დიადი ფილმიდან \"იმერული ესკიზები\" ოლია ბებო რომელიც სიმინდის ღეროებს დაატარებს ტანზე ასხმულს მიდის სტუმრად სადაც ბავშვები გაიქცევიან ბებიასთან ამ ფრაზის ყვირილით",
        "მზე აღარ ამოდის ჩაგვიჭრეს": "კომუნალურების გადაუხდელობა 2034-ში"
    ]
    init() {
    }
    func addOrRemoveSaying(saying: String, explanation: String) {
        var deleted = sayings.removeValue(forKey: saying)
        if deleted == nil {
            sayings[saying] = explanation
        }
    }
    func printRandomSaying() {
        var saying = sayings.first?.key
        var explanation = sayings.first?.value
        if let saying, let explanation {
            print("\(saying) : \(explanation)")
        } else {
            print("saying or explanation unavailable")
        }
    }
}

var generator = Generator()
generator.printRandomSaying()
generator.addOrRemoveSaying(saying: "დავინახე თუ არა მივხვდი, რომ – \" დევიღუპე.\" ", 
                            explanation: "შემიყვარდა")
generator.addOrRemoveSaying(saying: "დაცვას მიხედე, ხვედელიძე, დაცვას", 
                            explanation: "გამონათქვამი \"ფეოლადან\", ხვედელიძეს არასასურველი გოლები გააქვს")
