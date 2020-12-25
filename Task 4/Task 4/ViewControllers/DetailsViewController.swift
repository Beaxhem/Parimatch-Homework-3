//
//  DetailsViewController.swift
//  Task 4
//
//  Created by Ilya Senchukov on 24.12.2020.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    var username: String?
    
    @IBOutlet weak var logoImageView: UIImageView?
    @IBOutlet weak var usernameLabel: UILabel?
    @IBOutlet weak var playerEnthusiastLabel: UILabel?
    
    let firstStat: DualStatsViewController = {
        let vc = DualStatsViewController()
        
        vc.firstStatData = Stat(title: NSLocalizedString("videos", comment: ""), value: "115", image: UIImage(named: "video-icon"))
        vc.secondStatData = Stat(title: NSLocalizedString("hearts", comment: ""), value: "5483", image: UIImage(named: "heart-icon"))
        
        return vc
    }()
    
    let secondStat: DualStatsViewController = {
        let vc = DualStatsViewController()
        
        vc.firstStatData = Stat(title: NSLocalizedString("games", comment: ""), value: "453", image: UIImage(named: "game-icon"))
        vc.secondStatData = Stat(title: NSLocalizedString("wins", comment: ""), value: "340", image: UIImage(named: "win-icon"))
        
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let logoImageView = logoImageView else {
            return
        }
        
        logoImageView.layer.borderWidth = 1
        logoImageView.layer.masksToBounds = true
        logoImageView.layer.borderColor = UIColor.black.cgColor
        logoImageView.layer.cornerRadius = logoImageView.frame.height / 2
        logoImageView.clipsToBounds = true

        guard let username = username, let usernameLabel = usernameLabel else {
            return
        }
        usernameLabel.text = username
        
        guard let playerEnthusiastLabel = playerEnthusiastLabel else {
            return
        }
        
        addChild(firstStat)
        view.addSubview(firstStat.view)
        firstStat.didMove(toParent: self)
        firstStat.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(secondStat)
        view.addSubview(secondStat.view)
        secondStat.didMove(toParent: self)
        secondStat.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstStat.view.topAnchor.constraint(equalTo: playerEnthusiastLabel.bottomAnchor, constant: 10),
            firstStat.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstStat.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstStat.view.heightAnchor.constraint(equalToConstant: 100),
            
            secondStat.view.topAnchor.constraint(equalTo: firstStat.view.bottomAnchor, constant: 10),
            secondStat.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondStat.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondStat.view.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

