//
//  HomeView.swift
//  MotionParallax
//
//  Created by Stanley Pan on 2022/01/31.
//

import SwiftUI

struct HomeView: View {
    @StateObject var motionData = MotionObserver()
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let size = proxy.size
                
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(0)
                
                Color.black
                    .opacity(0.2)
            }
            // Blur overlay
            .overlay(.ultraThinMaterial)
            .ignoresSafeArea()
            
            GeometryReader { proxy in
                let size = proxy.size
                
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(motionData.movingOffset)
                    .frame(width: size.width * 2, height: size.height * 2)
                    // Applying offset to image to get parallax
                    .frame(width: size.width, height: size.height)
            }
            .frame(height: 450)
            .cornerRadius(25)
            .padding(.horizontal, 40)
            // Offset applied here
            .offset(motionData.movingOffset)
        }
        // Calling motion updater with duration
        .onAppear(perform: {
            // duration = how much you need to move the view in both sides
            // keep in mind: padding is 40
            motionData.fetchMotionData(duration: 30)
        })
        // Dark Mode Preference
        .environment(\.colorScheme, .dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
