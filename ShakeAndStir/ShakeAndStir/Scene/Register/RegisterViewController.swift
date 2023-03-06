//
//  RegisterViewController.swift
//  ShakeAndStir
//
//  Created by Minhyun Cho on 2023/03/03.
//

import UIKit

import SnapKit

class RegisterViewController: UIViewController {
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름을 입력해 주세요."
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    var nameField: UITextField = {
        let field = UITextField()
        field.text = ""
        field.borderStyle = .roundedRect
        field.backgroundColor = .darkGray
        
        return field
    }()
    
    var flavorLabel: UILabel = {
        let label = UILabel()
        label.text = "선호하는 맛을 선택해 주세요."
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    var menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("여기를 클릭해서 선택해주세요", for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(showFlavorMenu), for: .touchUpInside)
        return button
    }()
    
    var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("계속해요", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        let backButton = UIBarButtonItem(title: "안할래요", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        
        setupView()
    }
    
    func setupView() {
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.left.equalToSuperview().inset(15)
        }
        
        view.addSubview(nameField)
        nameField.snp.makeConstraints {
            $0.left.equalTo(nameLabel.snp.left)
            $0.top.equalTo(nameLabel.snp.bottom)
        }
        
        view.addSubview(flavorLabel)
        flavorLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(15)
            $0.top.equalTo(nameField.snp.bottom).offset(15)
        }
        
        view.addSubview(menuButton)
        menuButton.snp.makeConstraints {
            $0.left.equalToSuperview().inset(15)
            $0.top.equalTo(flavorLabel.snp.bottom)
        }
        
//        view.addSubview(closeButton)
//        closeButton.snp.makeConstraints {
//            $0.left.equalToSuperview().inset(15)
//            $0.top.equalToSuperview().inset(30)
//        }
//
//        view.addSubview(confirmButton)
//        confirmButton.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.bottom.equalToSuperview().inset(50)
//        }
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil) // completion으로 로티 실행
    }
    
    // @objc 함수에서는 enum을 파라미터로 받을 수 없음.
    @objc func showFlavorMenu() {
        let flavor = "sour"
        var taste: String = ""
        switch flavor {
        case "sour":
            taste = "신맛"
        case "bitter":
            taste = "쓴맛"
        case "sweet":
            taste = "단맛"
        default:
            taste = "오류맛"
        }
        
        let menu = UIMenu(title: "선호하는 맛을 골라주세요.", children: [
            UIAction(title: "매우 \(taste)", handler: { _ in
                print("매우 \(taste)")
            }),
            UIAction(title: "보통 \(taste)", handler: { _ in
                print("보통 \(taste)")
            }),
            UIAction(title: "약간 \(taste)", handler: { _ in
                print("약간 \(taste)")
            }),
            UIAction(title: "\(taste) 없음", handler: { _ in
                print("없음 \(taste)")
            })
        ])
        
        menuButton.menu = menu
    }
}
