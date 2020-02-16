//
//  ViewController.swift
//  ObjectClassifier
//
//  Created by Vlad Goy on 16.02.2020.
//  Copyright © 2020 Vlad Goy. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    var userPickedImage: UIImage?
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imagePicker.dismiss(animated: true, completion: nil)
            
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        
    }
    
    
    @IBAction func selectPhotoFromLibrary(_ sender: UIButton) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func takePhotoButtonPressed(_ sender: UIButton) {
        
        imagePicker.sourceType = .camera
        imagePicker.showsCameraControls = true
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         if segue.identifier == "goToResult" {
             let destinationVC = segue.destination as! ResultViewController
             destinationVC.image = userPickedImage
         }
        
     }
    
}

