//
//  ViewController.swift
//  assignment13
//
//  Created by nuca on 05.04.24.
//

import UIKit
struct Coffee {
    var name: String
    var rating: Float
    var raterNumber: Int
    var topping: String
    var description: String
    var image: UIImage?
    var price: Float
}
class ViewController: UIViewController {
    var coffee: Coffee?
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var topping: UILabel!
    
    @IBOutlet weak var ratingAnRaterNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        coffee = Coffee(
            name: "კაპუჩინო",
            rating: 4.8,
            raterNumber: 230,
            topping: "შოკოლადით",
            description: "მოცემული კაპუჩინო არის დაახლოებით 150 მლ. ის შეიცავს 25 მლ. ესპრესოს ყავას, 85 მლ. ახალთახალი მოწველილი ძროხის რძის რძეს, რომელიც სპეც...",
            image: UIImage(named: "f74a0912e6e3eef515b6450927558373"),
            price: 4.55
        )
        productImage.image = coffee?.image
        name.text = coffee?.name
        topping.text = coffee?.topping
//        var myString: NSString = "\(String(describing: coffee?.rating)) \(String(describing: coffee?.raterNumber))" as NSString
//        var myMutableString = NSMutableAttributedString()
//        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Sora", size: 18.0)!])
//        
        let attributedText = NSMutableAttributedString(string: "\(coffee!.rating)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        attributedText.append(NSAttributedString(string: " (\(coffee!.raterNumber))", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        ratingAnRaterNumber.attributedText = attributedText
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        productImage.layer.cornerRadius = 16
        productImage.clipsToBounds = true
    }

}

