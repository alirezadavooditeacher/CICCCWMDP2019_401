//
//  CreatorViewController.swift
//  RecipeProject_v2
//
//  Created by fangyilai on 2019-12-12.
//  Copyright © 2019 fangyilai. All rights reserved.
//

import UIKit

class CreatorViewController: UIViewController {
    
    @IBOutlet weak var MainPhotoTableView: UITableView!
    @IBAction func UploadPhotoAction(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    var imagePicker = UIImagePickerController()
    //let photoCell = CreatorPhotoCell()
    var mainPhoto = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
}

extension CreatorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            print("hey it is photo upload")
            mainPhoto = photo
        }
        dismiss(animated: true, completion: nil)
    }
}

extension CreatorViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainPhotoCell") as! CreatorPhotoCell
        cell.Mainphoto.image = mainPhoto
        return cell
    }
}



class CreatorPhotoCell: UITableViewCell{
    @IBOutlet weak var Mainphoto: UIImageView!
    
}
