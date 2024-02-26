//
//  MainScreenViewController.swift
//  PomodoroV2
//
//  Created by Pascal on 19.02.24.
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    var flowMode = MainScreenModel()
//    var mainViewMainView: MainView{ return self.view as! MainView}
    var mainView: MainView!

    var viewModel: MainScreenViewModel?
 

    
    
    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }
    
    //При создании экземпляра MainView в  MainScreenViewController передаём ссылку на себя
    override func viewDidLoad() {
        super.viewDidLoad()
        
       configViewController()
    }
    
    private func configViewController(){
        view.backgroundColor = UIColor.blue
               
               flowMode = MainScreenModel()
       //        viewModel = MainScreenViewModel()
               
               mainView = MainView(frame: view.bounds)
               mainView.viewController = self
               mainView.viewController?.viewModel = viewModel
               view.addSubview(mainView)
               
               print(flowMode.duration)
               addTargetForMainScreenUI()
    }
    
    func startButtonAction(){
        print("Start Buttom Tapped")
        
    }
    
    func resetButtonAction(){
        print("Reset Button Tapped")
    }
        
    private func addTargetForMainScreenUI() {
        if let viewModel = viewModel {
            mainView.resetButton.addTarget(self, action: #selector(viewModel.resetFlow), for: .touchUpInside)
        } else {
            print("ViewModel is nil")
        }

    }
}
