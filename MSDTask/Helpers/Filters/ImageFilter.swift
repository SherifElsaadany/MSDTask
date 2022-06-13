//
//  ImageFilter.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 12/06/2022.
//

import UIKit
import GPUImage

class ImageFilter {
    var filteredImage: Data?
    var operation: BasicOperation?
    private(set) var name: String
    private var isOperating = false
    
    init(name: String) {
        self.name = name
    }
}

//MARK: - ImageFilterProtocol
extension ImageFilter: ImageFilterProtocol {
    func getFilteredImageObject(of imageData: Data?, completion: @escaping ((ImageModel?) -> Void)) {
        guard !isOperating else {return}
        isOperating = true
        var model = ImageModel()
        model.name = name
        if let image = filteredImage {
            model.image = image
            completion(model)
            isOperating = false
        } else {
            guard let operation = operation, let data = imageData else {
                isOperating = false
                return
            }
            guard let image = UIImage(data: data) else {
                isOperating = false
                return
            }
            DispatchQueue.global(qos: .background).async { [weak self] in
                let filteredImage = image.filterWithOperation(operation).pngData()
                model.image = filteredImage
                self?.filteredImage = filteredImage
                completion(model)
                self?.isOperating = false
            }
        }
    }
}
