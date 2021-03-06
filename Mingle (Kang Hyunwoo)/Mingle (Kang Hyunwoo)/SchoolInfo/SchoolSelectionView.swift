//
//  SchoolSelectionView.swift
//  Mingle (Kang Hyunwoo)
//
//  Created by 강현우 on 2022/07/14.
//

import UIKit

class SchoolSelectionView: UIStackView {

    let schoolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1)
        label.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        label.numberOfLines = 1
        label.text = "학교 선택"
        return label
    }()
    
    let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.addArrangedSubview(self.schoolLabel)
        self.addArrangedSubview(self.arrowImage)
        
        // Constraints
        NSLayoutConstraint.activate([
            self.schoolLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.arrowImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.arrowImage.widthAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
