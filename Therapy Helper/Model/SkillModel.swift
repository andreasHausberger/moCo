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
    
    
    private let documentsDirectory: URL
    private let archiveURL: URL
    
    init() {
        documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        archiveURL = documentsDirectory.appendingPathComponent("saved_skills").appendingPathComponent("plist")
    }
    
    func addSkill(skill: Skill) {
            skills.append(skill)
    }
    
    func getSkills() -> [Skill] {
        return skills
    }
    
    func saveSkills() {
        let propertyListEncoder = PropertyListEncoder()
        let encodedSkills = try? propertyListEncoder.encode(skills)
        
        try? encodedSkills?.write(to: archiveURL, options: .noFileProtection)
        print("save successful!")
    }
    
    func loadSkills() throws {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedSkillsData = try? Data(contentsOf: archiveURL) {
            if let retrievedSkills = try? propertyListDecoder.decode(Array<Skill>.self, from: retrievedSkillsData) {
                skills = retrievedSkills
                print("load successful!")
            }
        }
    }
    
    
}
