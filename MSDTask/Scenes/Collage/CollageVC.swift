//
//  CollageVC.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 13/06/2022.
//

import UIKit

class CollageVC: UIViewController {
    
    let safeView = UIView()
    var collageViews = [CollageView]()
    var touchedView: CollageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSafeView()
        addCollageView(CollageLeftView())
        addCollageView(CollageRightView())
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(event)
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        handleTouch(touch)
    }
    
    private func  handleTouch(_ touch: UITouch?) {
        guard let position = touch?.location(in: view) else {return}
        print("touchesBegan \(position)")
        let touchedView = collageViews.filter({
            $0.path.contains(position)
        })
        
        self.touchedView = touchedView.first
        guard let _ = touchedView.first else {return}
        showImagePicker()
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
        
        self.collageViews.append(view)
    }
    
    private func showImagePicker() {
        let picker = ImagePickerVC()
        picker.pickerDelegate = self
        self.present(picker, animated: true)
    }
}

//MARK: - ImagePickerDelegate
extension CollageVC: ImagePickerDelegate {
    func didPickImage(_ image: UIImage) {
        touchedView?.setImage(image)
    }
}
