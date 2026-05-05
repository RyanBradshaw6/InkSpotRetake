//
//  Tattoo.swift
//  InkSpotRetake
//
//  Created by Ryan Bradshaw on 5/4/26.
//

import Foundation
import SwiftData

@Model
class Tattoo{
    
    var tatDescription: String
    var location = TatLocation.torso
    var notes: String
    
    init(tatDescription: String, location: TatLocation = TatLocation.torso, notes: String) {
        self.tatDescription = tatDescription
        self.location = location
        self.notes = notes
    }
    convenience init(){
        self.init(tatDescription: "", notes: "")
    }
}

extension Tattoo{
    @MainActor
    static var preview: ModelContainer{
        let container = try! ModelContainer(for: Tattoo.self,
                                            configurations: ModelConfiguration(isStoredInMemoryOnly:true))
        container.mainContext.insert(Tattoo(tatDescription: "Wu-Tang Last Supper", location: .back, notes: "Wu-tang is for the children"))
        container.mainContext.insert(Tattoo(tatDescription: "Mom", location: .left_arm, notes: "Mom you're always close to my heart"))
        container.mainContext.insert(Tattoo(tatDescription: "Thug Life", location: .torso, notes: "In memory of Tupac"))
        container.mainContext.insert(Tattoo(tatDescription: "Swift", location: .right_leg, notes: "On my calf. Stay Swifty!"))
        return container
    }
}
