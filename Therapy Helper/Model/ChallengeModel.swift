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
// import SwiftyJSON
import SMART

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
    
    func loadChallengesFromServer(json: FHIRJSON) {
        var challengeName: String = ""
        var challengeText: String = ""
        var challengeCounterTotal: Int = 0
        var challengeCounterCurrent: Int = 0
        var creationDate: Date = Date()
        
        if let jsonName = json["name"] as? String {
            challengeName = jsonName
        }
        
        if let jsonText = json["fhir_description"] as? String {
            challengeText = jsonText
        }
        
        if let jsonCounterTotal = json["goal"] as? Int {
            challengeCounterTotal = jsonCounterTotal
        }
        
        if let jsonCounterCurrent = json["fhir_description"] as? Int {
            challengeCounterCurrent = jsonCounterCurrent
        }
        
        if let jsonDate = json["date"] as? DateTime {
            creationDate = jsonDate.nsDate
        }
        
        let newChallengeDataObject = ChallengeDataObject(title: challengeName, text: challengeText, counterTotal: Int64(challengeCounterTotal), counterCurrent: Int64(challengeCounterCurrent), creationDate: creationDate)
        
        self.addChallenge(newChallengeDataObject)
        
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
                        
                        let challengeDataObject = ChallengeDataObject(title: challenge.title!, text: trueText, counterTotal: challenge.counterTotal, counterCurrent: challenge.counterCurrent, creationDate: challenge.creationDate!)
                        
                        challengeDataObjects.append(challengeDataObject)
                    }
                }
            }
        }
        catch {
            print("Fetch failed")
        }
    }
    
    func updateChallenge(_ ChallengeDataObject: ChallengeDataObject) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        //let context = delegate.persistentContainer.viewContext
        
        print("here")
        
        for challenge in challenges {
            print(challenge.counterCurrent.description)
            if (challenge.title == ChallengeDataObject.title) {
                challenge.counterCurrent = ChallengeDataObject.counterCurrent
                print(challenge.counterCurrent.description)
            }
        }
        
        delegate.saveContext()
        
    }
    
}
