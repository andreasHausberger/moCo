//
//  DiaryFormCollectionViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 02.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class DiaryFormCollectionViewController: DiaryFormViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var diary: DiaryDataObject?
    var entries: [DiaryEntryDataObject] = [DiaryEntryDataObject]()
     @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryEntryCell", for: indexPath) as! DiaryEntryCell
        let entry = entries[indexPath.item]
        cell.setUp(diaryEntry: entry)
        return cell
    }
    
    @IBAction func addActivity(_ sender: UIButton) {
        
    }
}
