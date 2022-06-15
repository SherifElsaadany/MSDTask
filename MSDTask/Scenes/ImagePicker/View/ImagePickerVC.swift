//
//  ImagePickerVC.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 11/06/2022.
//

import UIKit

class ImagePickerVC: UIImagePickerController {
    
    var pickedImage: UIImage?
    var viewModel: ImagePickerViewModelProtocol?
    weak var pickerDelegate: ImagePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImagePicker()
    }

    func configureImagePicker() {
        self.delegate = self
        self.sourceType = .photoLibrary
    }
}

//MARK: - UIImagePickerControllerDelegate
extension ImagePickerVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            pickedImage = image
            dismiss(animated: false) { [weak self] in
                self?.viewModel?.didPickImage(image.pngData())
                self?.pickerDelegate?.didPickImage(image)
            }
        } else {
            dismiss(animated: true)
        }
    }
}
