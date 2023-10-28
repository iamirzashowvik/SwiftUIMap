//
//  LocationViewModel.swift
//  SwiftUIMapApp
//
//  Created by Mirza Showvik on 29/10/23.
//

import Foundation


class LocationViewModel:ObservableObject{
    @Published var locations:[Location]
    init(location: [Location]) {
        let locationX=LocationsDataService.locations
        self.locations = locationX
    }
}
