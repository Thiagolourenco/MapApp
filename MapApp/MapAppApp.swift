//
//  MapAppApp.swift
//  MapApp
//
//  Created by Thiago Lourenço on 18/03/26.
//

import SwiftUI

@main
struct MapAppApp: App {
    var body: some Scene {
        @State var viewModel: LocationViewModel = LocationViewModel()
        
        WindowGroup {
            LocationView()
                .environment(viewModel)
        }
    }
}
