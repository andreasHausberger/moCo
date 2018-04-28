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
    
    func displayContent(headerContent: String, textContent: String) {
        header.text = headerContent
        text.text = textContent
    }
    
    
}


