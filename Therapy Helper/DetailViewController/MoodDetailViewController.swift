//
//  MoodDetailViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 11.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class MoodDetailViewController: UIPageViewController {
    
    var rootVC: MoodsViewController?
    
    var physicalScore: Double = 5
    var mentalScore: Double = 5
    var optimismScore: Double = 5
    var text: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let firstVC = orderedViewControllers.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func createMood() {
        if rootVC != nil {
            let moodDataObject = MoodDataObject(mental_wellbeing: self.mentalScore, physical_wellbeing: self.physicalScore, optimism: self.optimismScore, text: self.text, creationDate: Date())
            rootVC?.saveMood(moodDataObject)
        }
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newDetailVC(storyboardID: "MoodDetailView1"), self.newDetailVC(storyboardID: "MoodDetailView2")]
    }()

    
    private func newDetailVC(storyboardID: String) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyboardID)
        
        if vc.restorationIdentifier == "MoodDetailView1" {
           
        }
        return vc
    }

}

extension MoodDetailViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        guard orderedViewControllers.count > previousIndex else { return nil }
        
        return orderedViewControllers[previousIndex]
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < orderedViewControllers.count else { return nil }
        
        return orderedViewControllers[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else { return 0 }
        
        return firstViewControllerIndex
    }
}
