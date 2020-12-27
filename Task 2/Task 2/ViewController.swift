//
//  ViewController.swift
//  Task 2
//
//  Created by Ilya Senchukov on 23.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blackSquare: UIView?
    @IBOutlet weak var blackSquareWidthConstraint: NSLayoutConstraint?
    
    @IBOutlet weak var colorCircleBackgroundView: UIView?
    @IBOutlet weak var colorCircle: UIView?
    
    @IBOutlet weak var blueCircle: UIView?
    
    var blackSquareHasAnimated = false
    
    var colorSet: [[UIColor]] = [[.black, .white], [.blue, .red], [.green, .yellow], [.orange, .magenta], [.white, .black]]
    var currentColor = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let blackSquare = blackSquare, let colorCircle = colorCircle, let blueCircle = blueCircle else {
            return
        }
        
        let blackSquareTapGesture = UITapGestureRecognizer(target: self, action: #selector(blackSquareAnimationStart))
        blackSquare.addGestureRecognizer(blackSquareTapGesture)
        
        let colorCircleTapGesture = UITapGestureRecognizer(target: self, action: #selector(colorCircleAnimationStart))
        colorCircle.addGestureRecognizer(colorCircleTapGesture)
        
        let blueCircleTapGesture = UITapGestureRecognizer(target: self, action: #selector(blueCircleAnimationStart))
        blueCircle.addGestureRecognizer(blueCircleTapGesture)
    }
    
    @objc func blackSquareAnimationStart() {
        guard let blackSquareWidthConstraint = blackSquareWidthConstraint else {
            return
        }
        
        UIView.animate(withDuration: 2) {
            if self.blackSquareHasAnimated {
                blackSquareWidthConstraint.constant -= 40
                self.blackSquareHasAnimated = false
            } else {
                blackSquareWidthConstraint.constant += 40
                self.blackSquareHasAnimated = true
            }
            
            self.view.layoutIfNeeded()
        }
    }

    @objc func colorCircleAnimationStart() {
        guard let colorCircleBackgroundView = colorCircleBackgroundView, let colorCircle = colorCircle else {
            return
        }
        
        currentColor = currentColor + 1 < colorSet.count ? currentColor + 1 : 0
        
        UIView.animate(withDuration: 0.5) {
            colorCircleBackgroundView.backgroundColor = self.colorSet[self.currentColor][0]
            colorCircle.backgroundColor = self.colorSet[self.currentColor][1]
        }
    }

    @objc func blueCircleAnimationStart() {
        guard let circle = blueCircle else {
            return
        }
        
        UIView.animate(withDuration: 2, delay: 0, options: [UIView.AnimationOptions.autoreverse], animations: {
            circle.layer.cornerRadius = circle.frame.height / 2
        }) { completed in
            if completed {
                circle.layer.cornerRadius = 0
            }
        }
        
    }
}

