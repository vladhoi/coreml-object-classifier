//
//  MLModel.swift
//  ObjectClassifier
//
//  Created by Vlad Goy on 16.02.2020.
//  Copyright © 2020 Vlad Goy. All rights reserved.
//

import UIKit
import CoreML
import Vision

class Classifier {
    
    var classifier: MLModel
    var imageToClassify: UIImage
    var classificationLabel: UILabel
    
    init(classifier_file: MLModel, image: UIImage, label: UILabel) {
        self.classifier = classifier_file
        self.imageToClassify = image
        self.classificationLabel = label
    }
    
    private func convertUIImageToCIImage() -> CIImage {
        guard let ciImage = CIImage(image: self.imageToClassify) else { fatalError("Couldn't convert \(imageToClassify) to \(CIImage.self).") }
        return ciImage
    }
    
    func getClassifications() {
       
        guard let model = try? VNCoreMLModel(for: Resnet50().model) else {
            fatalError("Loading CoreML Model Failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results else {
                self.classificationLabel.text = "Unable to classify image.)"
                return
            }
            
            let classifications = results as! [VNClassificationObservation]
            
            if classifications.isEmpty {
                self.classificationLabel.text = "Nothing recognized."
            } else {
                let topClassifications = classifications.prefix(2)
                let descriptions = topClassifications.map { classification in
                   return String(format: "  (%.2f) %@", classification.confidence, classification.identifier)
                }
                print("Classification:\n" + descriptions.joined(separator: "\n"))
                self.classificationLabel.text = descriptions.joined(separator: "\n")
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: convertUIImageToCIImage())
        
        do {
        try handler.perform([request])
        }
        catch {
            print(error)
        }
    }
}
