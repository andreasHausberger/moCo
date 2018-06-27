//
//  SecondViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 22.04.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var addButton: UIButton!
    
    var diaryModel: DiaryModel = DiaryModel()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryModel.loadDiaries()
        collectionView.dataSource = self
        collectionView.delegate = self
        addButton.layer.cornerRadius = 25
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = self.view.bounds.width - 10
            flowLayout.estimatedItemSize = CGSize (width: width, height: 80)
        }
    }
    
   
    
    func saveDiary(_ diary: DiaryDataObject) {
        diaryModel.saveDiary(diary)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diaryModel.getDiaries().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryCell", for: indexPath) as! DiaryCell
        let diaryDataObject = diaryModel.getDiaries()[indexPath.item]
        cell.setUp(diaryDataObject)
        cell.layer.cornerRadius = 10
        return cell
    }
    
    
    
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DiaryDetailViewController {
            destinationVC.rootVC = self
        }
        
        if let destinationVC = segue.destination as? DiaryReviewController {
            if let cell = sender as? DiaryCell {
                if let diaryDataObject = cell.diaryDataObject {
                    
                    
                    
                    
        
                    destinationVC.setUp(diaryDataObject: diaryDataObject)
                        destinationVC.diaryModel = self.diaryModel
                    }
        
            }
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

