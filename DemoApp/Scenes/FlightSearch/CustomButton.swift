//
//  CustomButton.swift
//  DemoApp
//
//  Created by Duy  Tran on 06/05/2022.
//

import UIKit

struct ButtonViewModel {
    var firstLine: String
    var secondLine: String
    var thirdLine: String
}

class CustomButton: UIButton {
    
    private let firstLineLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.textColor = .white
        
        return label
        
    }()
    
    private let secondLineLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        
        return label
        
    }()
    
    private let thirdLineLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .white
        
        return label
        
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(firstLineLabel)
        addSubview(secondLineLabel)
        addSubview(thirdLineLabel)
        
        clipsToBounds = true
        layer.cornerRadius = 20
        backgroundColor = .systemCyan
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    func configura(with modelView: ButtonViewModel) {
        firstLineLabel.text = modelView.firstLine
        secondLineLabel.text = modelView.secondLine
        thirdLineLabel.text = modelView.thirdLine
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        firstLineLabel.frame = CGRect(x: 0, y: 0, width: 86, height: 14)
        secondLineLabel.frame = CGRect(x: 0, y: 19, width: 86, height: 48)
        thirdLineLabel.frame = CGRect(x: 0, y: 94, width: 65, height: 15)
    }
}
