//
//  MainScreenViewModel.swift
//  PomodoroV2
//
//  Created by Pascal on 19.02.24.
//

import Foundation
import UIKit

class MainScreenViewModel{
    
    private var mainScreenModel: MainScreenModel
    private var flowModel: FlowModel
    private var mainScreenView: MainScreenViewController?
    
    init(mainScreenModel: MainScreenModel, mainScreenView: MainScreenViewController, flowModel: FlowModel) {
        self.mainScreenModel = mainScreenModel
        self.mainScreenView  = mainScreenView
        self.flowModel = flowModel
    }
    
    func updateView(){
        guard let mainScreenView = mainScreenView else {return}
        let timeString = formatTime(mainScreenModel.timeRemainig)
        mainScreenView.updateTimerLabel(timeString)
    }
    
    func startFlow(){
        flowModel.toggleState()
        updateView()
    }
    
    func pauseFlow(){
//        mainScreenModel.timeRemainig
//        flowModel.workDutation
    }
    
    func resetFlow(){
        
    }
    
    private func formatTime(_ timeInterval: TimeInterval) -> String{
        let minutes = Int(timeInterval) / 60
        let sec = Int(timeInterval) % 60
        return String(format: "%02i:%02i", minutes, sec)
    }
}
