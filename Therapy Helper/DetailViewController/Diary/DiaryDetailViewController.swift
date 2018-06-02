//
//  DiaryDetailViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 30.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class DiaryDetailViewController: UIPageViewController {
    
    var rootVC: DiaryViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        // Do any additional setup after loading the view.
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newDetailVC(storyboardID: "DiaryFormViewController1"),
                self.newDetailVC(storyboardID: "DiaryFormViewController2")]
    }()
    
    private func newDetailVC(storyboardID: String) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyboardID)
        return vc
    }
}

extension DiaryDetailViewController: UIPageViewControllerDataSource {
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

