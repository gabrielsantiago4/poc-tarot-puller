//
//  CartListModel.swift
//  tarot-puller-test
//
//  Created by Gabriel Santiago on 11/10/22.
//

import Foundation

struct CardList: Codable {
    
    let nhits: Int
    let cards : [Card]
}
