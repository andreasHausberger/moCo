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
    
    let model: CardModel = CardModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addNewCard(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Card", message: "Please enter information to add a new Card", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        
        //optional declaration of
        var title: String?
        var description: String?
        
        //trailing closure --> last parameter "handler" is replaced by a closure
        let send = UIAlertAction(title: "Send", style: .default) { _ in
            if let textField1 = alert.textFields?[0] {
                if let inputTitle = textField1.text {
                    title = inputTitle
                }
            }
            
            if let textField2 = alert.textFields?[1] {
                if let inputDescription = textField2.text {
                    description = inputDescription
                }
            }
            
            if (title != "" && description != "") {
                self.sendCard(title: title!, description: description!)
                self.collectionView.reloadData();
            }
        }
        
        alert.addAction(send)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
        
    
    
    private func sendCard(title: String, description: String) {
        let card = TestCard(title: title, description: description)
        model.addCard(card: card)
    }
    
    
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        if (!model.cards.isEmpty) {
            let card = model.cards[indexPath.item]
            
            cell.displayContent(card: card)
        }
        return cell
    }


}

