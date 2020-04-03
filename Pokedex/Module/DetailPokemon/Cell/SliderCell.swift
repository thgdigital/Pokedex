//
//  SliderCell.swift
//  Pokedex
//
//  Created by Thiago Vaz on 03/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit
import ImageSlideshow
import SDWebImage

class SliderCell: CollectionViewCell {
    @IBOutlet weak var sliderShow: ImageSlideshow!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populate(sprites: [String], color: UIColor) {
        let images = sprites.map({ SDWebImageSource(urlString: $0)! })
        sliderShow.slideshowInterval = 5.0
        sliderShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)

        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
        pageIndicator.pageIndicatorTintColor = UIColor.black
        sliderShow.pageIndicator = pageIndicator
        sliderShow.backgroundColor = color
        sliderShow.setImageInputs(images)
    }

}
