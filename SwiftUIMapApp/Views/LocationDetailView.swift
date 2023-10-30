//
//  LocationDetailView.swift
//  SwiftUIMapApp
//
//  Created by Mirza Showvik on 30/10/23.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject var vm: LocationViewModel
    let location:Location
    let colors: [Color] = [.red, .green, .blue]
    var body: some View {
        ScrollView {
            
                        
                  
            imageSection
                .shadow(color:Color.black.opacity(0.3), radius: 20,x:0,y:10)
            VStack(alignment: .leading, spacing: 16){
               titleSection
                Divider()
                descriptionSection
                Divider()
                mapLayer
                
            }
            .frame(maxWidth: .infinity,alignment:.leading)
            .padding()
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton,alignment: .topLeading)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
    }
}

extension LocationDetailView{
    private var imageSection:some View{
        
        TabView{
            ForEach (location.imageNames,id: \.self){
                Image($0)
                    .resizable()
                    .scaledToFill()
                    
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View{
        VStack(alignment: .leading, spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }

    }
    private var descriptionSection: some View{
        VStack(alignment: .leading, spacing: 8){
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Link("Read More on Wikipedia", destination: URL(string: location.link)!)
                .font(.headline)
                .foregroundColor(.blue)
        }
       
    }
    
    
    private var mapLayer:some View{
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))),
                            annotationItems: [location],
                            annotationContent: { location in
                                MapAnnotation(coordinate: location.coordinates){
                                          LocationMapAnnotation()
                                              .shadow(radius: 10)
                                
                        }
        })
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
        
        
    }
    
    private var backButton:some View{
        Button{
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundColor(.primary)
                .padding(16)
                .background(.thickMaterial)
                .cornerRadius(20)
                .shadow(radius:4)
                .padding()
        }
        
        
        
    }
}
