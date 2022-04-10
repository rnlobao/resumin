//
//  OnboardingViewController.swift
//  resumin
//
//  Created by Robson Novato Lobao on 10/04/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var onboardingPage: [OnboardingPageModel] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupPages()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "OnboardingPagesCollectionViewCell", bundle: Bundle(for: OnboardingViewController.self)), forCellWithReuseIdentifier: "OnboardingPagesCollectionViewCell")
    }

    func setupPages() {
        onboardingPage = [
            OnboardingPageModel(title: "Leia de qualquer lugar!", description: "Baixe seus livros favoritos e aproveite a vontade :)", image: UIImage(named: "barberBook")!, imageBounds: CGSize(width: 391, height: 248), buttonTitle: "Próximo", topDistance: 120),
            OnboardingPageModel(title: "Todas as melhores ideias na palma da sua mão.", description: "10 minutos, tudo que é necessário para se manter informado.", image: UIImage(named: "girlReadingBook")!, imageBounds: CGSize(width: 312, height: 322), buttonTitle: "Próximo", topDistance: 52),
            OnboardingPageModel(title: "Seja o mais sábio da sua rodinha de amigos", description: "Máxima efetividade pelo seu tempo de dedicação.", image: UIImage(named: "boyAndPhone")!, imageBounds: CGSize(width: 312, height: 281), buttonTitle: "Entrar", topDistance: 68)
        ]
    }

    

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingPagesCollectionViewCell.identifier, for: indexPath) as! OnboardingPagesCollectionViewCell
        cell.setupOnboardingPage(page: onboardingPage[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingPage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
