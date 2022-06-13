//
//  FilteringViewModelProtocol.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 11/06/2022.
//

import Foundation

protocol FilteringViewModelProtocol: AnyObject {
    func onDidLoad()
    func createFiltersViewModel() -> FiltersCollectionViewModelProtocol?
    func addPhotoTapped()
}
