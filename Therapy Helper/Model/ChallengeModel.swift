//
//  ChallengeModel.swift
//  Therapy Helper
//
//  Created by Josef Glas on 24.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//
//

import Foundation
import UIKit
import CoreData
class ChallengeModel {
    private var challenges: [Challenge] = [Challenge]()
    private var challengeDataObjects: [ChallengeDataObject] = [ChallengeDataObject]()
    
    func addChallenge(_ ChallengeDataObject: ChallengeDataObject) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Challenge", in: context)
        
        let newChallenge = Challenge(entity: entity!, insertInto: context)
        
        newChallenge.title = ChallengeDataObject.title
        newChallenge.text = ChallengeDataObject.text
        newChallenge.counterCurrent = ChallengeDataObject.counterCurrent
        newChallenge.counterTotal = ChallengeDataObject.counterTotal
        newChallenge.creationDate = ChallengeDataObject.creationDate
        challenges.append(newChallenge)
        
        challengeDataObjects.append(ChallengeDataObject)
        delegate.saveContext()
        
    }
    
    func getChallenges() -> [ChallengeDataObject] {
        return challengeDataObjects
    }
    
    func loadChallenges() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        do {
            if let fetchedChallenges = try context.fetch(Challenge.fetchRequest()) as? [Challenge] {
                if !fetchedChallenges.isEmpty {
                    challenges = fetchedChallenges
                    for challenge in challenges {
                        let trueText = challenge.text == nil ? "" : challenge.text!
                        
                        let challengeDataObject = ChallengeDataObject(title: challenge.title!, text: trueText, counterTotal: challenge.counterCurrent, counterCurrent: challenge.counterCurrent, creationDate: challenge.creationDate!)
                        
                        challengeDataObjects.append(challengeDataObject)
                    }
                }
            }
        }
        catch {
            print("Fetch failed")
        }
    }
    
}
