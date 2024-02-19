//
//  MainScreenModel.swift
//  PomodoroV2
//
//  Created by Pascal on 19.02.24.
//

import Foundation


struct MainScreenModel{
    var duration: TimeInterval
    var timeRemainig: TimeInterval
    var isRunning: Bool
    
    init() {
        duration = 25
        timeRemainig = 10
        isRunning = false
    }
}


enum FlowState {
    
    case idle
    case working
    case resting
    
}

class FlowModel {
    var data = MainScreenModel()
    
    var state: FlowState = .idle
    var workDutation: TimeInterval
    
    init() {
        
        workDutation = data.duration
    }
//    var workDuration: TimeInterval = self.data.duration
//    var restDuration: TimeInterval =

    func toggleState() {
        switch state {
        case .idle:
            state = .working
        case .working:
            state = .resting
        case .resting:
            state = .idle
        }
    }
    
}

