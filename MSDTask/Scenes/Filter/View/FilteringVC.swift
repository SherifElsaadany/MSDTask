//
//  FilteringVC.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 11/06/2022.
//

import UIKit

class FilteringVC: UIViewController {
    
    var viewModel: FilteringViewModelProtocol?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var filtersCollection: FiltersCollection!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFiltersCollection()
        viewModel?.onDidLoad()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        viewModel?.addPhotoTapped()
    }
    
    private func handleImageSelection(_ data: Data?) {
        guard let data = data else {return}
        imageView.image = UIImage(data: data)
        addBtn.isHidden = true
        filtersCollection.isHidden = false
    }
    
    private func configureFiltersCollection() {
        filtersCollection.viewModel = viewModel?.createFiltersViewModel()
    }
}

//MARK: - FilteringVCProtocol
extension FilteringVC: FilteringVCProtocol {
    
    func updateFilters() {
        filtersCollection.reload()
    }
    
    func updateImageView(_ data: Data?, reloadCollection: Bool) {
        handleImageSelection(data)
        if reloadCollection {
            filtersCollection.reload()
        }
    }
}
