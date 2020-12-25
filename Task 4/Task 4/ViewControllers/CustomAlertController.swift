//
//  CustomAlertController.swift
//  Task 4
//
//  Created by Ilya Senchukov on 25.12.2020.
//

import Foundation
import UIKit

class CustomAlertController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.2)
    }
    
    @IBAction func closeAlert() {
        self.dismiss(animated: true, completion: nil)
    }
}
