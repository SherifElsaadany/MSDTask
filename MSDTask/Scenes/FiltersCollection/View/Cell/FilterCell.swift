//
//  FilterCell.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 12/06/2022.
//

import UIKit

class FilterCell: UICollectionViewCell {

    static let identifier = "FilterCell"
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(imageModel: ImageModel?) {
        nameLbl.text = imageModel?.name
        
        if let data = imageModel?.image{
            imageView.image = UIImage(data: data)
        }
    }
    
}
