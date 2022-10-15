//
//  CompendiumTableViewCell.swift
//  tarot-puller-test
//
//  Created by Gabriel Santiago on 13/10/22.
//

import UIKit

class CompendiumTableViewCell: UITableViewCell {
    
    
    var cardName: UILabel = {
        let cardName = UILabel()
        return cardName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCompendiumCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCompendiumCell() {
        
        contentView.addSubview(cardName)
        
        cardName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cardName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            cardName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0)
        
        ])
        
    }
    
    
}
