//
//  DayNightView.swift
//  DayNightChallenge
//
//  Created by mohsen mokhtari on 8/9/23.
//

import SwiftUI

struct DayNightView: View {
    @State private var lineHeight:CGFloat = 90;
    @State private var isNight:Bool = false
    @State private var backgroundColor =  Color.a2_100
    @State private var leadingPadding:CGFloat = -150
    @State private var moonColor = Color.yellow
        
        var simpleDrag: some Gesture {
            DragGesture()
                .onChanged { value in
                    if lineHeight < 150 {
                        lineHeight += 2
                    }
                }.onEnded{value in
                    if lineHeight >= 130 {
                        isNight.toggle()
                        moonColor = isNight ? .white : .yellow
                        backgroundColor = isNight ? .navyBlue : Color.a2_100
                        leadingPadding = isNight ? -25 : -150
                    }
                    
                    lineHeight  = 90
                    
                }
        }
        
        var fingerDrag: some Gesture {
            DragGesture()
        }
    
    var body: some View {
      
            
        ZStack{
            backgroundColor.ignoresSafeArea()
                .animation(.easeInOut, value: backgroundColor)
            VStack(spacing:0){
                Circle()
                    .foregroundColor(moonColor)
                    .animation(.easeInOut, value: moonColor)
                    .frame(width: 150,height: 150)
                    .overlay(alignment:.leading){
                        Circle()
                            .fill(backgroundColor)
                            .frame(width: 140,height: 140)
                            .padding(.leading,leadingPadding)
                            
                            .padding(.bottom,25)
                            .animation(.easeInOut, value: leadingPadding)
                            
                    }
                    .animation(.spring(response: 0.4, dampingFraction: 0.3), value: lineHeight)
                    
                Rectangle()
                    .fill(moonColor)
                    .frame(width: 2,height: lineHeight)
                    .animation(.spring(response: 0.4, dampingFraction: 0.3), value: lineHeight)
                    
                Circle()
                    .fill(moonColor)
                    .frame(width: 20,height: 20)
                    .gesture(
                             simpleDrag.simultaneously(with: fingerDrag)
                            )
                    .animation(.spring(response: 0.4, dampingFraction: 0.3), value: lineHeight)
                    
                    
                
            }.vAlign(.top)
                .offset(y:getRect().height/3)
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct DayNightView_Previews: PreviewProvider {
    static var previews: some View {
        DayNightView()
    }
}

