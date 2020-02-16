//
//  ResultViewController.swift
//  ObjectClassifier
//
//  Created by Vlad Goy on 16.02.2020.
//  Copyright © 2020 Vlad Goy. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
  
    
    var image: UIImage!
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var selectedImageCiew: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        selectedImageCiew.image = image
        let classifierInstance: Classifier = Classifier(classifier_file: Resnet50().model, image: image, label: classificationLabel)
      
        classifierInstance.getClassifications()

        
    }
    
    override func didReceiveMemoryWarning() {
        print(super.didReceiveMemoryWarning())
    }
   

   
    
}
