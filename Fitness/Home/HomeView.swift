//
//  HomeView.swift
//  Fitness
//
//  Created by Nadine Agbortarh on 28/05/2026.
//

import SwiftUI
internal import Combine





struct HomeView: View {
    
    @State var calories: Int = 123
    @State var active: Int = 123
    @State var stand: Int = 8
    
   
     
    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack{
                    Text("Welcome")
                        .font(.largeTitle)
                        .padding()
                    
                    HStack{
                        Spacer()
                        
                        VStack(alignment:  .leading){
                            VStack(alignment: .leading, spacing: 8){
                                Text("Calories")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.blue)
                                
                                Text("\(viewModel.calories)")
                                    .bold()
                                
                            }
                            .padding(.bottom)
                            VStack(alignment: .leading, spacing: 8){
                                Text("Active")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.blue)
                                
                                Text("\(viewModel.active)")
                                    .bold()
                                
                            }
                            .padding(.bottom)
                            VStack(alignment: .leading, spacing: 8){
                                Text("\(viewModel.Stand)")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.blue)
                                
                                Text("8 hours")
                                    .bold()
                                
                            }
                        }
                        Spacer()
                        
                        ZStack{
                            ProgressCircleView(progress: viewModel.calories, goal: 600, color: .blue)
                            
                            ProgressCircleView(progress: viewModel.active, goal: 60, color: .red)
                                .padding(.all,20)
                            
                            ProgressCircleView(progress: viewModel.stand, goal: 12, color: .blue)
                                .padding(.all,40)
                            
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        
                        
                    }
                    .padding()
                    HStack{
                        Text("Fitness Activity")
                            .font(.title2)
                        
                        Spacer()
                        Button {
                            print("show more")
                            
                        }label: {
                            Text("Show more")
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(20)
                            
                            
                        }
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count:  2)){
                        
                        ForEach(viewModel.mockActivites, id: \.id){
                            activity in ActivityCard(activity:  activity)
                        }
                        
                        
                    }
                    
                }.padding(.horizontal)
                HStack{
                    Text("Recent Workout")
                        .font(.title2)
                    
                    Spacer()
                    NavigationLink{
                        EmptyView()
                    }label: {
                        Text("Show more")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(20)
                        
                        
                    }
                    
                    
                    
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            LazyVStack {
                
                ForEach(viewModel.mockWorkouts, id: \.id){
                    workout in WorkoutCard(workout: workout)
                }
                
            }
            .padding(.bottom)
            
        }
    }
                
            
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
    
    




