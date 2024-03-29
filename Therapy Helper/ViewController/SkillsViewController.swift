//
//  FirstViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 22.04.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//


import UIKit
import CoreData
import FHIR

class SkillsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var addButton: UIButton!
    
    let skillModel = SkillModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addButton.layer.cornerRadius = 25
        skillModel.loadSkills();
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = self.view.bounds.width - 10
            flowLayout.estimatedItemSize = CGSize (width: width, height: 80)
        }
    }

    
    func addSkillFromCreationSheet(skill: SkillDataObject) {
        self.skillModel.addSkill(skill)
        collectionView.reloadData()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? SkillCell {
            if let skill = cell.skill {
                if let destinationVC = segue.destination as? SkillDetailViewController {
                    
                    destinationVC.setUp(skill: skill)
                }
            }
        }
        else if let destinationVC = segue.destination as? SkillCreationViewController {
            destinationVC.parentVC = self
        }
    }


}

