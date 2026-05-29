//
//  HomeViewModel.swift
//  Fitness
//
//  Created by Nadine Agbortarh on 29/05/2026.
//

import SwiftUI

class HomeViewModel:  ObservableObject {
    
    
   @Published var mockActivites = [   Activity(id: 0, title: "Today steps", subtitle: "Goal 15,000", image: "figure.walk",  tintColor: .blue, amount: "10000"),
        Activity(id: 1, title: "Today steps", subtitle: "Goal 15,000", image: "figure.walk",  tintColor: .red, amount: "10000"),
   
        Activity(id: 2, title: "Today steps", subtitle: "Goal 15,000", image: "figure.walk",  tintColor: .green, amount: "10000"),
        Activity(id: 3, title: "Today steps", subtitle: "Goal 15,000", image: "figure.walk",  tintColor: .yellow, amount: "10000"),
   
    ]
    var mockWorkouts = [
         Workout(id: 0, title: "Running", Image: "figure.run", tintColor:.cyan, date: "51 mins", calories: "Aug 23,2021", duration: "500" ),
         Workout(id: 1, title: "Strength Running", Image: "figure.run", tintColor:.cyan, date: "51 mins", calories: "Aug 23,2021", duration: "500" ),
         Workout(id: 2, title: "Walk", Image: "figure.run", tintColor:.cyan, date: "51 mins", calories: "Aug 23,2021", duration: "500" ),
      Workout(id: 3, title: "Running", Image: "figure.run", tintColor:.cyan, date: "51 mins", calories: "Aug 23,2021", duration: "500" ),
        
    ]
    
      
}
