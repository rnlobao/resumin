//
//  LivroDoDiaTableViewCell.swift
//  resumin
//
//  Created by Robson Novato Lobao on 25/02/22.
//

import UIKit

class LivroDoDiaTableViewCell: UITableViewCell {

    @IBOutlet var livroDoDiaView: UIView!
    @IBOutlet var capaDoLivro: UIImageView!
    @IBOutlet var nomeDoLivro: UILabel!
    
    func setupResumoDoDia(inputNomeDoLivro: String) {
        livroDoDiaView.layer.cornerRadius = 18
        capaDoLivro.layer.cornerRadius = 18
        nomeDoLivro.adjustsFontSizeToFitWidth = true
        nomeDoLivro.text = inputNomeDoLivro
        capaDoLivro.image = UIImage(named: "livro1")
    }
   
    
}
