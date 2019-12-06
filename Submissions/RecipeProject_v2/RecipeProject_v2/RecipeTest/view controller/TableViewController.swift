//
//  TableViewController.swift
//  RecipeTest
//
//  Created by 北島　志帆美 on 2019-11-19.
//  Copyright © 2019 北島　志帆美. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let RecipeListCreator = recipeListCreator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "recipeItem")
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "creatorsProfie")
        
        let app = UINavigationBarAppearance()
        //        tableView.rowHeight = 100.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        } else if section == 1 {
            return RecipeListCreator.creatorRecipeLists.count
        } else {
            return 0
        }
    }
    
    
    
    // about deta the cell has
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            let cell : recipeListCreatorItemTableViewCell =  (tableView.dequeueReusableCell(withIdentifier: "recipeItem") as? recipeListCreatorItemTableViewCell)!
            
            //            if cell==nil {
            //                cell = UITableViewCell(style: .default, reuseIdentifier: "recipeItem")
            //            }
            //
            
            let _ = RecipeListCreator.creatorRecipeLists[indexPath.row]
            
            //              if let label1000 = cell!.viewWithTag(1000) as? UILabel {
            //                  label1000.text = RecipeListCreator.creatorRecipeLists[indexPath.row].textTest
            //              }
            
            cell.nameRecipeLabel.text =  RecipeListCreator.creatorRecipeLists[indexPath.row].nameRecipe
            
            //tableView.deselectRow(at: indexPath, animated: true)
            //cell.backgroundColor = .green
            
            return cell
            
        } else {
            
            let cell = (tableView.dequeueReusableCell(withIdentifier: "creatorsProfie") as? profieTableViewCell)!
            
            
            
            cell.imgView.image = UIImage(named: "download (1)")
            cell.imgView.layer.masksToBounds = false
            cell.imgView.layer.cornerRadius = 112.5
            cell.imgView.clipsToBounds = true
            
            
            return cell
        }
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // tableView.cellForRow(at: indexPath) means it return the cell user tapped
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = RecipeListCreator.creatorRecipeLists[indexPath.row]
            // tableView.deselectRow(at: indexPath, animated: true) stop highlighting the cell after user release finger.
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        //RecipeListCreator.creatorRecipeLists.remove(at: indexPath.row)
    //        let indexPaths = [indexPath]
    //        tableView.deleteRows(at: indexPaths, with: .automatic)
    //    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 500.0
        }
        else if indexPath.section == 1 {
            return 150.0
        }
        return 400.0
    }
    
    
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        if section == 0 {
    //            return "xfsdsd"
    //        } else {
    //            return "Recipe"
    //        }
    //    }
    //
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10.0
        } else {
            return 40.0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 0, width:
            tableView.bounds.size.width, height: 28))
        headerLabel.textColor = UIColor.black
        
        headerLabel.textAlignment = .left
        
        
        let view:UIView = UIView(frame: CGRect(x: 0,y: 0,width: self.tableView.frame.size.width,height: 40.0))
        if section == 0 {
            return view
        } else {
            view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.768627451, blue: 0.4431372549, alpha: 1)
            // how can I set color of text?
            
            view.addSubview(headerLabel)
            headerLabel.text = "Recipe"
            headerLabel.sizeToFit()
            headerLabel.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            headerLabel.frame.origin.y = view.frame.size.height/2-headerLabel.frame.size.height/2
            //headerLabel.frame.origin.y = view.frame.size.height/2
            //view.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor).isActive = true
            return view
        }
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = UIColor.red
        }
    }
    
}





//    func test(for cell:UITableViewCell, with item: recipeListCreatorItemTableViewCell) {
//        if let label = cell.viewWithTag(1000) as? UILabel {
//            label.text = item.textTest
//        }
//    }





/*
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
 
 // Configure the cell...
 
 return cell
 }
 */

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



