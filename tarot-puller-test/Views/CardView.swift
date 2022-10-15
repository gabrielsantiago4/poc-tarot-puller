//
//  CardView.swift
//  tarot-puller-test
//
//  Created by Gabriel Santiago on 13/10/22.
//

import UIKit

class CardView: UIView {
    
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "background")
        return backgroundImage
    }()
    
    lazy var cardImage: UIImageView = {
       let cardImage = UIImageView()
       return cardImage
    }()
    
    var cardTitle: UILabel = {
        let cardTitle = UILabel()
        cardTitle.textColor = .black
        return cardTitle
    }()
    
    var cardMeaningUp: UILabel = {
        let cardMeaning = UILabel()
        cardMeaning.textColor = .black
        cardMeaning.numberOfLines = 0
        return cardMeaning
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configCardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configCardView () {
        
        addSubview(backgroundImage)
        addSubview(cardTitle)
        addSubview(cardMeaningUp)
        addSubview(cardImage)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        cardTitle.translatesAutoresizingMaskIntoConstraints = false
        cardMeaningUp.translatesAutoresizingMaskIntoConstraints = false
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            
            cardTitle.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            cardTitle.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -300),
            
//            cardMeaningUp.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            cardMeaningUp.topAnchor.constraint(equalTo: cardImage.bottomAnchor,constant: 20),
            cardMeaningUp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            cardMeaningUp.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            cardImage.heightAnchor.constraint(equalToConstant: 300),
            cardImage.widthAnchor.constraint(equalToConstant: 200),
            cardImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            cardImage.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -120)
            
        ])
    }
}
