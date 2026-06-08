//
//  HomeViewModel.swift
//  Fitness
//
//  Created by Nadine Agbortarh on 29/05/2026.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    let healthManger = HealthManager.shared
    
    @Published var calories: String = "0"
    @Published var exercise: String = "0"
    @Published var stand: String = "0"
    @Published var activities: [Activity] = []

    var mockActivities = [
        Activity(id: 0, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .blue,   amount: "10000"),
        Activity(id: 1, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .red,    amount: "10000"),
        Activity(id: 2, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .green,  amount: "10000"),
        Activity(id: 3, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .yellow, amount: "10000"),
    ]

    var mockWorkouts = [
        Workout(id: 0, title: "Running",          Image: "figure.run", tintColor: .cyan, date: "Aug 23, 2021", calories: "500", duration: "51 mins"),
        Workout(id: 1, title: "Strength Training", Image: "figure.run", tintColor: .cyan, date: "Aug 23, 2021", calories: "500", duration: "51 mins"),
        Workout(id: 2, title: "Walk",             Image: "figure.run", tintColor: .cyan, date: "Aug 23, 2021", calories: "500", duration: "51 mins"),
        Workout(id: 3, title: "Running",          Image: "figure.run", tintColor: .cyan, date: "Aug 23, 2021", calories: "500", duration: "51 mins"),
    ]
    
    init() {
        Task {
            do {
                try await HealthManager.requestHealthKitAccess()
                
                
            }catch{
                print(error.localizedDescription)
            }
        }
        
        
        
    }
    func fetchTodayCalories(){
        healthManger.fetchTodayCaloriesBurned  { result in
            switch result {
            case.success(let calories):
                DispatchQueue.main.async {
                    self.calories = "\(calories)"
            case.failure(let failure):
                print(failure.localizedDescription)
            }}
    }
    
    func fetchTodayExerciseTime(){
        healthManger.fetchTodayExerciseTime {
            result in switch result {
            case.success(let exercise):
                DispatchQueue.main.async {
                    self.exercise= "\(exercise)"
            case.failure(let failure):
                print(failure.localizedDescription)
                
            }
        }
    }
    
    func fetchTodayStandHour(){
        healthManger.fetchTodayStandHours{ result  in
            switch result {
            case.success(let stand):
                DispatchQueue.main.async {
                    self.stand = "\(hours)"
                }
            case.failure(let failure):
                print(failure.localizedDescription)
            }}
    }
}
