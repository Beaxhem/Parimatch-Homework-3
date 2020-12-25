//
//  ViewController.swift
//  Task 1.2
//
//  Created by Ilya Senchukov on 23.12.2020.
//

import UIKit

public class CustomTraitCollectionViewController: UIViewController {
    public override func overrideTraitCollection(forChild childViewController: UIViewController) -> UITraitCollection? {
        print("Hello")
        print(UIDevice.current.localizedModel, UIDevice.current.model)
        if UIDevice.current.orientation.isLandscape {
            return UITraitCollection(traitsFrom: [UITraitCollection(verticalSizeClass: .compact), UITraitCollection(horizontalSizeClass: .regular)])
        }
        
        return super.overrideTraitCollection(forChild: childViewController)
    }
    
}
