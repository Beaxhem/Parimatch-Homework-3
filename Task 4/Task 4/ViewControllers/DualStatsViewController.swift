//
//  DualStatsViewController.swift
//  Task 4
//
//  Created by Ilya Senchukov on 25.12.2020.
//

import UIKit

class DualStatsViewController: UIViewController {
    var firstStatData: Stat? {
        willSet {
            firstStat.data = newValue
        }
    }
    
    var secondStatData: Stat? {
        willSet {
            secondStat.data = newValue
        }
    }
    
    var firstStat: StatView = {
        let view = StatView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var secondStat: StatView = {
        let view = StatView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.data = Stat(title: "Videos", value: "115", image: UIImage(named: "video-icon"))
        
        return view
    }()
    
    var checkStatsButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("check_stats", comment: ""), for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        
        view.addSubview(firstStat)
        view.addSubview(secondStat)
        view.addSubview(checkStatsButton)
        
        checkStatsButton.addTarget(self, action: #selector(presentAlertController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            firstStat.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            firstStat.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            firstStat.widthAnchor.constraint(equalToConstant: 100),
            firstStat.bottomAnchor.constraint(equalTo: checkStatsButton.topAnchor, constant: 5),
            
            secondStat.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            secondStat.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            secondStat.widthAnchor.constraint(equalToConstant: 100),
            secondStat.bottomAnchor.constraint(equalTo: checkStatsButton.topAnchor, constant: 5),
            
            checkStatsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            checkStatsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            checkStatsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            checkStatsButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc private func presentAlertController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "CustomAlertController")
        
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        
        present(vc, animated: true, completion: nil)
    }
}
