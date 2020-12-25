//
//  StatView.swift
//  Task 4
//
//  Created by Ilya Senchukov on 25.12.2020.
//

import UIKit

class StatView: UIView {
    var data: Stat? {
        willSet {
            guard let stat = newValue else {
                return
            }
            statTitle.text = stat.title
            statIcon.image = stat.image
            valueLabel.text = stat.value
        }
    }
    
    private var statTitle: UILabel = {
        let label = UILabel()
        label.text = "No title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var statIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "No value"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(statIcon)
        addSubview(statTitle)
        addSubview(valueLabel)
        NSLayoutConstraint.activate([
            statIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            statIcon.topAnchor.constraint(equalTo: topAnchor),
            statIcon.heightAnchor.constraint(equalToConstant: 30),
            statIcon.widthAnchor.constraint(equalToConstant: 30),
            
            statTitle.leadingAnchor.constraint(equalTo: statIcon.trailingAnchor, constant: 5),
            statTitle.topAnchor.constraint(equalTo: topAnchor),
            statTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            statTitle.heightAnchor.constraint(equalToConstant: 20),
            
            valueLabel.leadingAnchor.constraint(equalTo: statTitle.leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: statTitle.trailingAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 15),
            valueLabel.topAnchor.constraint(equalTo: statTitle.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
