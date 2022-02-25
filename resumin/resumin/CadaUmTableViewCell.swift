//
//  CadaUmTableViewCell.swift
//  resumin
//
//  Created by Robson Novato Lobao on 25/02/22.
//

import UIKit

class CadaUmTableViewCell: UITableViewCell {

    @IBOutlet var labelFromResumo: UILabel!
    
    func setupCell(input: String) {
        labelFromResumo.text = input
    }
    
}
