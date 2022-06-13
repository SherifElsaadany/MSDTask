//
//  FiltersCollectionViewModelProtocol.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 12/06/2022.
//

import Foundation
import UIKit

protocol FiltersCollectionViewModelProtocol: AnyObject {
    func getNumberOfItems() -> Int
    func onCreateCell(at index: Int, completion: @escaping ((ImageModel?) -> Void))
    func didSelectCell(at index: Int)
}
