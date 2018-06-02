//
//  DiaryModel.swift
//  Therapy Helper
//
//  Created by Andreas on 28.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DiaryModel {
    var diaries: [DiaryDataObject] = [DiaryDataObject]()
    
    func saveDiary(_ diaryDataObject: DiaryDataObject)  {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Diary", in: context)
        
        let newDiary = Diary(entity: entity!, insertInto: context)
        newDiary.startTime = diaryDataObject.startTime
        newDiary.endTime = diaryDataObject.endTime
        newDiary.score = diaryDataObject.score
        newDiary.patient_id = 111 // TODO: Figure This out
        newDiary.morningActivities = diaryDataObject.morningActivities as NSObject
        newDiary.afternoonActivities = diaryDataObject.afternoonActivities as NSObject
        newDiary.eveningActivities = diaryDataObject.eveningActivities as NSObject
        
        delegate.saveContext()
    }
    
    func loadDiaries() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        do {
            if let fetchedDiaries = try
                context.fetch(Diary.fetchRequest()) as? [Diary] {
                if (!fetchedDiaries.isEmpty) {
                    for diary in fetchedDiaries {
                        let newDiaryDataObject = DiaryDataObject(score: diary.score, startTime: diary.startTime!, endTime: diary.endTime!, patientID: Int(diary.patient_id))
                        
                        if let morningActivities = diary.morningActivities as? [DiaryEntryDataObject] {
                            newDiaryDataObject.morningActivities = morningActivities
                        }
                        
                        if let afternoonActivities = diary.afternoonActivities as? [DiaryEntryDataObject] {
                            newDiaryDataObject.afternoonActivities = afternoonActivities
                        }
                        
                        if let eveningActivities = diary.eveningActivities as? [DiaryEntryDataObject] {
                            newDiaryDataObject.eveningActivities = eveningActivities
                        }
                        
                        diaries.append(newDiaryDataObject)
                    }
                }
            }
        }
        catch {
            print("Fetch failed")
        }
    }
    
    func getDiaries() -> [DiaryDataObject] {
        return diaries
    }
    
}
