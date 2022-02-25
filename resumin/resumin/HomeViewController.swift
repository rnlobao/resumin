//
//  ViewController.swift
//  resumin
//
//  Created by Robson Novato Lobao on 24/02/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var enterButton: UIButton! {
        didSet {
            enterButton.layer.cornerRadius = 20
        }
    }
    @IBAction func sendHandler(_ sender: Any) {
        navigationController?.pushViewController(ResumosViewController(), animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
