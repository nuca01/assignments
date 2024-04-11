//
//  ZodiacViewController.swift
//  assignment 15
//
//  Created by nuca on 11.04.24.
//
import UIKit

protocol ColorChangableDelegate {
    func changeColor(color: UIColor)
}

class ZodiacViewController: UIViewController, ColorChangableDelegate {
    var mainZodiac: Zodiac?
    lazy var aries: Zodiac = {
        let zodiac = Zodiac(
            name: "Aries",
            description: "At their core, Aries do things their own way. They are unafraid of conflict, highly competitive, and honest. They throw themselves at the world eagerly and without fear. \nAries are driven by a desire to prove themselves and their strength. They have high energy, and are competitive and ambitious. They naturally take charge because they are good at initiating new projects. They can also be impatient, but are naturally active and don’t like to waste time.\nWhile Aries like competition, they don’t like to play games. They are highly self-aware, have strong opinions and are always ready to defend them. \n All Aries want to feel things intensely. This is one of their most commendable qualities, but also what causes them a great deal of pain and grief. Aries tend to be impulsive, impatient, and hotheaded. They are often reacting out of emotion rather than from a place of calm clear-headedness. They do not apologize for their anger. They say “I don’t care” and mean it. They don’t always have the best self-control.",
            polarSign: "Libra"
        )
        return zodiac
    }()
    lazy var taurus: Zodiac = {
        let zodiac = Zodiac(
            name: "Taurus",
            description: "Taurus is an earth sign represented by the bull. Like their celestial spirit animal, Taureans enjoy relaxing in serene, bucolic environments, surrounded by soft sounds, soothing aromas, and succulent flavors. Taurus is ruled by Venus, the enchanting planet that governs love, beauty, and money. Taurus’s Venusian influence make this earth sign the most sensual of the zodiac: These cosmic oxen are enchanted by any physical manifestation of comfort and luxury. Pleasure is a necessity for epicurean Taureans and they feel most content when pampered. (Taurus governs the neck, so neck caresses are especially irresistible to these bulls.) /n It's true that in their perfect world, Taureans would spend all day bathing in a tub overflowing with essential oils. At the same time, these earth signs know the value of a dollar. Taureans aren’t afraid to roll up their sleeves and work hard to earn big rewards. They're ambitious, focused, and resilient and they feel most secure when steadily putting money into a savings account.",
            polarSign: "Scorpio"
        )
        return zodiac
    }()
    lazy var gemini: Zodiac = {
        let zodiac = Zodiac(
            name: "Gemini",
            description: "Have you ever been so busy that you wished you could clone yourself just to get everything done? That’s the Gemini experience in a nutshell. Appropriately symbolized by the celestial twins, this air sign was interested in so many pursuits that it had to double itself. Because of Geminis' intrinsic duality, they're often falsely misrepresented as two-faced. In reality, however, Gemini rarely has a hidden agenda. Playful and intellectually curious, Gemini is constantly juggling a variety of passions, hobbies, careers, and friend groups. They are the social butterflies of the zodiac: These quick-witted twins can talk to anyone about anything. Find them buzzing between happy hours, dinner parties, and dance floors. /nGemini season begins on May 21, a day that ushers in the heat and electricity of summer. Gemini is accordingly excellent at guiding change and transformation. These curious twins are terrific pioneers, using their energy to spearhead innovative creative projects. A fearless thinker, Gemini is always down to try something new. But after they have shared their progressive vision with the world, it’s best to let these twins get back to ideating: These hyperactive air signs have short attention spans and are most satisfied when they can move fluidly from one idea to the next.",
            polarSign: "Saggitarius"
        )
        return zodiac
    }()
    lazy var cancer: Zodiac = {
        let zodiac = Zodiac(
            name: "Cancer",
            description: "Cancer is a cardinal water sign. Represented by the crab, this oceanic crustacean seamlessly weaves between the sea and shore, representing Cancer’s ability to exist in both emotional and material realms. Cancers are highly intuitive and their psychic abilities manifest in tangible spaces: For instance, Cancers can effortlessly pick up the energies in a room. These crabs are highly sensitive to their environments, as well as extremely self-protective. Much like their celestial spirit animal, Cancers are shielded by hard, external shells. At first, these crabs may be perceived as cold or distant. With time, though, Cancers reveal their gentle nature, genuine compassion, and mystical capabilities. Just don't be surprised if it takes a while to get to know them. \nCancer is ruled by the moon, the celestial body that represents comfort, self-care, and maternal energies. Accordingly, Cancers tend to be domestically oriented. They love to create cozy, safe spaces that serve as their personal sanctuaries, then spend lots of time in them. Cancers care deeply about their families and are quick to adopt caregiver roles. But these crabs must be careful: When Cancers invest in someone emotionally, they risk blurring the line between attentive nurturing and controlling behavior.",
            polarSign: "Capricorn"
        )
        return zodiac
    }()
    lazy var leo: Zodiac = {
        let zodiac = Zodiac(
            name: "Leo",
            description: "Roll out the red carpet, because Leo has arrived. Leo is represented by the lion, and these spirited fire signs are the kings and queens of the celestial jungle. They’re delighted to embrace their royal status: Vivacious, theatrical, and passionate, Leos love to bask in the spotlight and celebrate themselves. These lions are natural leaders and they enjoy cultivating friendships and romances that are artistically and creatively inspired. Playful Leos have no problem leaning into drama-fueled romances that are perfectly suited for the tabloids. (In fact, they may even prefer them.) After all, every Leo perceives him or herself as a celebrity. These astrological divas never get tired of lavish dinners, exclusive parties, or decadent designer wear. /nLeo is ruled by the sun, the dazzling celestial body that governs life and vitality. The sun never goes retrograde, and likewise, Leos are renowned for their stability, loyalty, and consistency. They are dedicated friends and lovers who put their hearts into every relationship. (Fittingly, the Leo sign governs the heart.) Lions love to watch their mates succeed — until they feel threatened. They can become impaired by their ego, pride, and jealousy when they start to fear their star power will be eclipsed. It’s important for celestial lions to remember that their light is never obscured by others, and the bright shine of others' success does nothing to their own. Ultimately, Leos' own hubris is the greatest threat to their happiness.",
            polarSign: "Aquarious"
        )
        return zodiac
    }()
    lazy var virgo: Zodiac = {
        let zodiac = Zodiac(
            name: "Virgo",
            description: "Virgo is an earth sign historically represented by the goddess of wheat and agriculture, an association that speaks to Virgo’s deep-rooted presence in the material world. Virgos are logical, practical, and systematic in their approach to life. This earth sign is a perfectionist at heart and isn’t afraid to improve skills through diligent and consistent practice. Virgo rules the digestive system, which makes these earth signs especially attuned to the ingredients that make up a whole — in food and in everything else. They're hyper-aware of every detail. \nVirgo is governed by Mercury, the messenger planet of communication. Though Mercury also rules Gemini, these two signs are radically different: Gemini is about output and expression, whereas Virgo is about input and processing. A Virgo deals with information like a computer, transforming even the most jumbled set of information into organized, clear concepts. Though Virgos long to be meticulous in all pursuits, they must remember that constantly chasing after the ideal can be destructive when applied to self or others. Beauty exists within our imperfections and it’s important for Virgos to learn that flaws are not defects.",
            polarSign: "Pisces"
        )
        return zodiac
    }()
    lazy var pisces: Zodiac = {
        let zodiac = Zodiac(
            name: "Pisces",
            description: "Pisces, a water sign, is the last constellation of the zodiac. It's symbolized by two fish swimming in opposite directions, representing the constant division of Pisces's attention between fantasy and reality. As the final sign, Pisces has absorbed every lesson — the joys and the pains, the hopes and the fears — learned by all of the other signs. This makes these fish the most psychic, empathetic, and compassionate creatures of the astrological wheel. With such immense sensitivity, Pisces can easily become swallowed by emotions and must remember to stay grounded in the material realm (appropriately, Pisces rules the feet). \nPisces is ruled by Neptune, the celestial body that governs creativity and dreams, and these ethereal fish adore exploring their boundless imaginations. In its more nefarious form, however, Neptune also oversees illusion and escapism. Neptunian energy is like the energy of the ocean: magical, mysterious, and often scary. When the fog is thick on the water, the horizon is obstructed and there is no differentiation between the sea and the sky.",
            polarSign: "Virgo"
        )
        return zodiac
    }()
    lazy var aquarious: Zodiac = {
        let zodiac = Zodiac(
            name: "Aquarious",
            description: "As you can imagine, I encounter a lot of misconceptions as a professional astrologer — not just regarding my career as a stargazer, but also relating to the technical aspects of astrology. One of the most ubiquitous, albeit innocuous, errors is that Aquarius is a water sign. I could certainly understand the confusion here — especially with \"aqua\" as the prefix — but once you get to know this zodiac sign, it becomes strikingly clear that Aquarius is an air sign. As the eleventh and penultimate sign of the zodiac, Aquarius is actually the final air sign, which means it deals with air-related concepts (we'll get more into that momentarily) from a macro-perspective. Of all the zodiac signs, Aquarius is undoubtedly the most innovative, progressive, rebellious, and humanitarian. And while Aquarius can often be found planning a revolution or proudly flaunting their funky fashion sensibility, they also have an often overlooked sensitive side that requires appreciation, support, and love.",
            polarSign: "Leo"
        )
        return zodiac
    }()
    lazy var capricorn: Zodiac = {
        let zodiac = Zodiac(
            name: "Capricorn",
            description: "The last earth sign of the zodiac, Capricorns and their unique spirits are powerful, to say the least. I've worked with thousands of clients over my nearly-10 year-long career as a professional astrologer, and I can confirm that there's something that makes Capricorn extremely special. Perhaps it's their fearless ambition? Their limitless resilience? Their ability to keep pushing forward, even in the face of challenging adversity and painful strife? Or, maybe it's their secret wild side that's very rarely depicted in standard personality assessments, but that rumbles within the soul of every Capricorn: Not everyone gets to see Capricorn ordering rounds of tequila, dancing on the table, and staying out until the crack of dawn — but that rebellious, untamed spirit is a Capricorn asset. I mean, how else do you expect this zodiac sign to let loose and have fun?",
            polarSign: "Cancer"
        )
        return zodiac
    }()
    lazy var saggitarius: Zodiac = {
        let zodiac = Zodiac(
            name: "Saggitarius",
            description: "The final fire sign of the zodiac, Sagittarius traits are unlike any other sign of the zodiac; they're totally unique to this brazen spirit. As a professional astrologer with almost 10 years of experience, I can honestly say that there is no zodiac sign like Sagittarius. What makes Sagittarius so unique is its dynamic blend of passion, curiosity, intensity, and adaptability. Represented by the archer (a half-man, half-horse centaur), Sagittarius isn't afraid to use its bow and arrow to explore expansive terrain, seeking answers in places and spaces others wouldn’t dare venture. Whether they're white water rafting down a river in some undisclosed location or taking a pilgrimage to a sacred site to uncover secrets about an ancient civilization, Sagittarius’ quest for knowledge knows no bounds.",
            polarSign: "Gemini"
        )
        return zodiac
    }()
    lazy var scorpio: Zodiac = {
        let zodiac = Zodiac(
            name: "Scorpio",
            description: "Scorpio is one of the most misunderstood signs of the zodiac. Because of its incredible passion and power, Scorpio is often mistaken for a fire sign. In fact, Scorpio is a water sign that derives its strength from the psychic, emotional realm. Like fellow water signs, Cancer and Pisces, Scorpio is extremely clairvoyant and intuitive. \nWhat makes this water sign unique is its distinctive venomous sting. Like their celestial spirit animal, the scorpion, Scorpios lie in wait and strike when least expected. Life is a game of chess for these calculating water signs, who are constantly plotting several steps ahead in order to orchestrate an eventual checkmate. This doesn't mean their intentions are necessarily nefarious. Scorpios simply know what they want and aren't afraid to work hard and play the long game to get it.",
            polarSign: "Taurus"
        )
        return zodiac
    }()
    lazy var libra: Zodiac = {
        let zodiac = Zodiac(
            name: "Libra",
            description: "Libra is an air sign represented by the scales (interestingly, the only inanimate object of the zodiac), an association that reflects Libra's fixation on balance and harmony. Libra is obsessed with symmetry and strives to create equilibrium in all areas of life. These air signs are the aesthetes of the zodiac: Ruled by Venus, the planet that governs love, beauty, and money, Libras adore high art, intellectualism, and connoisseurship. Suave Libras need to surround themselves with stunning objects and create environments that reflect their exquisite tastes. Accordingly, these air signs make excellent designers, decorators, art critics, and stylists. \nWhile Libra's opposite sign, Aries, represents \"me,\" Libra symbolizes \"we\" Relationships are paramount for Libras, who find balance in companionship. They love harmonious partnerships with fashionable mates, especially those who make attractive arm candy.",
            polarSign: "Aries"
        )
        return zodiac
    }()
    lazy var zodiacImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "\(mainZodiac!.name)")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var zodiacNameLabel: UILabel = {
        let label = UILabel()
        label.text = "\(mainZodiac!.name)"
        label.font = UIFont(name: "sylfaen", size: 24)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var descriptionTextView: UITextView = {
        let textView =  UITextView()
        textView.font = UIFont(name: "Sylfaen", size: 14)
        textView.layer.borderColor = CGColor(red: 0.49, green: 0.49, blue: 0.51, alpha: 1)
        textView.isEditable = false
        //textView.isHidden = false
        textView.backgroundColor = UIColor.clear
        textView.textColor = .white
        textView.text = mainZodiac!.description
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var polarSignButton: UIButton = {
        let button = UIButton()
        button.setTitle("პოლარული ნიშანი", for: .normal)
        button.titleLabel?.font = UIFont(name: "Sylfaen", size: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.31, green: 0.0, blue: 0.71, alpha: 1)
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var imageAndNameStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [zodiacImage,
         zodiacNameLabel
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var descriptionAndButtonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40.0
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [descriptionTextView,
         polarSignButton
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var wholeStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [imageAndNameStackView,
         descriptionAndButtonStackView
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        addAndConstrainWholeStackview()
        addConstraintsToImage()
        addConstraintsToPolarSignButton()
        addConstraintsToZodiacNameLabel()
        addConstraintsTodescriptionAndButtonStackView()
        addConstraintsToDescriptionTextView()
    }
    
    func addBackground(){
        view.backgroundColor = UIColor(patternImage: UIImage(named: "zodiacImage")!)
    }
    func addAndConstrainWholeStackview() {
        view.addSubview(wholeStackview)
        addViewConstraints(
            view: wholeStackview,
            topAnchorSeparationInRespectTo: view.topAnchor,
            topAnchorSeparationConstant: 55,
            leadingAnchorSeparationInRespectTo: view.leadingAnchor,
            leadingAnchorSeparationConstant: 20,
            trailingAnchorSeparationInRespectTo: view.trailingAnchor,
            trailingAnchorSeparationConstant: -20
        )
    }
    func addConstraintsToImage() {
        addViewConstraints(
            view: zodiacImage,
            height: 156,
            width: 156
        )
    }
    func addConstraintsToZodiacNameLabel() {
        addViewConstraints(
            view: zodiacNameLabel,
            height: 34
        )
    }
    func addConstraintsToPolarSignButton() {
        addViewConstraints(
            view: polarSignButton,
            height: 46
        )
    }
    func addConstraintsTodescriptionAndButtonStackView(){
        addViewConstraints(
            view: descriptionAndButtonStackView,
            leadingAnchorSeparationInRespectTo: wholeStackview.leadingAnchor,
            leadingAnchorSeparationConstant: 0,
            trailingAnchorSeparationInRespectTo: wholeStackview.trailingAnchor,
            trailingAnchorSeparationConstant: 0
        )
    }
    func addConstraintsToDescriptionTextView() {
        addViewConstraints(
            view: descriptionTextView,
            height: UIScreen.main.bounds.height - 395
        )
    }
    func addViewConstraints(
        view: UIView,
        height: CGFloat? = nil,
        width: CGFloat? = nil,
        topAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
        topAnchorSeparationConstant: CGFloat? = nil,
        bottomAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
        bottomAnchorSeparationConstant: CGFloat? = nil,
        leadingAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        leadingAnchorSeparationConstant: CGFloat? = nil,
        trailingAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        trailingAnchorSeparationConstant: CGFloat? = nil,
        centerXAnchorEqualTo: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        centerYAnchorEqualTo: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil
    ) {
        view.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        if let height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width {
            view.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let topAnchorSeparationConstant, let topAnchorSeparationInRespectTo {
            view.topAnchor.constraint(
                equalTo: topAnchorSeparationInRespectTo,
                constant: topAnchorSeparationConstant
            ).isActive = true
        }
        if let bottomAnchorSeparationConstant, let bottomAnchorSeparationInRespectTo {
            view.bottomAnchor.constraint(
                equalTo: bottomAnchorSeparationInRespectTo,
                constant: bottomAnchorSeparationConstant
            ).isActive = true
        }
        if let leadingAnchorSeparationConstant, let leadingAnchorSeparationInRespectTo {
            view.leadingAnchor.constraint(
                equalTo: leadingAnchorSeparationInRespectTo,
                constant: leadingAnchorSeparationConstant
            ).isActive = true
        }
        if let trailingAnchorSeparationConstant, let trailingAnchorSeparationInRespectTo {
            view.trailingAnchor.constraint(equalTo: trailingAnchorSeparationInRespectTo, constant: trailingAnchorSeparationConstant).isActive = true
        }
        if let centerXAnchorEqualTo {
            view.centerXAnchor.constraint(equalTo: centerXAnchorEqualTo).isActive = true
        }
        if let centerYAnchorEqualTo {
            view.centerYAnchor.constraint(equalTo: centerYAnchorEqualTo).isActive = true
        }
    }
    func changeColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    @objc func pressed() {
        let nextViewController = PolarSignViewController()
        nextViewController.polarSignName = mainZodiac?.polarSign
        nextViewController.zodiacViewConroller = self
        navigationController?.pushViewController(nextViewController, animated: true)
    }

}

