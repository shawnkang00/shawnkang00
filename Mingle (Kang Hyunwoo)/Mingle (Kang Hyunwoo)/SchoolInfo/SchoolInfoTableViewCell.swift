//
//  SchoolInfoTableViewCell.swift
//  Mingle (Kang Hyunwoo)
//
//  Created by 강현우 on 2022/07/13.
//

import UIKit

class SchoolInfoTableViewCell: UITableViewCell {
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        self.contentView.addSubview(nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
        ])
    }
    
    func setSchoolData(text: String) {
        self.nameLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
