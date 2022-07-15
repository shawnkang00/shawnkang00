//
//  EmailTableViewCell.swift
//  Mingle (Kang Hyunwoo)
//
//  Created by 강현우 on 2022/07/15.
//

import UIKit

class EmailTableViewCell: UITableViewCell {

    public let emailLabel: UILabel = {
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
        
        self.contentView.addSubview(emailLabel)
        self.emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.emailLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
        ])
    }
    
    func setEmailData(text: String) {
        self.emailLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
