//
//  CollageVC.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 13/06/2022.
//

import UIKit

class CollageVC: UIViewController {
    
    let safeView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSafeView()
        addCollageView(CollageLeftView())
        addCollageView(CollageRightView())
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let view = touch?.view as? CollageView {
            print(view)
            view.imageView.image = UIImage(named: "image")
        }
    }
    
    func addSafeView() {
        let margins = self.view.layoutMarginsGuide
        safeView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(safeView)
        
        NSLayoutConstraint.activate([
            safeView.topAnchor.constraint(equalTo: margins.topAnchor),
            safeView.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            safeView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            safeView.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
        ])
    }
    
    func addCollageView(_ view: CollageView) {
        let margins = self.safeView
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: margins.topAnchor),
            view.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            view.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            view.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
        ])
    }
}
