//
//  CollageLeftView.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 13/06/2022.
//

import UIKit

class CollageLeftView: CollageView {
    
    override func draw(_ rect: CGRect) {
        path = createPath()
        let fillColor = UIColor.white
        fillColor.setFill()
        path.lineWidth = 1.0
        let strokeColor = UIColor.blue
        strokeColor.setStroke()
        path.fill()
        path.stroke()
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = path.cgPath
        self.layer.mask = shapeLayer
        self.layer.masksToBounds = true
    }

    
    func createPath() -> UIBezierPath {
        let path = UIBezierPath()
        let width = self.bounds.width
        let height = self.bounds.height
        
        path.move(to: CGPoint(x: 0 * width, y: 0))
        path.addLine(to: CGPoint(x: 0.65 * width, y: 0))
        path.addLine(to: CGPoint(x: 0.35 * width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.close()
        return path
    }
    
}
