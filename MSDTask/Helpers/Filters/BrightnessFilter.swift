//
//  BrightnessFilter.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 12/06/2022.
//

import Foundation
import GPUImage

class BrightnessFilter: ImageFilter {
    
    private var value: Float
    
    init(name: String, value: Float) {
        self.value = value
        super.init(name: name)
        create()
    }
    
    func create() {
        let filter = BrightnessAdjustment()
        filter.brightness = value
        self.operation = filter
    }
}
