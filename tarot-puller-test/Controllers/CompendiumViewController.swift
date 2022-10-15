//
//  CompendiumViewController.swift
//  tarot-puller-test
//
//  Created by Gabriel Santiago on 13/10/22.
//

import UIKit

class CompendiumViewController: UIViewController {
    
    let compendiumView = CompendiumView()
    
    override func loadView() {
        self.view = compendiumView
        compendiumView.didTapButtonHandler = { [weak self] card in
            let nextViewController = CardViewController(card: card)
            self?.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
