//
//  ViewController.swift
//  Electrical Test
//
//  Created by Нурдаулет on 26.05.2024.
//

import UIKit
import SnapKit

class TestViewController: UIViewController {

        // MARK: - UI
    
    private let numberOfQuestionLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.backgroundColor = UIColor.systemIndigo
        label.layer.masksToBounds =  true
        label.layer.cornerRadius = 5
        return label
    }()

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.backgroundColor = UIColor.systemCyan
        label.layer.masksToBounds =  true
        label.layer.cornerRadius = 10
        return label
    }()

    private let firstButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        button.layer.cornerRadius = 10
        button.tag = 0
        return button
    }()

    private let secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        button.layer.cornerRadius = 10
        button.tag = 1
        return button
    }()

    private let thirdButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        button.layer.cornerRadius = 10
        button.tag = 2
        return button
    }()

    private let fourthButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        button.layer.cornerRadius = 10
        button.tag = 3
        return button
    }()

    private let fifthButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        button.layer.cornerRadius = 10
        button.tag = 4
        return button
    }()

        private var questions: [Question] = []
        private var currentQuestionIndex: Int = 0
        private var shuffledOptions: [String] = []
        private var correctAnswerIndex: Int = 0

        // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        view.backgroundColor = .white
        loadQuestions()
        questions.shuffle()
        showQuestion()
    }
    // MARK: - Setup Hierarchies
    private func setupViews() {
        view.backgroundColor = UIColor.black
        view.addSubview(numberOfQuestionLabel)
        view.addSubview(questionLabel)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.addSubview(fourthButton)
        view.addSubview(fifthButton)

        firstButton.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
        fourthButton.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
        fifthButton.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
    }

    private func setupConstraints() {
        numberOfQuestionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(50)
        }
        questionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(150)
            make.bottom.equalTo(questionLabel.snp.top).offset(150)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }

        firstButton.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp.leading)
            make.top.equalTo(questionLabel.snp.bottom).offset(50)
            make.trailing.equalTo(questionLabel.snp.trailing)
            make.bottom.equalTo(firstButton.snp.top).offset(70)
        }

        secondButton.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp.leading)
            make.top.equalTo(firstButton.snp.bottom).offset(20)
            make.trailing.equalTo(questionLabel.snp.trailing)
            make.bottom.equalTo(secondButton.snp.top).offset(70)
        }

        thirdButton.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp.leading)
            make.top.equalTo(secondButton.snp.bottom).offset(20)
            make.trailing.equalTo(questionLabel.snp.trailing)
            make.bottom.equalTo(thirdButton.snp.top).offset(70)
        }

        fourthButton.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp.leading)
            make.top.equalTo(thirdButton.snp.bottom).offset(20)
            make.trailing.equalTo(questionLabel.snp.trailing)
            make.bottom.equalTo(fourthButton.snp.top).offset(70)
        }

        fifthButton.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp.leading)
            make.top.equalTo(fourthButton.snp.bottom).offset(20)
            make.trailing.equalTo(questionLabel.snp.trailing)
            make.bottom.equalTo(fifthButton.snp.top).offset(70)
        }
    }

    // MARK: - Controller options
    private func loadQuestions() {
        if let url = Bundle.main.url(forResource: "questions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                questions = try decoder.decode([Question].self, from: data)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }

    private func showQuestion() {
        guard currentQuestionIndex < questions.count else {
            print("Конец викторины.")
            return
        }

        let currentQuestion = questions[currentQuestionIndex]
        print("\(currentQuestion.question)")
        questionLabel.text = currentQuestion.question
        shuffledOptions = currentQuestion.options
        shuffledOptions.shuffle()

        firstButton.setTitle(shuffledOptions[0], for: .normal)
        secondButton.setTitle(shuffledOptions[1], for: .normal)
        thirdButton.setTitle(shuffledOptions[2], for: .normal)
        fourthButton.setTitle(shuffledOptions[3], for: .normal)
        fifthButton.setTitle(shuffledOptions[4], for: .normal)

        correctAnswerIndex = shuffledOptions.firstIndex(of: currentQuestion.options[currentQuestion.correctAnswer]) ?? 0

    }

    @objc private func optionSelected(_ sender: UIButton) {
        guard currentQuestionIndex < questions.count else {
            print("Конец викторины.")
            return
        }

        let selectedOptionIndex = sender.tag
        let correctAnswerIndex = questions[currentQuestionIndex].correctAnswer

        if selectedOptionIndex == correctAnswerIndex {
            print("Правильный ответ!")
        } else {
            print("Неправильный ответ.")
        }
        currentQuestionIndex += 1
        numberOfQuestionLabel.text = "\(1 + currentQuestionIndex)"
        showQuestion()
    }
}

