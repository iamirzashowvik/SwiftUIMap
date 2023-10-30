//
//  LocationViewModel.swift
//  SwiftUIMapApp
//
//  Created by Mirza Showvik on 29/10/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel:ObservableObject{
    
    
    
    
    
    @Published var locations:[Location]
    @Published var mapLocation:Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList:Bool=false
    @Published var sheetLocation:Location? = nil
    
    
    
    init(location: [Location]) {
        let locationX=LocationsDataService.locations
        self.locations = locationX
        self.mapLocation = locationX.first!
        self.updateMapRegion(location: locationX.first!)
    }
    
    private func updateMapRegion(location:Location){
        withAnimation(.easeInOut){
            mapRegion=MKCoordinateRegion(
                center:
                    location.coordinates,
                span: mapSpan
            )
        }
    }
    
    
     func toggleLocationsList(){
        withAnimation(.easeOut){
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation (location:Location){
        withAnimation(.easeOut){
            mapLocation=location
            showLocationsList=false
        }
    }
    
    func gotoNextLocation(location:Location){
        var locationIndex=0
        if let index = locations.firstIndex(of: location) {
            print("Index of the item: \(index)")
            if index+1 == locations.count{
                locationIndex=0
            }else{
                locationIndex=index+1
            }
        }

        withAnimation(.easeOut){
            mapLocation=locations[locationIndex]
            showLocationsList=false
        }
    }
    
    
    
    
    
}
