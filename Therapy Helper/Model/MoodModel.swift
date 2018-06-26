//
//  MoodModel.swift
//  Therapy Helper
//
//  Created by Andreas on 10.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation
import UIKit
import CoreData
// import SwiftyJSON
import SMART

class MoodModel {
    private var moods: [Mood] = [Mood]()
    private var moodDataObjects: [MoodDataObject] = [MoodDataObject]()
    
    func addMood(_ moodDataObject: MoodDataObject){
        moodDataObjects.append(moodDataObject)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Mood", in: context)
        
        let newMood = Mood(entity: entity!, insertInto: context)
        newMood.mental_wellbeing = moodDataObject.mental_wellbeing
        newMood.physical_wellbeing = moodDataObject.physical_wellbeing
        newMood.optimism = moodDataObject.optimism
        newMood.overall = moodDataObject.overall
        newMood.text = moodDataObject.text
        newMood.patientID = 111 //TODO: Figure this out
        newMood.time_created = moodDataObject.creationDate!
        
        moods.append(newMood)
        
        delegate.saveContext();
        
    }
    
    func getMoods() -> [MoodDataObject] {
        return moodDataObjects
    }
    
    func loadMoodsFromServer(json: FHIRJSON) {
        var moodText: String = ""
        var moodPhysical: Double = 0
        var moodMental: Double = 0
        var moodOptimism: Double = 0
        var creationDate: Date = Date()
        
        if let jsonText = json["text"] as? String {
            moodText = jsonText
        }
        
        if let moods = json["item"] as? SMART.Bundle {
            print(moods.description)
            //wtf do we do here?
        }
        
        if let date = json["authored"] as? DateTime {
            creationDate = date.nsDate
        }
        
        addMood(MoodDataObject(mental_wellbeing: moodMental, physical_wellbeing: moodPhysical, optimism: moodOptimism, text: moodText, creationDate: creationDate))
    }
    
    func loadMoods() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        do {
            if let fetchedMoods = try context.fetch(Mood.fetchRequest()) as? [Mood] {
                if !fetchedMoods.isEmpty {
                    moods = fetchedMoods
                    
                    for mood in moods {
                        let trueText = mood.text == nil ? "" : mood.text!
                        let moodDataObject = MoodDataObject(mental_wellbeing: mood.mental_wellbeing, physical_wellbeing: mood.physical_wellbeing, optimism: mood.optimism, text: trueText, creationDate: mood.time_created!)
                        moodDataObjects.append(moodDataObject)
                    }
                }
            }
        }
        catch {
            print("Fetch failed")
        }
    }

    
    
}

