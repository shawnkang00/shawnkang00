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
            self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 7),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
        ])
    }
    
    func setData(text: String) {
        self.nameLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
