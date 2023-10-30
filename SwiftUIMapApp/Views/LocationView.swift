//
//  LocationView.swift
//  SwiftUIMapApp
//
//  Created by Mirza Showvik on 29/10/23.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @EnvironmentObject private var vm:LocationViewModel
    
    
    
    var body: some View {
        ZStack{
          mapLayer .ignoresSafeArea()
            
           
            VStack(spacing:0){
                header
                    .padding()
                Spacer()
              bottomStack
            }
        }.sheet(item: $vm.sheetLocation, onDismiss: nil ){ location in
            LocationDetailView(location: location)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView().environmentObject(LocationViewModel(location: []))
    }
}


extension LocationView{
    
    private var header:some View{
        VStack {
            Button(action: vm.toggleLocationsList){
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName).font(.title2).fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .animation(.easeIn, value: vm.mapLocation)
                    .overlay(alignment: .leading ){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            
            if vm.showLocationsList{
                LocationsListView()
            }
        }.background(.thickMaterial)
            .cornerRadius(10)
            .shadow(color:Color.black.opacity(0.3), radius: 20,x:0,y:15)
            
    }
    
    private var mapLayer:some View{
        Map( coordinateRegion: $vm.mapRegion,
             annotationItems: vm.locations,
             annotationContent: { location in
//                MapMarker(coordinate: location.coordinates,tint: .red)
            MapAnnotation(coordinate: location.coordinates){
                LocationMapAnnotation()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7 )
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    private var bottomStack: some View{
        ZStack{
            ForEach (vm.locations){ location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color:Color.black.opacity(0.3),
                                radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }                }
    }
}
