//
//  ProgressCircleView.swift
//  Fitness
//
//  Created by Nadine Agbortarh on 28/05/2026.
//

import SwiftUI

struct ProgressCircleView: View {
    @Binding var progress: Int
    var goal: Int
    var color: Color
    private let width: CGFloat = 20
    
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.blue.opacity(0.4), lineWidth: 20)
            
            Circle()
                .trim(from: 0, to: CGFloat(progress) / CGFloat(goal))
                .stroke(.blue, style:  StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
                
        }
        .padding()
    }
}
struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(progress: .constant(100), goal: 200, color: .blue)
    }
}

