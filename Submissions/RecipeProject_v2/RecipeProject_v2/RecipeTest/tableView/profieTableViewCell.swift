//
//  profieTableViewCell.swift
//  RecipeTest
//
//  Created by 北島　志帆美 on 2019-11-22.
//  Copyright © 2019 北島　志帆美. All rights reserved.
//

import UIKit

class profieTableViewCell: UITableViewCell {
    
    let RecipeListCreator = recipeListCreator()


    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var creatorNameLabel: UILabel!
    @IBOutlet weak var numRecipesLabel: UILabel!
    @IBOutlet weak var numFollwersLabel: UILabel!
    
    var numFollwers = 0
    lazy var numRecipes = RecipeListCreator.creatorRecipeLists.count
    
    
    @IBAction func followersAddButton(_ sender: Any) {
        numFollwers += 1
        // how can i show the number when it increase?
    }
    
    
    // this is called when it is initialized.
    override func awakeFromNib() {
        super.awakeFromNib()
        creatorNameLabel.text = "Lay FangYi"
        numFollwersLabel.text = "\(numFollwers) follwers"
        numRecipesLabel.text = "\(numRecipes) recipes"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
