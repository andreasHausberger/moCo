//
//  SecondViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 22.04.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var diaryModel: DiaryModel = DiaryModel()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func saveDiary(_ diary: DiaryDataObject) {
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryCell", for: indexPath) as! DiaryCell
        let diaryDataObject = diaryModel.getDiaries()[indexPath.item]
        cell.setUp(diaryDataObject)
        return cell
    }
}

