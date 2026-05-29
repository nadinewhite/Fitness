//
//  WorkoutCaord.swift
//  Fitness
//
//  Created by Nadine Agbortarh on 29/05/2026.
//

import SwiftUI



struct WorkoutCard: View {
    @State var workout: Workout
    var body: some View {
        HStack{
            Image(systemName: workout.Image)
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundColor(workout.tintColor)
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack (spacing: 12){
                HStack {
                    Text(workout.title)
                        .font(.title)
                        .bold()
                   Spacer()
                    
                    Text(workout.duration)
                }
               
          
            
                HStack{
                    
                    Text(workout.date)
                    
                    Spacer()
                    
                    Text(workout.calories)
                        
                }
            }
            
            
        }.padding(.horizontal)
    }
}
struct WorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCard(workout: Workout(id: 0, title: "Running", Image: "figure.run", tintColor:.cyan, date: "51 mins", calories: "Aug 23,2021", duration: "500" ))
        
    }
}


