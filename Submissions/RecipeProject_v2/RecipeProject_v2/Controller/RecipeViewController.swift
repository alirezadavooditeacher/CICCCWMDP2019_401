//
//  RecipeViewController.swift
//  RecipeDiscovery
//
//  Created by fangyilai on 2019-10-29.
//  Copyright © 2019 fangyilai. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class RecipeViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var TitleImage: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var collectionRef: UICollectionView!
    
    
    var category:Int = 0
    var T_image = UIImage()
    var T_Name = ""
    var CollectionImage = [UIImage]()
    var CollectionLabel = [String]()
    var inset: CGFloat = 8.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleImage.image = T_image
        TitleLabel.text = T_Name
        setupNavigationBarItems()
        //        setupCollectionView()
        self.view.sendSubviewToBack(TitleImage)
        
        collectionRef.delegate = self
        collectionRef.dataSource = self
//         roundCorners(view: UIView, cornerRadius: Double)
        
        switch category{
        case 0: setupCollection_1(); break
        case 1: setupCollection_2(); break
        case 2: setupCollection_3(); break
        case 3: setupCollection_4(); break
        case 4: setupCollection_5(); break
        case 5: setupCollection_6(); break
        default: print("no category"); break
        }
        
        let width = (collectionRef.frame.size.width - 5) / 2
        let layout = collectionRef.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        
    }
    
    private func setupCollection_1(){
        let images = [#imageLiteral(resourceName: "beach"),#imageLiteral(resourceName: "beach"),#imageLiteral(resourceName: "beach"),#imageLiteral(resourceName: "beach"),#imageLiteral(resourceName: "beach"),#imageLiteral(resourceName: "beach")]
        let labels = ["Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______",]
        CollectionImage = images
        CollectionLabel = labels
    }
    
    private func setupCollection_2(){
        let images = [#imageLiteral(resourceName: "balloon"),#imageLiteral(resourceName: "balloon"),#imageLiteral(resourceName: "balloon"),#imageLiteral(resourceName: "balloon"),#imageLiteral(resourceName: "balloon"),#imageLiteral(resourceName: "balloon")]
        let labels = ["Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______",]
        CollectionImage = images
        CollectionLabel = labels
    }
    
    private func setupCollection_3(){
        let images = [#imageLiteral(resourceName: "salad"),#imageLiteral(resourceName: "salad"),#imageLiteral(resourceName: "salad"),#imageLiteral(resourceName: "salad"),#imageLiteral(resourceName: "salad"),#imageLiteral(resourceName: "salad")]
        let labels = ["Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______"]
        CollectionImage = images
        CollectionLabel = labels
    }
    
    private func setupCollection_4(){
        let images = [#imageLiteral(resourceName: "camp"),#imageLiteral(resourceName: "camp"),#imageLiteral(resourceName: "camp"),#imageLiteral(resourceName: "camp"),#imageLiteral(resourceName: "camp"),#imageLiteral(resourceName: "camp")]
        let labels = ["Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______"]
        CollectionImage = images
        CollectionLabel = labels
    }
    
    private func setupCollection_5(){
        let images = [#imageLiteral(resourceName: "Pizza"),#imageLiteral(resourceName: "Pizza"),#imageLiteral(resourceName: "Pizza"),#imageLiteral(resourceName: "Pizza"),#imageLiteral(resourceName: "Pizza"),#imageLiteral(resourceName: "Pizza")]
        let labels = ["Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______"]
        CollectionImage = images
        CollectionLabel = labels
    }
    
    private func setupCollection_6(){
        let images = [#imageLiteral(resourceName: "soup"),#imageLiteral(resourceName: "soup"),#imageLiteral(resourceName: "soup"),#imageLiteral(resourceName: "soup"),#imageLiteral(resourceName: "soup"),]
        let labels = ["Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______","Recipe: ______\nCreator: ______"]
        CollectionImage = images
        CollectionLabel = labels
    }
    
    private func setupNavigationBarItems(){
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search-30").withRenderingMode(.alwaysTemplate), for: .normal)
        searchButton.contentMode = .scaleAspectFit
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionRef.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! CollectionViewCell
        cell.collectionImage.image = CollectionImage[indexPath.row]
        cell.collectionLabel.text = CollectionLabel[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        let width = (collectionView.frame.size.width - 10) / 3
    //        //let height = collectionView.frame.size.height
    //        return CGSize(width: width, height: width)
    //    }
    
    func roundCorners(view: UIView, cornerRadius: Double) {
           view.layer.cornerRadius = CGFloat(cornerRadius)
           view.clipsToBounds = true
    }
}
