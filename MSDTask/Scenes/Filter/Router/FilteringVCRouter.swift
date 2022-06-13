//
//  FilteringVCRouter.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 11/06/2022.
//

import UIKit

class FilteringVCRouter {
    
    var vc: UIViewController?
    
    func create() -> UIViewController {
        let vc = FilteringVC()
        let vm = FilteringViewModel(view: vc, router: self)
        vc.viewModel = vm
        self.vc = vc
        return vc
    }
}

//MARK: - FilteringRouterProtocol
extension FilteringVCRouter: FilteringRouterProtocol {
    func presentImagePikcer(viewModel: ImagePickerViewModelProtocol) {
        let picker = ImagePickerVC()
        picker.viewModel = viewModel
        vc?.present(picker, animated: true)
    }
}
