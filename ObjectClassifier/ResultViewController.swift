//
//  ResultViewController.swift
//  ObjectClassifier
//
//  Created by Vlad Goy on 16.02.2020.
//  Copyright © 2020 Vlad Goy. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var image: UIImage?
    
    @IBOutlet weak var selectedImageCiew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedImageCiew.image = image
    }
    
}
