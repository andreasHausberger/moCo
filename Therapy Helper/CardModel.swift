//
//  CardModel.swift
//  Therapy Helper
//
//  Created by Andreas on 28.04.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation

class CardModel {
    var cards: [TestCard] = [TestCard]()
    
    func addCard (card: TestCard) {
        guard card.title != nil && card.description != nil else { return }
        cards.append(card)
    }
    
    func getAllCards() -> [TestCard] {
        guard !cards.isEmpty else { return [TestCard]() }
        
        return cards
    }
    
}
