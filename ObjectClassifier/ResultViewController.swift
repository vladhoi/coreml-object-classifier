//
//  ResultViewController.swift
//  ObjectClassifier
//
//  Created by Vlad Goy on 16.02.2020.
//  Copyright © 2020 Vlad Goy. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let label = UILabel()
        label.text = "Works"
        label.frame = CGRect(x: 0, y:0, width: 100, height: 50)
        view.addSubview(label)
    }
    
}
