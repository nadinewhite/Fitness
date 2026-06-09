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
        
        let _: Set = [calories, exercise, stand]
       
        
        Task {
            do {
                try await requestHealthKitAccess()
            } catch{
                
                print(error.localizedDescription)
            }
        }
        
    }
    
    func requestHealthKitAccess()
    async throws{
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise  = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        
        let _: Set = [calories, exercise, stand]
      
    }

    func fetchTodayCaloriesBurned(completion: @escaping(Result<Double, Error>)  -> Void) {
        
        let calories = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, results, error in guard let quantity = results?.sumQuantity(), error == nil else { completion(.failure(NSError()))
            return
        }
            let calorriesCount = quantity.doubleValue(for: .kilocalorie(),
                                                      completion(.success(caloriesCount)))
            
        }
        healthStore.execute(query)
    }
    func fetchTodayExerciseTime(completion: @escaping(Result<Double, Error>)  -> Void) {
        
        let exercise = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        
        let query = HKStatisticsQuery(quantityType: exercise, quantitySamplePredicate: predicate) { _, results, error in guard let quantity = results?.sumQuantity(), error == nil else { completion(.failure(NSError()))
            return
        }
            let exerciseTime  = quantity.doubleValue(for: .minute())
                                                      completion(.success(exerciseTime))
            
        }
        healthStore.execute(query)
    }
    func fetchTodayStandHours(completion: @escaping(Result<Double, Error>)  -> Void) {
        
        let stand = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, results, error in guard let samples = results  as? [HKQuantitySample ], error == nil else { completion(.failure(NSError()))
            return
        }
           print(samples)
            print(samples.map({ $0.quantity}))
            let standCount = samples.filter({ $0.value == 0}).count
            completion(.success(standCount))
            
        }
        healthStore.execute(query)
    }
    func fetchTodaySteps(completion: @escaping(Result<Double, Error>) {}
}
