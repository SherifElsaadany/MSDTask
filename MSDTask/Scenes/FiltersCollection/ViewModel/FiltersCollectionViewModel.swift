//
//  FiltersCollectionViewModel.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 11/06/2022.
//

import Foundation

class FiltersCollectionViewModel: FilteringViewModel {
    
    var collectionView: FiltersCollectionViewProtocol?
    
    init(view: FilteringVCProtocol, router: FilteringRouterProtocol, collectionView: FiltersCollectionViewProtocol) {
        self.collectionView = collectionView
        super.init(view: view, router: router)
    }
}
