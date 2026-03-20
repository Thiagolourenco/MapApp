//
//  LocationModel.swift
//  MapApp
//
//  Created by Thiago Lourenço on 18/03/26.
//

import Foundation
import MapKit

struct LocationModel: Identifiable, Equatable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + "-" + cityName
    }
    
    static func == (lhs: LocationModel, rhs: LocationModel) -> Bool {
        lhs.id == rhs.id
    }
}

