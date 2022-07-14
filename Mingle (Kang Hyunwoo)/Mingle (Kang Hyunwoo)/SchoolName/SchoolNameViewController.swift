import UIKit

class SchoolNameViewController: UIViewController {
    
    private let schoolList = [
        "홍콩대학교",
        "과학기술대학교",
        "중문대학교",
        "시티대학교",
        "폴리텍대학교"]
    
    // MARK: UI Objects
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "PretendardVariable-Regular", size: 24)
        label.numberOfLines = 0
        label.text = "재학 중인 학교가 어디신가요?"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
        label.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        label.text = "원활한 앱 이용을 위해 재학 정보가 필요해요."
        return label
    }()
    
    private let schoolImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "building.2")
        imageView.backgroundColor = .white
        imageView.tintColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let schoolButton: UIButton = {
        let button = UIButton()
        // 버튼의 기타 속성
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1).cgColor
        button.clipsToBounds = true
        
//        // 버튼의 텍스트
//        button.setTitle("학교 선택", for: .normal)
//        button.titleLabel?.font = UIFont(name: "PretendardVariable-Regular", size: 14)
//        button.setTitleColor(UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1), for: .normal)
//        // 버튼의 이미지
//        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
//        button.imageView?.tintColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
//        button.semanticContentAttribute = .forceRightToLeft
        
        return button
    }()
    
    private let schoolSelectionView = SchoolSelectionView()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("다음으로", for: .normal)
        button.titleLabel?.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        button.setTitleColor(UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.borderWidth = 1
        tableView.register(SchoolNameTableViewCell.self, forCellReuseIdentifier: "SchoolNameTableViewCell")
        return tableView
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
        self.schoolSelectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding Subviews
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.descriptionLabel)
        self.view.addSubview(self.schoolImage)
        self.view.addSubview(self.schoolButton)
        self.view.addSubview(self.schoolSelectionView)
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.nextButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            self.titleLabel.heightAnchor.constraint(equalToConstant: 58),
            self.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            self.titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -181),
            self.titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 144),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            
            self.schoolImage.widthAnchor.constraint(equalToConstant: 118),
            self.schoolImage.heightAnchor.constraint(equalToConstant: 74),
            self.schoolImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.schoolImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 58),
            
            self.schoolButton.widthAnchor.constraint(equalToConstant: 170),
            self.schoolButton.heightAnchor.constraint(equalToConstant: 44),
            self.schoolButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.schoolButton.topAnchor.constraint(equalTo: schoolImage.bottomAnchor, constant: 36),
            
            self.schoolSelectionView.centerYAnchor.constraint(equalTo: schoolButton.centerYAnchor),
            self.schoolSelectionView.leadingAnchor.constraint(equalTo: schoolButton.leadingAnchor, constant: 12),
            self.schoolSelectionView.trailingAnchor.constraint(equalTo: schoolButton.trailingAnchor, constant: -15),
            
            self.tableView.topAnchor.constraint(equalTo: schoolButton.bottomAnchor, constant: -3),
            self.tableView.leadingAnchor.constraint(equalTo: schoolButton.leadingAnchor),
            self.tableView.trailingAnchor
                .constraint(equalTo: schoolButton.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -70),
            
            self.nextButton.heightAnchor.constraint(equalToConstant: 48),
            self.nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            self.nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            self.nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -88)
        ])
        
        self.tableView.reloadData()
        self.tableView.separatorStyle = .none
        self.tableView.layoutIfNeeded()
        
        // MARK: Add Target
        self.schoolButton.addTarget(self, action: #selector(onPressSchoolButton), for: .touchUpInside)
        // UIStackView는 버튼이 아니기에 탭 제스쳐 적용
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onPressSchoolButton))
        self.schoolSelectionView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: 화면전환
//    @objc func onPressNextButton(sender: Any) {
//        let emailVC = EmailViewController()
//        self.navigationController?.pushViewController(emailVC, animated: true)
//    }
    
    // MARK: 대학선택 리스트 표시/감추기 + 버튼 색상 변경
    @objc func onPressSchoolButton(sender: Any) {
        if tableView.isHidden {
            self.tableView.isHidden = false
            schoolButton.backgroundColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1)
            schoolSelectionView.schoolLabel.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
            schoolSelectionView.arrowImage.image = UIImage(systemName: "chevron.up")
        }
        else {
            self.tableView.isHidden = true
            schoolButton.backgroundColor = UIColor.white
            schoolSelectionView.schoolLabel.textColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1)
            schoolSelectionView.arrowImage.image = UIImage(systemName: "chevron.down")
        }
    }
}

extension SchoolNameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolNameTableViewCell", for: indexPath) as? SchoolNameTableViewCell
        else { return UITableViewCell() }
        
        cell.setData(text: schoolList[indexPath.item])
        return cell
    }
    
    
}
