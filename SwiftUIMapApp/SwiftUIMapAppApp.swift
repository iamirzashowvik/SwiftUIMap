//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by Mirza Showvik on 28/10/23.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    @StateObject private var vm=LocationViewModel(location: [])
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LocationView().environmentObject(vm)
        }
    }
}
