//
//  InkSpotRetakeApp.swift
//  InkSpotRetake
//
//  Created by Ryan Bradshaw on 5/4/26.
//

import SwiftUI
import SwiftData

@main
struct InkSpotRetakeApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
        }
    }
    init(){
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
