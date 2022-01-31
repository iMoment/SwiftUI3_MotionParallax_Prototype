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
    
    init() {
        fetchMotionData()
    }
    
    func fetchMotionData() {
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
            
            print(data.attitude)
        }
    }
}
