//
//  DiscoveryViewController.swift
//  RecipeDiscovery
//
//  Created by fangyilai on 2019-10-24.
//  Copyright © 2019 fangyilai. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController {
    
    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var MenuCollectionVIew: UICollectionView!
    
    
    var imageArray = [Image]()
    var ArrayMenu = [String]()
    var searchIMageName = [Image]()
    var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateImageArray()
        CreateMenuLabel()
        setupNavigationBarItems()
        
        let width = (MenuCollectionVIew.frame.size.width - 5) / 2
        let layout = MenuCollectionVIew.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    func CreateMenuLabel() {
        
        let label1 = "Most Popular"
        let label2 = "Editor Choice"
        let label3 = "VIP Only"
        let label4 = "Monthly Choice"
        let label5 = "Category"
        ArrayMenu.append(label1)
        ArrayMenu.append(label2)
        ArrayMenu.append(label3)
        ArrayMenu.append(label4)
        ArrayMenu.append(label5)
    }
    
    func CreateImageArray() {
        let image1 = Image(title: "Meat", image: #imageLiteral(resourceName: "meat"))
        let image2 = Image(title: "Pizza", image: #imageLiteral(resourceName: "Pizza"))
        let image3 = Image(title: "Salad", image: #imageLiteral(resourceName: "salad"))
        let image4 = Image(title: "Soup", image: #imageLiteral(resourceName: "soup"))
        let image5 = Image(title: "Dessert", image: #imageLiteral(resourceName: "dessert"))
        
        imageArray.append(image1)
        imageArray.append(image2)
        imageArray.append(image3)
        imageArray.append(image4)
        imageArray.append(image5)

    }
    
    private func setupNavigationBarItems(){
//        let searchButton = UIButton(type: .system)
//        searchButton.setImage(#imageLiteral(resourceName: "search-30").withRenderingMode(.alwaysTemplate), for: .normal)
//        searchButton.contentMode = .scaleAspectFit
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
        let searchImage = UIImage(imageLiteralResourceName: "search-30")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: nil, action: #selector(tapSearchButtom))
    }
    @objc func tapSearchButtom(){
        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        searchBar.placeholder = "Your placeholder"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
    }
    
//    @IBAction func searchAction(sender: UIBarButtonItem) {
//        // Create the search controller and specify that it should present its results in this same view
//        searchController = UISearchController(searchResultsController: nil)
//
//        // Set any properties (in this case, don't hide the nav bar and don't show the emoji keyboard option)
//        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.searchBar.keyboardType = UIKeyboardType.ASCIICapable
//
//        // Make this class the delegate and present the search
//        self.searchController.searchBar.delegate = self
//        presentViewController(searchController, animated: true, completion: nil)
//    }
//
    
}



extension DiscoveryViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchIMageName.count
        }else{
            return imageArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let image = imageArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as! ImagesCell
        if searching{
            cell.setImage(UIimage: searchIMageName[indexPath.row])
        }else{
            cell.setImage(UIimage: image)
        }
        return cell
    }
    
    //To connect new view controller with navigationController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewContoller = storyboard?.instantiateViewController(withIdentifier: "RecipeViewController") as? RecipeViewController
        let image = imageArray[indexPath.row]
        viewContoller?.T_image = image.image
        viewContoller?.T_Name = image.title
        viewContoller?.category = indexPath.row
        self.navigationController?.pushViewController(viewContoller!, animated: true)
        
        if indexPath.row == 0{
            collection_1()
        }
        
    }
    
    private func collection_1(){
        
    }
    
}

/* v1
 extension DiscoveryViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchIMageName = imageArray.filter({$0.title.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        TableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        TableView.reloadData()
    }
}
*/

extension DiscoveryViewController: UISearchBarDelegate{
    
//    @IBAction func searchAction(sender: UIBarButtonItem) {
//        // Create the search controller and specify that it should present its results in this same view
//         let searchController = UISearchController(searchResultsController: nil)
//
//        // Set any properties (in this case, don't hide the nav bar and don't show the emoji keyboard option)
//        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.searchBar.keyboardType = UIKeyboardType.ASCIICapable
//
//        // Make this class the delegate and present the search
//        self.searchController.searchBar.delegate = self
//        presentViewController(searchController, animated: true, completion: nil)
//    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchIMageName = imageArray.filter({ $0.title.lowercased().contains(searchText.lowercased())})
        searching = true
        TableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        TableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.endEditing(true)
    }
}






extension DiscoveryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrayMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = MenuCollectionVIew.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
        cell.MenuLabel.text = ArrayMenu[indexPath.row]
        return cell
    }
    
    func roundCorners(view: UIView,cornerRadius: Double) {
          view.layer.cornerRadius = CGFloat(cornerRadius)
          view.clipsToBounds = true
      }
}

class MenuCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var MenuLabel: UILabel!
}
