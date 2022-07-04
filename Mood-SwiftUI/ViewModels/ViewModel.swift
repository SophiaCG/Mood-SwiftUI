//
//  ViewModel.swift
//  Mood-SwiftUI
//
//  Created by Sophia Gorgonio on 7/3/22.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var moods: [String] = []
    @Published var activities: [String] = []

    func addDeleteMood(mood: String) {
        if checkMoods(mood: mood) {
            if let index = moods.firstIndex(of: mood) {
                moods.remove(at: index)
            }
        } else {
            moods.append(mood)
        }
    }
    
    func checkMoods(mood: String) -> Bool {
        moods.contains(mood)
    }
    
    func addDeleteActivity(activity: String) {
        if checkActivities(activity: activity) {
            if let index = activities.firstIndex(of: activity) {
                activities.remove(at: index)
            }
        } else {
            activities.append(activity)
        }
    }
    
    func checkActivities(activity: String) -> Bool {
        activities.contains(activity)
    }

}
