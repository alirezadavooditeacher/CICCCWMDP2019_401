//
//  DiscoveryViewController.swift
//  RecipeDiscovery
//
//  Created by fangyilai on 2019-10-24.
//  Copyright © 2019 fangyilai. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var MenuCollectionVIew: UICollectionView!
    @IBAction func SideMenuTapped(){
        print("Toggle side Menu")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    @IBOutlet weak var SideMenuConstraint: NSLayoutConstraint!
    @IBAction func SearchBarItem() {
        print("Tab searchBar")
        NotificationCenter.default.post(name: NSNotification.Name("ShowSearch"), object: nil)
    }
    
    
    var imageArray = [Image]()
    var arrayMenu = [String]()
    var searchIMageName = [Image]()
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Discovery"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange ]
        CreateImageArray()
        CreateMenuLabel()
        
        let width = (MenuCollectionVIew.frame.size.width - 5) / 2
        let layout = MenuCollectionVIew.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("ToggleSideMenu"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showSearch), name: NSNotification.Name("ShowSearch"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showProfile), name: NSNotification.Name("ShowProfile"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showSetting), name: NSNotification.Name("ShowSetting"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showContact), name: NSNotification.Name("ShowContact"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showAbout), name: NSNotification.Name("ShowAbout"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showLogout), name: NSNotification.Name("ShowLogout"), object: nil)
        
    }
    
    
    func CreateMenuLabel() {
        
        let label1 = "Most Popular"
        let label2 = "Editor Choice"
        let label3 = "VIP Only"
        let label4 = "Monthly Choice"
        let label5 = "Category"
        let label6 = "Subscribed Uploader"
        arrayMenu.append(label1)
        arrayMenu.append(label2)
        arrayMenu.append(label3)
        arrayMenu.append(label4)
        arrayMenu.append(label5)
        arrayMenu.append(label6)
    }
    
    func CreateImageArray() {
        let image1 = Image(title: "Appetizer", image: #imageLiteral(resourceName: "meat"))
        let image2 = Image(title: "Main Dish", image: #imageLiteral(resourceName: "Pizza"))
        let image3 = Image(title: "Salad", image: #imageLiteral(resourceName: "salad"))
        let image4 = Image(title: "Dessert", image: #imageLiteral(resourceName: "dessert"))
        let image5 = Image(title: "Beverage", image: #imageLiteral(resourceName: "drink"))
        
        imageArray.append(image1)
        imageArray.append(image2)
        imageArray.append(image3)
        imageArray.append(image4)
        imageArray.append(image5)
        
    }
    
    
    @objc func toggleSideMenu() {
        if sideMenuOpen{
            sideMenuOpen = false
            SideMenuConstraint.constant = -150
        }else{
            sideMenuOpen = true
            SideMenuConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func showProfile(){
        print("show Profile")
        
        let Storyboard: UIStoryboard = UIStoryboard(name: "shihomi", bundle: nil)
        let vc = Storyboard.instantiateViewController(withIdentifier: "profilePage") as! TableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showSearch(){
        print("show Search")
        performSegue(withIdentifier: "searchPage", sender: nil)
    }
    
    @objc func showSetting(){
        print("show Setting")
        performSegue(withIdentifier: "setting", sender: nil)
    }
    @objc func showContact(){
        print("show Contact")
        performSegue(withIdentifier: "contact", sender: nil)
    }
    @objc func showAbout(){
        print("show About")
        performSegue(withIdentifier: "about", sender: nil)
    }
    @objc func showLogout(){
        print("show Logout")
        performSegue(withIdentifier: "logout", sender: nil)
    }
    
    
}



extension DiscoveryViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let image = imageArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as! ImagesCell
        
        cell.setImage(UIimage: image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewContoller = storyboard?.instantiateViewController(withIdentifier: "RecipeViewController") as? RecipeViewController
        let image = imageArray[indexPath.row]
        viewContoller?.T_image = image.image
        viewContoller?.T_Name = image.title
        viewContoller?.category = indexPath.row
        self.navigationController?.pushViewController(viewContoller!, animated: true)
    }
        
}


extension DiscoveryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MenuCollectionVIew.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
        cell.MenuLabel.text = arrayMenu[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
}




class MenuCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var MenuLabel: UILabel!
   
   
}
