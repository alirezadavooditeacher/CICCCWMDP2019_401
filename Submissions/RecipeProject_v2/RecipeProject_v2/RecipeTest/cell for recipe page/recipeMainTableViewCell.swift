//
//  recipeMainTableViewCell.swift
//  RecipeTest
//
//  Created by 北島　志帆美 on 2019-11-28.
//  Copyright © 2019 北島　志帆美. All rights reserved.
//

import UIKit
import CHIPageControl


class recipeMainTableViewCell: UITableViewCell {
       
    
    @IBOutlet weak var titleRecipeLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    //@IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageControl: CHIBasePageControl!
    
    
    var numImg = CGFloat(2.0) 
    
       var nameRecipe = ""
       var explaination = ""
       

       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
        titleRecipeLabel.text = "\(nameRecipe)"
        explanationLabel.text = "\(explaination)"
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * numImg, height: scrollView.bounds.height)
        scrollView.isPagingEnabled = true

        pageControl.tintColor = .orange
        // they can be funciton.
       let firstImageView = UIImageView(image: UIImage(named: "breakfast-450x310"))
           firstImageView.frame = CGRect(x: 0.0, y: 0.0, width: scrollView.bounds.width, height: scrollView.bounds.height)
           firstImageView.contentMode = UIView.ContentMode.scaleAspectFit
           scrollView.addSubview(firstImageView)
           
           // 2枚目の画像
           let secondImageView = UIImageView(image: UIImage(named: "images"))
           secondImageView.frame = CGRect(x: scrollView.bounds.width * 1.0, y: 0.0, width: scrollView.bounds.width, height: scrollView.bounds.height)
           secondImageView.contentMode = UIView.ContentMode.scaleAspectFit
           
           scrollView.addSubview(secondImageView)
        
        
        
       }

        
        
       

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }
    
    


}
