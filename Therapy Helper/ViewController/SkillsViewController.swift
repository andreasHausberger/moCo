//
//  FirstViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 22.04.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit
import CoreData

class SkillsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let skillModel = SkillModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        skillModel.loadSkills();
        
    }
    
    @IBAction func addNewCard(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Skill", message: "Please choose a Skill Category", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        
        var skillCategoryNumber = 0
        var skillName = ""
        var skillText = ""
        
        //trailing closure --> last parameter "handler" is replaced by a closure
        let catMental = UIAlertAction(title: "Mental", style: .default) { _ in
            skillCategoryNumber = 1;
            
            if let name = alert.textFields?[0].text {
                if name != "" {
                    skillName = name
                }
            }
            
            if let text = alert.textFields?[1].text {
                if text != "" {
                    skillText = text
                }
            }
            
            if (skillText != "" && skillName != "") {
                self.skillModel.addSkill(name: skillName, text: skillText, categoryNumber: skillCategoryNumber)
                self.collectionView.reloadData()
            }
            
        }
        
        let catPhysical = UIAlertAction(title: "Physical", style: .default) { _ in
            skillCategoryNumber = 2;
            
            if let name = alert.textFields?[0].text {
                if name != "" {
                    skillName = name
                }
            }
            
            if let text = alert.textFields?[1].text {
                if text != "" {
                    skillText = text
                }
            }
            
            if (skillText != "" && skillName != "") {
                self.skillModel.addSkill(name: skillName, text: skillText, categoryNumber: skillCategoryNumber)
                self.collectionView.reloadData()
            }
        }
        
        alert.addAction(catMental)
        alert.addAction(catPhysical)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
        
    
    
    
    
    
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skillModel.getSkills().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SkillCell", for: indexPath) as! SkillCell
        if (!skillModel.getSkills().isEmpty) {
            // let card = model.cards[indexPath.item]
            let skill = skillModel.getSkills()[indexPath.item]
            cell.configureContent(from: skill)
            
            cell.layer.cornerRadius = 10
        }
        return cell
    }


}

