//
//  FiltersCollection.swift
//  MSDTask
//
//  Created by Sherif Elsaadany on 11/06/2022.
//

import UIKit

class FiltersCollection: UIView {
    
    var collectionView: UICollectionView?
    var viewModel: FiltersCollectionViewModelProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        createCollectionView()
        configureCollectionView()
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCollectionView()
        configureCollectionView()
        registerCells()
    }
    
    private func createCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        self.collectionView = collectionView
        self.addSubview(collectionView)
        setConstraints(collectionView: collectionView)
    }
    
    private func configureCollectionView() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    private func registerCells() {
        collectionView?.register(UINib(nibName: FilterCell.identifier, bundle: nil), forCellWithReuseIdentifier: FilterCell.identifier)
    }
    
    private func setConstraints(collectionView: UICollectionView) {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func reload() {
        collectionView?.reloadData()
    }
}

//MARK: - UICollectionViewDataSource
extension FiltersCollection: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getNumberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCell.identifier, for: indexPath) as! FilterCell
        viewModel?.onCreateCell(at: indexPath.row) { model in
            DispatchQueue.main.async {
                cell.configure(imageModel: model)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.didSelectCell(at: indexPath.row)
    }
}
