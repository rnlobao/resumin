//
//  ResumosViewController.swift
//  resumin
//
//  Created by Robson Novato Lobao on 24/02/22.
//

import UIKit

class ResumosViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CadaUmTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "resumos")
        tableView.register(UINib(nibName: "EaiTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "eai")
        tableView.register(UINib(nibName: "LivroDoDiaTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "livrododia")
        tableView.register(UINib(nibName: "TextoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "textotodos")
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

}

extension ResumosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "eai") as! EaiTableViewCell
            cell.setupStyle()
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "livrododia") as! LivroDoDiaTableViewCell
            cell.setupResumoDoDia(inputNomeDoLivro: "Homem mais rico da babilonia")
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textotodos") as! TextoTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "resumos") as! ResumosTableViewCell
        cell.setupCollectionView()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 71
        }
        if indexPath.row == 1 {
            return 150
        }
        if indexPath.row == 2 {
            return 148
        }
        return 500
    }
}