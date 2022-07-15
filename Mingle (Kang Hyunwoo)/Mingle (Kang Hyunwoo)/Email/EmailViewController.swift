//
//  EmailViewController.swift
//  Mingle (Kang Hyunwoo)
//
//  Created by 강현우 on 2022/07/15.
//

import UIKit

class EmailViewController: UIViewController {

    private let emailList: [String] = [
        "connect.hku.hk",
        "hku.hk"]
    
    // MARK: UI Objects
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "PretendardVariable-Regular", size: 24)
        label.numberOfLines = 0
        label.text = "학교 이메일을 입력해 주세요."
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
        label.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        label.text = "인증번호가 발송돼요."
        return label
    }()
    
    private let emailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1).cgColor
        button.clipsToBounds = true
        return button
    }()
    
//    private let schoolSelectionView = SchoolSelectionView()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.borderWidth = 1
        tableView.register(EmailTableViewCell.self, forCellReuseIdentifier: "EmailTableViewCell")
        return tableView
    }()
    
    private let receiveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("인증번호 받기", for: .normal)
        button.titleLabel?.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        button.setTitleColor(UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        // Dropdown list (Table View)
        self.tableView.isHidden = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
//        self.schoolSelectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding Subviews
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.descriptionLabel)
        self.view.addSubview(self.emailButton)
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.receiveButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 144),
            self.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            self.titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            
            self.emailButton.widthAnchor.constraint(equalToConstant: 144),
            self.emailButton.heightAnchor.constraint(equalToConstant: 44),
            self.emailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            self.emailButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 64),
            
            self.tableView.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: -1),
            self.tableView.leadingAnchor.constraint(equalTo: emailButton.leadingAnchor),
            self.tableView.trailingAnchor
                .constraint(equalTo: emailButton.trailingAnchor),
            self.tableView.heightAnchor.constraint(equalToConstant: 80),
            
            self.receiveButton.heightAnchor.constraint(equalToConstant: 48),
            self.receiveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            self.receiveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            self.receiveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -74)
        ])
        
        self.tableView.reloadData()
        self.tableView.separatorStyle = .none
        self.tableView.layoutIfNeeded()
        
        // MARK: Add Target
        self.emailButton.addTarget(self, action: #selector(onPressEmailButton), for: .touchUpInside)
    }
    
    // MARK: 이메일선택 리스트 표시/감추기 + 버튼 색상 변경
    @objc func onPressEmailButton(sender: Any) {
        if tableView.isHidden {
            self.tableView.isHidden = false
            emailButton.backgroundColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1)
//            schoolSelectionView.schoolLabel.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
//            schoolSelectionView.arrowImage.image = UIImage(systemName: "chevron.up")
        }
        else {
            self.tableView.isHidden = true
            emailButton.backgroundColor = UIColor.white
//            schoolSelectionView.schoolLabel.textColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1)
//            schoolSelectionView.arrowImage.image = UIImage(systemName: "chevron.down")
        }
    }
}

extension EmailViewController: UITableViewDelegate, UITableViewDataSource {
    // 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailList.count
    }
    
    // 셀의 크기 (높이)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    
    // 셀의 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmailTableViewCell", for: indexPath) as? EmailTableViewCell
        else { return UITableViewCell() }
        
        let data = emailList[indexPath.item]
        cell.setEmailData(text: data)
        return cell
    }
    
    // 셀 선택시 (대학선택시) 버튼 이름 변경
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let data = emailList[indexPath.item]
//        schoolSelectionView.schoolLabel.text = data
//        onPressSchoolButton(sender: self)
//        schoolSelectionView.schoolLabel.textColor = .black
//    }
}
