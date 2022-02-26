//
//  CadaUmTableViewCell.swift
//  resumin
//
//  Created by Robson Novato Lobao on 25/02/22.
//

import UIKit

class ResumosTableViewCell: UITableViewCell {

    @IBOutlet var collectionComResumos: UICollectionView!
    
    func setupCollectionView() {
        collectionComResumos.delegate = self
        collectionComResumos.dataSource = self
        collectionComResumos.register(UINib(nibName: "IconsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "icon")

    }
    
}

extension ResumosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "icon", for: indexPath) as! IconsCollectionViewCell
        cell.setupCell(nome: "Livro 1", capa: UIImage(named: "livro1")!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 138)
    }
}


