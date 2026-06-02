//
//  HealthManger.swift
//  Fitness
//
//  Created by Nadine Agbortarh on 01/06/2026.
//

import Foundation
import HealthKit

class HealthManager{
    
   static  let shared = HealthManager()
    
    let healthStore = HKHealthStore()
    
    
    private init (){
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise  = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        
        let healthTypes: Set = [calories, exercise, stand]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: [] )
            } catch{
                
                print(error.localizedDescription)
            }
        }
        
    }
    func fetchTodayCaloriesBurned(completion: @escaping(Result<Double, Error>)  -> void) {
        
        let calories = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStat
    }
    
}
