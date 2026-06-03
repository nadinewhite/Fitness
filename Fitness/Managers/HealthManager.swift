//
//  HealthManger.swift
//  Fitness
//
//  Created by Nadine Agbortarh on 01/06/2026.
//

import Foundation
import HealthKit

extension Date {
    
    static var startOfDay: Date {
        let calender = Calendar.current
        return calender.startOfDay(for: Date())
        
    }
}

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
        let query = HKStatisticsQuery(quantityTypes: calories, quantitySamplePredicate: predicate) { _, results, error in guard let quantity = results?.sumQuantity(), error == nil else { completion(.failure(NSError()))
            return
        }
            let calorriesCount = quantity.doubleValue(for: .kilocalorie()
                                                      completion(.success(caloriesCount)))
            
        }
        healthStore.exceute(query)
    }
    func fetchTodayExerciseTime(completion: @escaping(Result<Double, Error>)  -> void) {
        
        let exercise = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        
        let query = HKStatisticsQuery(quantityTypes: calories, quantitySamplePredicate: predicate) { _, results, error in guard let quantity = results?.sumQuantity(), error == nil else { completion(.failure(NSError()))
            return
        }
            let calorriesCount = quantity.doubleValue(for: .kilocalorie()
                                                      completion(.success(caloriesCount)))
            
        }
        healthStore.exceute(query)
    }
    
}
