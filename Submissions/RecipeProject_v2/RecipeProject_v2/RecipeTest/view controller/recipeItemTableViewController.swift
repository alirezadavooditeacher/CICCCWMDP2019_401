//
//  recipeItemTableViewController.swift
//  RecipeTest
//
//  Created by 北島　志帆美 on 2019-11-27.
//  Copyright © 2019 北島　志帆美. All rights reserved.
//

import UIKit
import CHIPageControl


class recipeItemTableViewController: UITableViewController {
    
    let identifiers = [1: "recipeMainCell", 2:"iconItem", 3:"creatorCellRecpipe", 4:"ingredients", 5: "how to cook"]

    var numImg = CGFloat(2.0) // depends on how many pictures user want to use, it is gonna change.
    
    let ingredients = IngredientsList()
    let howToCookList = HowToCookList()
    
    

    enum Direction {
       case left
       case right
    
       func newProgress(withCurrentProgress current: Int) -> Int {
           switch self {
           case .left:
               return current - 1
           case .right:
               return current + 1
           }
        
        }
    }
    
       
       override func viewDidLoad() {
           super.viewDidLoad()
        
        
           // Do any additional setup after loading the view.
       }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0, 1, 2 :
            return 1
        case 3:
            return  ingredients.ingredientsList.count// this is for the number of ingredients
        case 4:
            return howToCookList.howToCookList.count // this shows how to cook.
        default:
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
              case 0:
                  return 500
//            return UITableView.automaticDimension
              case 1:
                  return 50 // this is for the number of ingredients
              case 2:
                  return 78 // this shows how to cook.
              default:
                return UITableView.automaticDimension
              }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 || section == 2 {
            return 0.0
        }
        else {
            return 40.0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell : recipeMainTableViewCell =  (tableView.dequeueReusableCell(withIdentifier:"recipeMainCell") as? recipeMainTableViewCell)!
            
            //let _ = RecipeListCreator.creatorRecipeLists[indexPath.row]
            
            // 1枚目の画像
            let firstImageView = UIImageView(image: UIImage(named: "breakfast-450x310"))
            firstImageView.frame = CGRect(x: 0.0, y: 0.0, width: cell.scrollView.bounds.width, height: cell.scrollView.bounds.height)
            firstImageView.contentMode = UIView.ContentMode.scaleAspectFit
            cell.scrollView.addSubview(firstImageView)

                   // 2枚目の画像r
            let secondImageView = UIImageView(image: UIImage(named: "images"))
            secondImageView.frame = CGRect(x: cell.scrollView.bounds.width * 1.0, y: 0.0, width: cell.scrollView.bounds.width, height: cell.scrollView.bounds.height)
            secondImageView.contentMode = UIView.ContentMode.scaleAspectFit
                   
            cell.scrollView.addSubview(secondImageView)
            
            
            // page controll
            var direction = Direction.right
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                
                cell.pageControl.numberOfPages = Int(self.numImg)
             
                let currentProgress = Int(cell.pageControl.progress)
                let numberOfPages = cell.pageControl.numberOfPages
                   
                if currentProgress == numberOfPages - 1 {
                    direction = .left
                }
                else if currentProgress == 0 {
                    direction = .right
                }
                let newProgress = direction.newProgress(withCurrentProgress: currentProgress)
                //self.pageControl.set(progress: newProgress, animated: true)
                cell.pageControl.set(progress: newProgress, animated: true)
            }
            
            
            cell.titleRecipeLabel.text = "Chinese Restaurant-Style Sautéed Green Beans"
            cell.explanationLabel.text = "I've made these over and over, and it doesn't seem to matter how many I make, they disappear! The beans do shrivel considerable, but people also love them, so make far more than you think you'll eat. Huge hit!"
            
            
            return cell
                    
                }
        else if indexPath.section == 1 {
            let cell: iconItemTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "iconItem") as? iconItemTableViewCell)!
            
            cell.numLikeLabel.text = "11"
            
            return cell
            
        }
        else if indexPath.section == 2 {
            let cell: creatorCellRecpipeTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "creatorCellRecpipe") as? creatorCellRecpipeTableViewCell)!
            
            cell.creatorNameLabel.text = "Risa Takata"
            return cell
        }
        else if indexPath.section == 3 {
            let cell: IngredientsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "ingredients") as? IngredientsTableViewCell)!
            
            let _ = ingredients.ingredientsList[indexPath.row]
            
            cell.ingredientsNameLabel.text =  ingredients.ingredientsList[indexPath.row].ingredientName
            cell.amountIngredientsLabel.text = ingredients.ingredientsList[indexPath.row].amountIngredient
            return cell
        }
        else {
            let cell: HowToCookTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "how to cook") as? HowToCookTableViewCell)!
            
            let _ = howToCookList.howToCookList[indexPath.row]
            
            cell.howToCookLabel.text =  howToCookList.howToCookList[indexPath.row].howToCook
            cell.howToCookLabel.text = howToCookList.howToCookList[indexPath.row].howToCook
            
            return cell
        }
       
                
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 0, width:
        tableView.bounds.size.width, height: 28))
        headerLabel.textColor = UIColor.black
        
        headerLabel.textAlignment = .left
        
        
        let view:UIView = UIView(frame: CGRect(x: 0,y: 0,width: self.tableView.frame.size.width,height: 40.0))
        if section == 0 || section == 1 || section == 2 {
            return view
        }
        else if section == 3 {
            view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.768627451, blue: 0.4431372549, alpha: 1)
            // how can I set color of text?
        
            view.addSubview(headerLabel)
            headerLabel.text = "Ingredients"
            headerLabel.sizeToFit()
            headerLabel.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            headerLabel.frame.origin.y = view.frame.size.height/2-headerLabel.frame.size.height/2
            //headerLabel.frame.origin.y = view.frame.size.height/2
            //view.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor).isActive = true
            return view
        }
        else if section == 4 {
            view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.768627451, blue: 0.4431372549, alpha: 1)
            // how can I set color of text?
        
            view.addSubview(headerLabel)
            headerLabel.text = "How to Cook"
            headerLabel.sizeToFit()
            headerLabel.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            headerLabel.frame.origin.y = view.frame.size.height/2-headerLabel.frame.size.height/2
            //headerLabel.frame.origin.y = view.frame.size.height/2
            //view.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor).isActive = true
            return view
        }
        
        return view
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
