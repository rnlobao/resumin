//
//  EaiTableViewCell.swift
//  resumin
//
//  Created by Robson Novato Lobao on 25/02/22.
//

import UIKit

class EaiTableViewCell: UITableViewCell {

    @IBOutlet var eaiLabel: UILabel!
    func setupStyle() {
        eaiLabel.font = UIFont(name: "Poppins-SemiBold", size: 40)
    }
    
}
