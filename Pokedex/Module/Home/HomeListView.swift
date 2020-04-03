//
//  HomeListView.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class HomeListView: UICollectionViewController {
    
    var presenter: HomePresenterInput!
    
    var items: [HomePokemonItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updateView()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        let nibName = UINib(nibName: "HomePokemonCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: HomePokemonCell.identifier)
        let nibNameLoadingCell = UINib(nibName: "LoadingCell", bundle: nil)
        collectionView.register(nibNameLoadingCell, forCellWithReuseIdentifier: LoadingCell.identifier)
    }
    
}

extension HomeListView:  UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if items[indexPath.row] is HomePokemonItemLoading {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCell.identifier, for: indexPath) as! LoadingCell
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePokemonCell.identifier, for: indexPath) as! HomePokemonCell
            cell.populate(item: items[indexPath.row])
            cell.shadowDecorate()
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if items[indexPath.row] is HomePokemonItemLoading, presenter.finishPagination  {
            return .zero
        }
        
        return CGSize(width: (UIScreen.main.bounds.width / 2) - 5, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelected(with: indexPath.row)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if cell is LoadingCell, !presenter.finishPagination {
            presenter.paginate()
        }
    }
}

extension HomeListView: HomePresenterOuput {
    
    func navigationTitle(with name: String) {
        title = name
    }
    
    func fetched(items: [HomePokemonItem]) {
        self.items.append(contentsOf: items)
        collectionView.reloadData()
    }
    
    func fetched(paginate: [HomePokemonItem]) {
        self.items = paginate
        collectionView.reloadItemsInSection(sectionIndex: 0, newCount: self.items.count) {
            let indexPathsForVisibleItems = self.collectionView.indexPathsForVisibleItems
            if !self.presenter.finishPagination {
                self.collectionView.reloadItems(at: indexPathsForVisibleItems)
            }
        }
    }
    
    
    func loading() {
        
    }
    
    func stopLoading() {
        
    }
}

