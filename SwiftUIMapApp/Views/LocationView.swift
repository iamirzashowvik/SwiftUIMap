//
//  LocationView.swift
//  SwiftUIMapApp
//
//  Created by Mirza Showvik on 29/10/23.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject private var vm:LocationViewModel
    
    
    var body: some View {
        List{
            ForEach(vm.locations){
                Text($0.name)
            }
            
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView().environmentObject(LocationViewModel(location: []))
    }
}
