//
//  MotionObserver.swift
//  MotionParallax
//
//  Created by Stanley Pan on 2022/01/31.
//

import SwiftUI
import CoreMotion

class MotionObserver: ObservableObject {
    // MARK: Motion Manager
    @Published var motionManager = CMMotionManager()
    
    // Storing Motion Data to animate view in parallax
    // Roll -> x-axis, Pitch -> y-axis
    @Published var xValue: CGFloat = 0
    @Published var yValue: CGFloat = 0
    
    // Moving Offset
    @Published var movingOffset: CGSize = .zero
    
    func fetchMotionData(duration: CGFloat) {
        // Calling motion updates handler
        motionManager.startDeviceMotionUpdates(to: .main) { data, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("Error in Data")
                return
            }
            
            withAnimation {
                self.xValue = data.attitude.roll
                self.yValue = data.attitude.pitch
                self.movingOffset = self.getOffset(duration: duration)
            }
        }
    }
    
    func getOffset(duration: CGFloat) -> CGSize {
        let width = xValue * duration
        let height = yValue * duration
        
        return CGSize(width: width, height: height)
    }
}
