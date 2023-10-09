//
//  breatheView.swift
//  selfCheck
//
//  Created by Abdulaziz Jamaleddin on 10/5/23.
//

import SwiftUI
struct breatheView: View {
    @State var startAnimation = true
    
    var body: some View {
        //
        
        //        ZStack{
        //            Circle().foregroundColor(.teal).blur(radius: 40)
        //
        //            Image("cloudButton")
        //                .resizable()
        //                .scaledToFill()
        //                .clipShape(Circle())
        //                .overlay(
        //                    Text("Breathe")
        //                        .font(.title)
        //
        //                        .foregroundColor(.white)
        //
        //                )
        //        }
        ZStack{
            ZStack {
                ForEach((0...2), id: \.self) {circleSetNumber in
                    ZStack {
                        Circle().fill(LinearGradient(gradient: Gradient(colors: [.teal,.blue]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 100, height: 100)
                            .offset(y: startAnimation ? 50 : 0)
                        
                        
                        Circle().fill(LinearGradient(gradient: Gradient(colors: [.blue,.teal]), startPoint: .bottom, endPoint: .top))
                            .frame(width: 100, height: 100)
                            .offset(y: startAnimation ? -50 : 0)
                     
                        
                    }
                    .opacity(0.5)
                    .rotationEffect(.degrees(startAnimation ? Double(circleSetNumber*60) : 0))
                    .scaleEffect(startAnimation ? 1 : 0.99)
                    .onAppear {
                        withAnimation(.easeInOut.repeatForever(autoreverses: startAnimation).speed(0.06)) {
                            startAnimation.toggle()
                            
                        }
                    }
                }
            }
            Text("Breathe")
                .font(.title)
            
                .foregroundColor(.white)
            
        }
        //
    }
}

#Preview {
    breatheView()
}
