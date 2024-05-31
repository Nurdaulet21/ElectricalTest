//
//  MainViewController.swift
//  Electrical Test
//
//  Created by Нурдаулет on 28.05.2024.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mainImage2")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let testButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemCyan
        button.setTitle("Test", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    private let rulesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemCyan
        button.setTitle("Rules", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraits()

        testButton.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
        rulesButton.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
    }

    private func setupViews() {
        view.addSubview(mainImageView)
        view.addSubview(testButton)
        view.addSubview(rulesButton)

        view.backgroundColor = .white
    }

    private func setupConstraits() {

        mainImageView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }

        testButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(100)
            make.top.equalToSuperview().offset(300)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(100)
        }

        rulesButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(100)
            make.top.equalTo(testButton.snp.bottom ).offset(50)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(100)
        }
    }

    @objc func testButtonTapped() {
        let nextVC = TestViewController()
        navigationController?.pushViewController(nextVC, animated: true)
        print("tapped")
    }

    @objc func rulesButtonTapped() {
        let nextVC = RulesViewController()
        navigationController?.pushViewController(nextVC, animated: true)
        print("tapped")
    }


}
