//
//  Location.swift
//  SwiftUIMapApp
//
//  Created by Mirza Showvik on 28/10/23.
//

import Foundation
import MapKit


struct Location : Identifiable , Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    var id:String{
        name+cityName
    }
    let name:String
    let cityName:String
    let coordinates: CLLocationCoordinate2D
    let description:String
    let imageNames:[String]
    let link:String

    
}
