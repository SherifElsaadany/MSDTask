//
//  HomeVC.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 13/06/2022.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func filterTapped(_ sender: Any) {
        let vc = FilteringVCRouter().create()
        self.present(vc, animated: true)
    }
    
    @IBAction func collageTapped(_ sender: Any) {
        let vc = CollageVC()
        self.present(vc, animated: true)
    }
    
}
