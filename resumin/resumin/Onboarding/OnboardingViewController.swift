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
    @IBOutlet weak var onboardingButton: UIButton!
    var onboardingPage: [OnboardingPageModel] = []
    var currentPage = 0 {
        didSet {
            let titleProximo = NSMutableAttributedString(string: "Próximo", attributes: [
                NSAttributedString.Key.font: UIFont(name: "Poppins-SemiBold", size: 20)!,
            ])
            let titleEntrar = NSMutableAttributedString(string: "Entrar", attributes: [
                NSAttributedString.Key.font: UIFont(name: "Poppins-SemiBold", size: 20)!,
            ])
            
            if currentPage == onboardingPage.count - 1 {
                onboardingButton.setAttributedTitle(titleEntrar, for: .normal)
            } else {
                onboardingButton.setAttributedTitle(titleProximo, for: .normal)

            }
            pageControl.currentPage = currentPage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupPages()
        setupDefaultButton()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "OnboardingPagesCollectionViewCell", bundle: Bundle(for: OnboardingViewController.self)), forCellWithReuseIdentifier: "OnboardingPagesCollectionViewCell")
    }

    private func setupPages() {
        onboardingPage = [
            OnboardingPageModel(title: "Leia de qualquer lugar!", description: "Baixe seus livros favoritos e aproveite a vontade :)", image: UIImage(named: "barberBook")!),
            OnboardingPageModel(title: "Todas as melhores ideias na palma da sua mão.", description: "10 minutos, tudo que é necessário para se manter informado.", image: UIImage(named: "girlReadingBook")!),
            OnboardingPageModel(title: "Seja o mais sábio da sua rodinha de amigos", description: "Máxima efetividade pelo seu tempo de dedicação.", image: UIImage(named: "boyAndPhone")!)
        ]
    }
    
    @IBAction func buttonAction(_ sender: Any) {
    }
    
    private func setupDefaultButton() {
        onboardingButton.layer.cornerRadius = 20
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
