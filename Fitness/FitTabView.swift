//
//  FitTabView.swift
//  Fitness
//
//  Created by Nadine Agbortarh on 28/05/2026.


import SwiftUI

struct FitTabView:  View {
    @State var selectedTab = "Home"
    
    init(){
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.stackedLayoutAppearance.selected.iconColor = .blue
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag("Home")
                .tabItem{
                    Image(systemName: "house")
                    
                    Text("Home")
                    
                }
            HistoricDataView()
                .tag("Historic")
                .tabItem{
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    
                    Text("Charts")
                }
            
        }
    }
}
struct FitTabView_Previw: PreviewProvider{
    static var previews: some View{
        FitTabView()
    }
}
