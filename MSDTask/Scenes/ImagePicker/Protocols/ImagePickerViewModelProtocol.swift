//
//  ImagePickerViewModelProtocol.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 12/06/2022.
//

import Foundation
import UIKit

protocol ImagePickerViewModelProtocol: AnyObject {
    func didPickImage(_ data:  Data?)
}

protocol ImagePickerDelegate: AnyObject {
    func didPickImage(_ image: UIImage)
}
