//
//  TatLocation.swift
//  InkSpotRetake
//
//  Created by Ryan Bradshaw on 5/4/26.
//

import Foundation

enum TatLocation: String, CaseIterable, Codable {
    case face = "Face"
    case neck = "Neck"
    case torso = "Torso"
    case back = "Back"
    case left_arm = "Left Arm"
    case right_arm = "Right Arm"
    case left_leg = "Left Leg"
    case right_leg = "Right Leg"
    
    var emoji: String {
        switch self {
        case .face: return "😛"
        case .neck: return "🦒"
        case .torso: return "👕"
        case .back: return "🔙"
        case .left_arm: return "💪"
        case .right_arm: return "🦾"
        case .left_leg: return "🦵"
        case .right_leg: return "🦿"
        }
    }
    
}
