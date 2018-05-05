//
//  FirstViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 22.04.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let skillModel = SkillModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addNewCard(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Skill", message: "Please choose a Skill Category", preferredStyle: .alert)
        
        //trailing closure --> last parameter "handler" is replaced by a closure
        let catMental = UIAlertAction(title: "Mental", style: .default) { _ in
            self.addSkill(categoryNumber: 1)
        }
        
        let catPhysical = UIAlertAction(title: "Physical", style: .default) { _ in
            self.addSkill(categoryNumber: 2)
        }
        
        alert.addAction(catMental)
        alert.addAction(catPhysical)
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
        
    
    
    private func addSkill(categoryNumber: Int) {
        let skill = Skill(name: "Test", text: "Lorem Ipsum Dolor Sit Amet", timer: 5, creationDate: Date(), categoryNumber: categoryNumber)
        skillModel.addSkill(skill: skill)
        self.collectionView.reloadData()
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

