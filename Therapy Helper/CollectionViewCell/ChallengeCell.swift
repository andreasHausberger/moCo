//
//  SkillCellCollectionViewCell.swift
//  Therapy Helper
//
//  Created by Andreas on 01.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit
import CoreData

class ChallengeCell: UICollectionViewCell {
    
    var challenge: ChallengeDataObject?
    
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var creationDate: UILabel!
    
    @IBOutlet weak var counterCurrent: UILabel!
    
    @IBOutlet weak var counterTotal: UILabel!
    
    
    func configureContent(from challenge: ChallengeDataObject) {
        self.challenge = challenge
        title.text = challenge.title
        text.text = challenge.text
        creationDate.text = challenge.creationDate.description
        counterCurrent.text = challenge.counterCurrent.description
        counterTotal.text = challenge.counterTotal.description
        
        return
        
        
    }
}
