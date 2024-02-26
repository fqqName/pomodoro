//
//  MainView.swift
//  PomodoroV2
//
//  Created by Pascal on 22.02.24.
//

import Foundation
import UIKit
import SnapKit

class MainView: UIView {
    
    weak var viewController: MainScreenViewController?
    var viewModel: MainScreenViewModel?
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textAlignment = .center
        return label
    }()
    
    var timerLabel: UILabel = {
        let timer = UILabel()
        timer.text = "30:00"
        timer.textColor = UIColor.white
        timer.font = UIFont.boldSystemFont(ofSize: 30)
        timer.textAlignment = .center
        return timer
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(timerLabel)
        stackView.addArrangedSubview(startButton)
        stackView.addArrangedSubview(resetButton)
        
        label.textAlignment = .center
        timerLabel.textAlignment = .center
        startButton.titleLabel?.textAlignment = .center
        resetButton.titleLabel?.textAlignment = .center
        
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc private func startButtonTapped() {
        viewController?.startButtonAction()
    }
    
    @objc private func resetButtonTapped() {
        viewController?.resetButtonAction()
    }
}

