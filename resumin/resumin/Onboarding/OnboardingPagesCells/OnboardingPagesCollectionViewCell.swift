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
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var imageTopDistance: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var onboardingButton: UIButton!
    
    func setupOnboardingPage(page: OnboardingPageModel) {
        imageView.image = page.image
        imageHeight.constant = page.imageBounds.height
        imageWidth.constant = page.imageBounds.width
        imageTopDistance.constant = CGFloat(page.topDistance)
        titleLabel.text = page.title
        descriptionLabel.text = page.description
        onboardingButton.setTitle(page.buttonTitle, for: .normal)
        onboardingButton.layer.cornerRadius = 20
    }

}
