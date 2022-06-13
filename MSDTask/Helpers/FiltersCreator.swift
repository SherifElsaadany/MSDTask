//
//  FiltersCreator.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 12/06/2022.
//

import Foundation

struct FiltersCreator {
    
    func create() -> [ImageFilterProtocol] {
        var filters = [ImageFilterProtocol]()
        
        filters.append(BrightnessFilter(name: "Low Brightness", value: 0.3))
        filters.append(BrightnessFilter(name: "Medium Brightness", value: 0.5))
        filters.append(BrightnessFilter(name: "High Brightness", value: 0.8))
        filters.append(ContrastFilter(name: "Low Contrast", value: 0.1))
        filters.append(ContrastFilter(name: "Medium Contrast", value: 0.5))
        filters.append(ContrastFilter(name: "High Contrast", value: 1))
        filters.append(SaturationFilter(name: "Low Saturation", value: 0.5))
        filters.append(SaturationFilter(name: "Medium Saturation", value: 1))
        filters.append(SaturationFilter(name: "High Saturation", value: 2))
        filters.append(HueFilter(name: "Low Hue", value: 0.5))
        filters.append(HueFilter(name: "Medium Hue", value: 1.5))
        filters.append(HueFilter(name: "High Hue", value: 3))
        filters.append(SketchingFilter(name: "Light Edges", value: 0.5))
        filters.append(SketchingFilter(name: "Medium Edges", value: 1.5))
        filters.append(SketchingFilter(name: "Thick Edges", value: 3))
        
        return filters
    }
}
