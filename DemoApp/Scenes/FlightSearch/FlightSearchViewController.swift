//
//  FlightSearchViewController.swift
//  DemoApp
//
//  Created by Duy  Tran on 06/05/2022.
//

import UIKit

class FlightSearchViewController: UIViewController {

    enum TabIndex : Int {
        case firstChildTab = 0
        case secondChildTab = 1
        case thirdChiltab = 2
    }
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var segment: TabySegmentedControl!
    var currentViewController: UIViewController?
    lazy var firstChildTabVC: UIViewController? = {
        let firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "KhuHoiViewController")
        return firstChildTabVC
    }()
    lazy var secondChildTabVC : UIViewController? = {
        let secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "MotChieuViewController")
        
        return secondChildTabVC
    }()
    lazy var thirdChildTabVC : UIViewController? = {
        let thirdChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "KhuHoiViewController")
        
        return thirdChildTabVC
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segment.initUI()
        segment.selectedSegmentIndex = TabIndex.firstChildTab.rawValue
        displayCurrentTab(TabIndex.firstChildTab.rawValue)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
    
    @IBAction func touchSegment(_ sender: UISegmentedControl) {
        self.currentViewController?.view.removeFromSuperview()
        self.currentViewController?.removeFromParent()
        
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    
    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            
            self.addChild(vc)
            vc.didMove(toParent: self)
            
            vc.view.frame = self.contentView.bounds
            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.firstChildTab.rawValue :
            vc = firstChildTabVC
        case TabIndex.secondChildTab.rawValue :
            vc = secondChildTabVC
        case TabIndex.thirdChiltab.rawValue :
            vc = thirdChildTabVC
        default:
        return nil
        }
    
        return vc
    }

    
}

