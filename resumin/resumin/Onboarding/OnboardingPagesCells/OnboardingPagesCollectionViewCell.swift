//
//  OnboardingPagesCollectionViewCell.swift
//  resumin
//
//  Created by Robson Novato Lobao on 10/04/22.
//

import UIKit

class OnboardingPagesCollectionViewCell: UICollectionViewCell {
    
    static  let identifier = String(describing: OnboardingPagesCollectionViewCell.self)

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setupOnboardingPage(page: OnboardingPageModel) {
        imageView.image = page.image
        titleLabel.text = page.title
        descriptionLabel.text = page.description
        //descriptionLabel.adjustsFontSizeToFitWidth = true
    }

}
