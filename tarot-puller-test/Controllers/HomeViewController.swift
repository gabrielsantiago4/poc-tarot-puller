//
//  ViewController.swift
//  tarot-puller-test
//
//  Created by Gabriel Santiago on 11/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func loadView() {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ApiServices.getAllCards { list in
            list.cards.forEach { card in
                print(card.name)
            }
        }

    }


}

