//
//  breathAnimation.swift
//  selfCheck
//
//  Created by Abdulaziz Jamaleddin on 10/5/23.
//

import SwiftUI


struct breathAnimation: View {
    @State var startAnimation = false
    @State var animation = false


    var body: some View {
        ZStack {
            Circle().foregroundColor(.teal).blur(radius: 40)
            
            ForEach((0...2), id: \.self) {circleSetNumber in
                ZStack {
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.teal,.blue, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 150, height: 150)
                        .offset(y: startAnimation ? 75 : 0)
                    
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.blue,.teal, .white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 150, height: 150)
                        .offset(y: startAnimation ? -75 : 0)
                }
                .opacity(0.5)
                .rotationEffect(.degrees(startAnimation ? Double(circleSetNumber*60) : 0))
                .scaleEffect(startAnimation ? 1 : 0.2)
                .onAppear {
                    
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.08)) {
                        startAnimation.toggle()
                        
                    }
                 
                    
                }
                
            }
        }
        
//        
//        if (animation){
//            Text("Exhale")
//            
//        }else{
//            Text("Inhale")
//            
//        }
    }
    
    
}

#Preview {
    breathAnimation()
}
