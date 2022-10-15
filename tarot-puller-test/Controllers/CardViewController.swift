//
//  CardViewController.swift
//  tarot-puller-test
//
//  Created by Gabriel Santiago on 13/10/22.
//

import UIKit

class CardViewController: UIViewController {
    
    let cardView = CardView()
    
    let card: Card
    
    init(card: Card) {
        self.card = card
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = cardView
        view.backgroundColor = .systemBackground
        cardView.cardTitle.text = card.name
        cardView.cardMeaningUp.text = card.meaning_up
        cardView.cardImage.image = UIImage(named: card.name)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
