//
//  ResumosViewController.swift
//  resumin
//
//  Created by Robson Novato Lobao on 24/02/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var bookOfTheDayTitle: UILabel!
    @IBOutlet weak var bookOfTheDayCover: UIImageView!
    @IBOutlet weak var bookOfTheDayView: UIView!
    @IBOutlet weak var booksCollectionView: UICollectionView!
    @IBOutlet weak var booksStackViewHeight: NSLayoutConstraint!
    var allBooks: [BooksModel] = []
    var viewModel = HomeViewModel()
    var resumo = "Contrary to popular belief, Lorem Ipsum is not simply rando  you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It u"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBooks()
        setupBookOfTheDay()
        setupCollectionView()
        setupBooksStackViewHeight()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.pushViewController(OnboardingViewController(), animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupBookOfTheDay() {
        bookOfTheDayView.layer.cornerRadius = 18
        bookOfTheDayCover.layer.cornerRadius = 18
        bookOfTheDayTitle.adjustsFontSizeToFitWidth = true
        let booksOfTheDay = viewModel.bookOfTheDay()
        bookOfTheDayTitle.text = booksOfTheDay.nome
        bookOfTheDayCover.image = UIImage(named: booksOfTheDay.capa)
    }
    
    func setupCollectionView() {
        booksCollectionView.delegate = self
        booksCollectionView.dataSource = self
        booksCollectionView.register(UINib(nibName: "IconsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "icon")
    }
    
    func setupBooksStackViewHeight() {
        var definedHeight = 0
        if allBooks.count % 3 == 0 {
            definedHeight = (allBooks.count / 3) * 145
        } else {
            definedHeight = ((allBooks.count / 3) + 1) * 145
        }
        booksStackViewHeight.constant = CGFloat(definedHeight)
    }
    
    
    func setupBooks() {
        allBooks = [
            BooksModel(nome: "Livro 1", capa: "livro1", resumo: resumo),
            BooksModel(nome: "Livro 1", capa: "livro1", resumo: resumo),
            BooksModel(nome: "Livro 1", capa: "livro1", resumo: resumo),
            BooksModel(nome: "Livro 1", capa: "livro1", resumo: resumo),
            BooksModel(nome: "Livro 1", capa: "livro1", resumo: resumo),
            BooksModel(nome: "Livro 1", capa: "livro1", resumo: resumo),
            BooksModel(nome: "Livro 1", capa: "livro1", resumo: resumo),
            BooksModel(nome: "Livro 1", capa: "livro1", resumo: resumo)
        ]
    }
    

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "icon", for: indexPath) as! IconsCollectionViewCell
        cell.setupCell(nome: allBooks[indexPath.row].nome, capa: UIImage(named: allBooks[indexPath.row].capa)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 138)
    }
}
