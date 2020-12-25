//
//  ViewController.swift
//  Task 3
//
//  Created by Ilya Senchukov on 25.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circle: UIView?
    
    let colors: [UIColor] = [.yellow, .orange, .red, .blue, .green, .magenta]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSwipeGestures()
        setupTapGestures()
    }
}

// MARK: - Swipes
extension ViewController {
    func setupSwipeGestures() {
        let dragRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        dragRight.direction = .right
        circle?.addGestureRecognizer(dragRight)
        
        let dragLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        dragLeft.direction = .left
        circle?.addGestureRecognizer(dragLeft)
        
        let dragUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        dragUp.direction = .up
        circle?.addGestureRecognizer(dragUp)
        
        let dragDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        dragDown.direction = .down
        circle?.addGestureRecognizer(dragDown)
    }
    
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer) {
        guard let circle = circle else {
            return
        }
        
        UIView.animate(withDuration: 1.5) { [weak self] in
            guard let self = self else {
                return
            }
            
            switch sender.direction {
            case .right:
                circle.frame = CGRect(x: circle.frame.origin.x + 30, y: circle.frame.origin.y , width: circle.frame.size.width, height: circle.frame.size.height)
                circle.backgroundColor = self.colors.randomElement()
            case .left:
                circle.frame = CGRect(x: circle.frame.origin.x - 30, y: circle.frame.origin.y , width: circle.frame.size.width, height: circle.frame.size.height)
                circle.backgroundColor = self.colors.randomElement()
            case .up:
                circle.frame = CGRect(x: circle.frame.origin.x, y: circle.frame.origin.y - 30, width: circle.frame.size.width, height: circle.frame.size.height)
                circle.backgroundColor = self.colors.randomElement()
            case .down:
                circle.frame = CGRect(x: circle.frame.origin.x, y: circle.frame.origin.y + 30, width: circle.frame.size.width, height: circle.frame.size.height)
                circle.backgroundColor = self.colors.randomElement()
            default:
                print("Not defined")
            }
        }
    }
}

// MARK: - Taps
extension ViewController {
    func setupTapGestures() {
        let oneTap = UITapGestureRecognizer(target: self, action: #selector(handleTaps))
        oneTap.numberOfTapsRequired = 1
        circle?.addGestureRecognizer(oneTap)
        
        let twoTaps = UITapGestureRecognizer(target: self, action: #selector(handleTaps))
        twoTaps.numberOfTapsRequired = 2
        circle?.addGestureRecognizer(twoTaps)
    }
    
    @objc func handleTaps(_ sender: UITapGestureRecognizer) {
        guard let circle = circle else {
            return
        }
        
        
        UIView.animate(withDuration: 1.5) { [weak self] in
            guard let self = self else {
                return
            }
            
            switch sender.numberOfTapsRequired {
            case 1:
                circle.frame.origin.x = self.view.frame.size.width / 2 - circle.frame.size.width / 2
                circle.frame.origin.y = self.view.frame.size.height / 2 - circle.frame.size.height / 2
            case 2:
                self.startAnimating()
            default:
                print("Unknown gesture")
            }
        }
    }
}

// MARK: - Animations
extension ViewController {
    func startAnimating() {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: view.frame.size.width / 2 - 40, y: view.frame.size.height / 2))
        
        for angle in 1...360 {
            path.addLine(to: self.getPoint(for: angle))
        }
        
        path.close()

        self.animate(view: circle!, path: path)
    }
    
    private func animate(view: UIView, path: UIBezierPath) {
        let animation = CAKeyframeAnimation(keyPath: "position")

        animation.path = path.cgPath
        animation.repeatCount = 1
        animation.duration = 3

        view.layer.add(animation, forKey: "animation")
    }
    
    private func getPoint(for angle: Int) -> CGPoint {
        let radius = Double(80)
        let radian = Double(angle) * Double.pi / Double(180)

        let newCenterX = radius * cos(radian)
        let newCenterY = radius * sin(radian)

        return CGPoint(x: Double(view.frame.size.width / 2) + newCenterX, y: Double(view.frame.size.height / 2) + newCenterY)
    }
}
