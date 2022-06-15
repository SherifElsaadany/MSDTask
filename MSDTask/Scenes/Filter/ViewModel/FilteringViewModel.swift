//
//  FilteringViewModel.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 11/06/2022.
//

import Foundation
import UIKit

class FilteringViewModel {
    
    var view: FilteringVCProtocol?
    var router: FilteringRouterProtocol?
    
    var filters: [ImageFilterProtocol]? {
        didSet {
            view?.updateFilters()
        }
    }
    
    private(set) var originalImageData: Data? {
        didSet {
            view?.updateImageView(originalImageData, reloadCollection: true)
        }
    }
    
    var filteredImage: Data? {
        didSet {
            view?.updateImageView(filteredImage, reloadCollection: false)
        }
    }
    
    init(view: FilteringVCProtocol, router: FilteringRouterProtocol) {
        self.view = view
        self.router = router
    }
}

//MARK: - FilteringViewModelProtocol
extension FilteringViewModel: FilteringViewModelProtocol {
    func onDidLoad() {
        filters = FiltersCreator().create()
    }
    
    func addPhotoTapped() {
        router?.presentImagePikcer(viewModel: self)
    }
    
    func createFiltersViewModel() -> FiltersCollectionViewModelProtocol? {
        return self
    }
    
}

//MARK: - FiltersCollectionViewProtocol
extension FilteringViewModel: FiltersCollectionViewModelProtocol {
    func getNumberOfItems() -> Int {
        return filters?.count ?? 0
    }
    
    func onCreateCell(at index: Int, completion: @escaping ((ImageModel?) -> Void)) {
        filters?[index].getFilteredImageObject(of: originalImageData) { model  in
            completion(model)
        }
    }
    
    func didSelectCell(at index: Int) {
        filters?[index].getFilteredImageObject(of: originalImageData) { [weak self] model in
            self?.filteredImage = model?.image
        }
    }
}

//MARK: - ImagePickerViewModelProtocol
extension FilteringViewModel: ImagePickerViewModelProtocol {
    func didPickImage(_ data: Data?) {
        originalImageData = data
    }
}
