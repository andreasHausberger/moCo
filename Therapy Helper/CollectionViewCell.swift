//
//  CollectionViewCell.swift
//  Therapy Helper
//
//  Created by Andreas on 28.04.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var header: UILabel!
    @IBOutlet var text: UILabel!
    
    func displayContent(card: TestCard) {
        guard card.title != nil && card.description != nil else { return }
        header.text = card.title!
        text.text = card.description!
        
        self.layer.cornerRadius = 7
    }
    
    
}


