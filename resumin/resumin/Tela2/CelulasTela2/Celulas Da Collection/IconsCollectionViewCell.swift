//
//  IconsCollectionViewCell.swift
//  resumin
//
//  Created by Robson Novato Lobao on 25/02/22.
//

import UIKit

class IconsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var nomeDoLivro: UILabel!
    @IBOutlet var capaDoLivro: UIImageView!
    
    func setupCell(nome: String, capa: UIImage) {
        capaDoLivro.layer.masksToBounds = false
        capaDoLivro.layer.cornerRadius = capaDoLivro.frame.height / 2
        capaDoLivro.clipsToBounds = true
        capaDoLivro.contentMode = .scaleToFill
        nomeDoLivro.text = nome
        capaDoLivro.image = capa
    }

}
