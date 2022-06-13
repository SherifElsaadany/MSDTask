//
//  ContrastFilter.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 12/06/2022.
//

import Foundation
import GPUImage

class ContrastFilter: ImageFilter {
    
    private var value: Float
    
    init(name: String, value: Float) {
        self.value = value
        super.init(name: name)
        create()
    }
    
    func create() {
        let filter = ContrastAdjustment()
        filter.contrast = value
        self.operation = filter
    }
}
