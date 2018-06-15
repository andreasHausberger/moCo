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
import SwiftyJSON

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
    
    func loadChallengesFromServer(id: Int) {
        let manager = APIManager.sharedInstance
     //   manager.setUpConnection(URL: "urli url", endpoint: "endy pointy")
        
        manager.getPostWithId(postId: id, onSuccess: { (json: JSON) in
            
            var challengeName: String = ""
            var challengeText: String = ""
            var challengeCounterTotal: Int = 0
            var challengeCounterCurrent: Int = 0
            var creationDate: Date = Date()
            
            let dict = json.dictionary! as [String : Any]
            
            if let jsonName = dict["title"] as? String {
                challengeName = jsonName
            }
            
            if let jsonText = dict["fhir_description"] as? String {
                challengeText = jsonText
            }
            
            if let jsonCounterTotal = dict["total"] as? Int {
                challengeCounterTotal = jsonCounterTotal
            }
            
            if let jsonCounterCurrent = dict["current"] as? Int {
                challengeCounterCurrent = jsonCounterCurrent
            }
            
            if let jsonDate = dict["date"] as? Date {
                creationDate = jsonDate
            }
            
            let newChallengeDataObject = ChallengeDataObject(title: challengeName, text: challengeText, counterTotal: Int64(challengeCounterTotal), counterCurrent: Int64(challengeCounterCurrent), creationDate: creationDate)
            
            self.addChallenge(newChallengeDataObject)
            
        }) { (error: Error) in
            print("Fetching a Challenge from the server failed!")
        }
        
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
