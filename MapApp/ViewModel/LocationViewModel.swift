//
//  LocationViewModel.swift
//  MapApp
//
//  Created by Thiago Lourenço on 18/03/26.
//


//@State var position: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion(
//    center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//    
//))

import Foundation
import MapKit
import SwiftUI
import Observation

@Observable
class LocationViewModel {
    var locations: [LocationModel] = []
    var mapLocation: LocationModel {
        didSet {
            updateRegion(location: mapLocation)
        }
    }
    var showList: Bool = false

    
    var mapPosition: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion())
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateRegion(location: locations.first!)
    }
    
    private func updateRegion(location: LocationModel) {
        print("teste",location)
        withAnimation(.easeOut) {
            mapPosition = .region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
    
    func showLocations() {
        withAnimation(.easeInOut) {
            showList = !showList
        }
    }
    
    func nextLocation(location: LocationModel) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showList = false
        }
    }
}

