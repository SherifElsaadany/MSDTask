//
//  ImageFilterProtocol.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 12/06/2022.
//

import Foundation
import UIKit

protocol ImageFilterProtocol {
    func getFilteredImageObject(of imageData: Data?, completion: @escaping ((ImageModel?) -> Void))
}
