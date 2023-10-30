//
//  LocationsListView.swift
//  SwiftUIMapApp
//
//  Created by Mirza Showvik on 29/10/23.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm:LocationViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations){ location in
                Button{
                    vm.showNextLocation(location: location)
                } label: {
                    ListRowView(location: location)
                }
                    .padding(.vertical,4)
                    .listRowBackground(Color.clear)
            }
        }.listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView().environmentObject(LocationViewModel(location: []))
    }
}

extension LocationsListView{
    private func ListRowView(location:Location)-> some View{
        HStack {
            if let imageName=location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45,height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment:.leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }.frame(maxWidth:.infinity,alignment: .leading)
        }
    }
    
}
