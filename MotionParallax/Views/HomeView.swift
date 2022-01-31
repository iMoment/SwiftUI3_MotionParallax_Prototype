//
//  HomeView.swift
//  MotionParallax
//
//  Created by Stanley Pan on 2022/01/31.
//

import SwiftUI

struct HomeView: View {
    
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
        }
        // Dark Mode Preference
        .environment(\.colorScheme, .dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
