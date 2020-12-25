//
//  ViewController.swift
//  Task 4
//
//  Created by Ilya Senchukov on 24.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func detailsButtonTapped() {
        
        if let usernameTextField = usernameTextField, let text = usernameTextField.text, !text.isEmpty {
            guard let detailsViewController = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController else {
                return
            }
            
            detailsViewController.username = text
            
            present(detailsViewController, animated: true, completion: nil)
        }
    }

}

