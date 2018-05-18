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

class SkillModel {
    private var skills: [Skill] = [Skill]()
    
    func addSkill(name: String, text: String, categoryNumber: Int) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Skill", in: context)
        
        let newSkill = Skill(entity: entity!, insertInto: context)
        
        newSkill.name = name
        newSkill.text = text
        newSkill.category = Int64(categoryNumber)
        newSkill.creationDate = Date()
        newSkill.timer = Int64(0)
        skills.append(newSkill)

        delegate.saveContext()
        
    }
    
    func getSkills() -> [Skill] {
        return skills
    }
    
    func loadSkills() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        do {
            if let fetchedSkills = try context.fetch(Skill.fetchRequest()) as? [Skill] {
                if !fetchedSkills.isEmpty {
                    skills = fetchedSkills
                }
            }
            
        }
        catch {
            print("Fetch failed")
        }
    }
    
    
    
    
}
