//
//  SkafferietViewController.swift
//  Skafferiet
//
//  Created by Johan on 2019-02-11.
//  Copyright © 2019 Johan W. All rights reserved.
//

import UIKit
import CoreData

class SkafferietViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var itemImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
       
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
       
        itemImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let item = Item(context: context)
        item.title = itemTextField.text
        item.image = UIImage.pngData(itemImageView.image!)()
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
}
