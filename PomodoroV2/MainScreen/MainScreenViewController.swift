//
//  MainScreenViewController.swift
//  PomodoroV2
//
//  Created by Pascal on 19.02.24.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    var flowMode = MainScreenModel()
    var timeLabel = UILabel()
    weak var viewModel: MainScreenViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
        print(flowMode.duration)
    }
    
    func updateTimerLabel(_ timeString: String) {
        timeLabel.text = timeString
    }
    
}
