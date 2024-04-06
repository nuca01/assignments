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
    @IBOutlet weak var descriptionOfItem: UILabel!
    @IBOutlet weak var ratingAnRaterNumber: UILabel!
    @IBOutlet var heartButton: UIButton!
    @IBOutlet weak var smallButtoon: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var bigButton: UIButton!
    @IBOutlet weak var price: UILabel!
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
        
        setRating(coffee: coffee)
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        descriptionOfItem.numberOfLines = 4
        descriptionOfItem.text = coffee?.description
        smallButtoon.layer.borderWidth = 1
        smallButtoon.configuration?.imagePadding = 10
        smallButtoon.layer.cornerRadius = 12
        smallButtoon.layer.borderColor = CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        mediumButton.layer.borderWidth = 1
        mediumButton.configuration?.imagePadding = 10
        mediumButton.layer.cornerRadius = 12
        mediumButton.layer.borderColor = CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        bigButton.layer.borderWidth = 1
        bigButton.configuration?.imagePadding = 10
        bigButton.layer.cornerRadius = 12
        bigButton.layer.borderColor = CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        price.text = "₾\(coffee!.price)"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let horizontalConstraint = NSLayoutConstraint(item: productImage!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: productImage!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 315)
        view.addConstraints([horizontalConstraint, widthConstraint])
        productImage.layer.cornerRadius = 16
        productImage.clipsToBounds = true
    }
    
    func setRating (coffee: Coffee?) -> () {
        let attributedText = NSMutableAttributedString(string: "\(coffee!.rating)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        attributedText.append(NSAttributedString(string: " (\(coffee!.raterNumber))", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        ratingAnRaterNumber.attributedText = attributedText
    }
    @IBAction func tapHeart(_ sender: UIButton) {
        if heartButton.currentImage == UIImage(systemName: "heart") {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self.coffee!.raterNumber = self.coffee!.raterNumber + 1
            setRating(coffee: coffee)
        } else {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            
            self.coffee!.raterNumber = self.coffee!.raterNumber - 1
            setRating(coffee: coffee)
        }
    }
    
    @IBAction func tapSmallButton(_ sender: Any) {
        bigButton.layer.borderColor = CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        mediumButton.layer.borderColor = CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        smallButtoon.layer.borderColor = CGColor(red: 0.77, green: 0.48, blue: 0.3, alpha: 1)
        smallButtoon.tintColor = UIColor.init(red: 0.77, green: 0.48, blue: 0.3, alpha: 1)
        mediumButton.tintColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        bigButton.tintColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        mediumButton.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        bigButton.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        smallButtoon.backgroundColor = UIColor.init(red: 1, green: 0.96, blue: 0.93, alpha: 1)
    }
    
    @IBAction func tapMediumButton(_ sender: Any) {
        bigButton.layer.borderColor = CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        smallButtoon.layer.borderColor = CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        mediumButton.layer.borderColor = CGColor(red: 0.77, green: 0.48, blue: 0.3, alpha: 1)
        mediumButton.tintColor = UIColor.init(red: 0.77, green: 0.48, blue: 0.3, alpha: 1)
        smallButtoon.tintColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        bigButton.tintColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        smallButtoon.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        bigButton.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        mediumButton.backgroundColor = UIColor.init(red: 1, green: 0.96, blue: 0.93, alpha: 1)
    }
    
    @IBAction func tapBigButton(_ sender: Any) {
        smallButtoon.layer.borderColor = CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        mediumButton.layer.borderColor = CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        bigButton.layer.borderColor = CGColor(red: 0.77, green: 0.48, blue: 0.3, alpha: 1)
        bigButton.tintColor = UIColor.init(red: 0.77, green: 0.48, blue: 0.3, alpha: 1)
        smallButtoon.tintColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        mediumButton.tintColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        smallButtoon.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        mediumButton.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        bigButton.backgroundColor = UIColor.init(red: 1, green: 0.96, blue: 0.93, alpha: 1)
    }
}

