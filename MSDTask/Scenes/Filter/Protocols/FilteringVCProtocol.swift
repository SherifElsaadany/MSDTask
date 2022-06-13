//
//  FilteringVCProtocol.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 11/06/2022.
//

import Foundation

protocol FilteringVCProtocol: AnyObject {
    func updateImageView(_ data: Data?)
    func updateFilters()
}
