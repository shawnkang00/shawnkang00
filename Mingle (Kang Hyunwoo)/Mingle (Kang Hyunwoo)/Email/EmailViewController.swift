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
    
    var email: String = ""
    // 클로져로 데이터 전달
    var emailInfo: ((EmailInfo) -> Void)?
    
    // MARK: UI Objects
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor.black
        label.font = UIFont(name: "PretendardVariable-Regular", size: 24)
        label.numberOfLines = 0
        label.text = "학교 이메일을 입력해 주세요."
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor.gray3
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
        button.layer.borderColor = UIColor.gray3.cgColor
        button.clipsToBounds = true
        return button
    }()
    
    private let atLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = .black
        label.font = UIFont(name: "PretendardVariable-Regular", size: 16)
        label.text = "@"
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        textField.textColor = UIColor.black
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(
            string: "학교 이메일 작성",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2]
        )
        return textField
    }()
    
    private let underBar: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.primaryOrange1
            return view
        }()
    
    private let emailSelectionView = EmailSelectionView()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.borderWidth = 1
        tableView.register(EmailTableViewCell.self, forCellReuseIdentifier: "EmailTableViewCell")
        return tableView
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor.gray3
        label.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        label.text = "이미 존재하는 이메일 주소입니다."
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle("인증번호 받기", for: .normal)
        button.titleLabel?.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        button.setTitleColor(UIColor.gray4, for: .normal)
        
        return button
    }()
    
    private let receiveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("인증번호 받기", for: .normal)
        button.titleLabel?.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        button.setTitleColor(UIColor.gray4, for: .normal)
        button.backgroundColor = UIColor.gray2
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
        self.emailSelectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // 셀 갯수 (이메일 갯수)에 따라 리스트 높이 설정
        var viewHeight = (emailList.count) * 32
        if viewHeight < 80 {
            viewHeight = (emailList.count) * 32
        }
        else { viewHeight = 80 }
        
        // Adding Subviews
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.descriptionLabel)
        self.view.addSubview(self.emailButton)
        self.view.addSubview(self.atLabel)
        self.view.addSubview(self.emailTextField)
        self.view.addSubview(self.underBar)
        self.view.addSubview(self.emailSelectionView)
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.errorLabel)
        self.view.addSubview(self.loginButton)
        self.view.addSubview(self.receiveButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 144),
            self.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            self.titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            
            self.emailTextField.centerYAnchor.constraint(equalTo: emailButton.centerYAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: atLabel.leadingAnchor, constant: -8),
            self.emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            self.atLabel.centerYAnchor.constraint(equalTo: emailButton.centerYAnchor),
            self.atLabel.trailingAnchor.constraint(equalTo: emailButton.leadingAnchor, constant: -8),
            
            self.emailButton.widthAnchor.constraint(equalToConstant: 144),
            self.emailButton.heightAnchor.constraint(equalToConstant: 44),
            self.emailButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 64),
            self.emailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            self.underBar.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12),
            self.underBar.heightAnchor.constraint(equalToConstant: 1),
            self.underBar.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            self.underBar.trailingAnchor
                .constraint(equalTo: emailTextField.trailingAnchor),
            
            self.emailSelectionView.centerYAnchor.constraint(equalTo: emailButton.centerYAnchor),
            self.emailSelectionView.leadingAnchor.constraint(equalTo: emailButton.leadingAnchor, constant: 12),
            self.emailSelectionView.trailingAnchor.constraint(equalTo: emailButton.trailingAnchor, constant: -15),
            
            self.tableView.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: -1),
            self.tableView.leadingAnchor.constraint(equalTo: emailButton.leadingAnchor),
            self.tableView.trailingAnchor
                .constraint(equalTo: emailButton.trailingAnchor),
            self.tableView.heightAnchor.constraint(equalToConstant: CGFloat(viewHeight)),
            
            self.errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            self.errorLabel.topAnchor.constraint(equalTo: underBar.bottomAnchor, constant: 16),
            
            self.loginButton.centerYAnchor.constraint(equalTo: errorLabel.centerYAnchor),
            self.loginButton.leadingAnchor.constraint(equalTo: errorLabel.trailingAnchor, constant: 16),
            
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
        // UIStackView는 버튼이 아니기에 탭 제스쳐 적용
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onPressEmailButton))
        self.emailSelectionView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: 화면전환
//    @objc func onPressNextButton(sender: Any) {
//        let emailVC = EmailViewController()
//        self.navigationController?.pushViewController(emailVC, animated: true)
//    }
    
    // MARK: 이메일선택 리스트 표시/감추기 + 버튼 색상 변경
    @objc func onPressEmailButton(sender: Any) {
        if tableView.isHidden {
            self.tableView.isHidden = false
            emailButton.backgroundColor = UIColor.gray2
            emailSelectionView.selectionLabel.textColor = UIColor.gray3
            emailSelectionView.arrowImage.image = UIImage(systemName: "chevron.up")
        }
        else {
            self.tableView.isHidden = true
            emailButton.backgroundColor = UIColor.white
            if emailSelectionView.selectionLabel.text == "선택" {
                emailSelectionView.selectionLabel.textColor = UIColor.gray2
            }
            else {
                emailSelectionView.selectionLabel.textColor = .black
            }
            emailSelectionView.arrowImage.image = UIImage(systemName: "chevron.down")
        }
    }
    
    // MARK: "인증번호 받기" 클릭시 이메일 확인
    @objc func registerButtonDidTap(sender: Any) {
        // 뒤로가기
        self.navigationController?.popViewController(animated: true)
        // 인증번호 받기를 눌렀을때 데이터 전달
        let emailInfo = EmailInfo(email: self.email)
        self.emailInfo?(emailInfo)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = emailList[indexPath.item]
        emailSelectionView.selectionLabel.text = data
        onPressEmailButton(sender: self)
        emailSelectionView.selectionLabel.textColor = .black
    }
}
