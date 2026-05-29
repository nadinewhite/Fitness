//
//  HomeView.swift
//  Fitness
//
//  Created by Nadine Agbortarh on 28/05/2026.
//

import SwiftUI



struct HomeView: View {
    @State var calories : Int = 123
    @State var active : Int = 123
    @State var stand : Int = 8
    
    var mockActivities = [
        Activity(id: 0, title: "Today steps", subtitle: "Goal 15,000", image: "figure.walk",  tintColor: .blue, amount: "10000"),
        Activity(id: 1, title: "Today steps", subtitle: "Goal 15,000", image: "figure.walk",  tintColor: .red, amount: "10000"),
   
        Activity(id: 2, title: "Today steps", subtitle: "Goal 15,000", image: "figure.walk",  tintColor: .green, amount: "10000"),
        Activity(id: 3, title: "Today steps", subtitle: "Goal 15,000", image: "figure.walk",  tintColor: .yellow, amount: "10000"),
   
    ]
        
        
    
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
                
                HStack{
                    Spacer()
                    VStack {
                        VStack(alignment: .leading, spacing: 8){
                            Text("Calories")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.blue)
                            
                            Text("120 kg")
                                .bold()
                            
                        }
                        .padding(.bottom)
                        VStack(alignment: .leading, spacing: 8){
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.blue)
                            
                            Text(" 30 mins")
                                .bold()
                            
                        }
                        .padding(.bottom)
                        VStack(alignment: .leading, spacing: 8){
                            Text("Stand")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.blue)
                            
                            Text("8 hours")
                                .bold()
                            
                        }
                    }
                    Spacer()
                   
                    ZStack{
                        ProgressCircleView(progress: $calories, goal: 600, color: .blue)
                        
                        ProgressCircleView(progress: $active, goal: 60, color: .red)
                            .padding(.all,20)
                        
                        ProgressCircleView(progress: $stand, goal: 12, color: .blue)
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
                        print("How more")
                        
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
                    
                    ForEach(mockActivities, id: \.id){
                        activity in ActivityCard(activity:  activity)
                    }
                  
                   
                }.padding(.horizontal)
                
            }
            
        }
    }
    
}


#Preview {
    HomeView()
}
