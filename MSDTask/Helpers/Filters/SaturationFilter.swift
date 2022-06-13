//
//  SaturationFilter.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 12/06/2022.
//

import Foundation
import GPUImage

class SaturationFilter: ImageFilter {
    
    private var value: Float
    
    init(name: String, value: Float) {
        self.value = value
        super.init(name: name)
        create()
    }
    
    func create() {
        let filter = SaturationAdjustment()
        filter.saturation = value
        self.operation = filter
    }
}
