//
//  SkillModel.swift
//  Therapy Helper
//
//  Created by Andreas on 01.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation
import UIKit
import CoreData
// import SwiftyJSON
import SMART

class SkillModel {
    private var skills: [Skill] = [Skill]()
    private var skillDataObjects: [SkillDataObject] = [SkillDataObject]()
    
    func addSkill(_ skillDataObject: SkillDataObject) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Skill", in: context)
        
        let newSkill = Skill(entity: entity!, insertInto: context)
        
        newSkill.name = skillDataObject.name
        newSkill.text = skillDataObject.text
        newSkill.category = Int64(skillDataObject.category)
        newSkill.creationDate = skillDataObject.creationDate
        newSkill.timer = Int64(skillDataObject.timer)
        skillDataObjects.append(skillDataObject)
        skills.append(newSkill)

        delegate.saveContext()
        
    }
    
    func getSkills() -> [SkillDataObject] {
        return skillDataObjects
    }
    
    
    func loadSkillsFromServer(json: FHIRJSON) {
        
            var skillName: String = ""
            var skillDate: Date = Date()
            var skillText: String = ""
            var skillTimer: Int = 0
            var skillCategory: Int = 0
            
            if let jsonName = json["title"] as? String {
                skillName = jsonName
            }
            
            if let jsonDate = json["date"] as? Date {
                skillDate = jsonDate
            }
            
            if let jsonDescription = json["fhir_description"] as? String {
                skillText = jsonDescription
            }
            
            if let jsonTimer = json["timer_minutes"] as? Int {
                skillTimer = jsonTimer
            }
            
            if let jsonCategory = json["category"] as? Int {
                skillCategory = jsonCategory
            }
            
            let newSkillDataObject = SkillDataObject(name: skillName, text: skillText, category: skillCategory, creationDate: skillDate, timer: skillTimer)
            
            self.addSkill(newSkillDataObject)
       
    }
    
    func loadSkills() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        do {
            if let fetchedSkills = try context.fetch(Skill.fetchRequest()) as? [Skill] {
                if !fetchedSkills.isEmpty {
                    skills = fetchedSkills
                    for skill in skills {
                        let trueText = skill.text == nil ? "" : skill.text!
                        let skillDataObject = SkillDataObject(name: skill.name!, text: trueText, category: Int(skill.category), creationDate: skill.creationDate!, timer: Int(skill.timer))
                        
                        skillDataObjects.append(skillDataObject)
                    }
                }
            }
        }
        catch {
            print("Fetch failed")
        }
    }
    
    func deleteSkill(index: Int) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let skillToDelete = skills[index]
        
        context.delete(skillToDelete)
        delegate.saveContext()
        
        loadSkills()
        
    }
    
    
    
    
}
