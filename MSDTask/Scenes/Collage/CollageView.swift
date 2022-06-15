//
//  CollageView.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 13/06/2022.
//

import UIKit

class CollageView: UIView {
    
    private let imageView = UIImageView()
    var path = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addImageView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setImage(_ image: UIImage) {
        self.imageView.image = image
    }
}
