//
//  LocationMapAnnotation.swift
//  SwiftUIMapApp
//
//  Created by Mirza Showvik on 30/10/23.
//

import SwiftUI

struct LocationMapAnnotation: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack (spacing:0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .foregroundColor(Color.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width:10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-3)
                .padding(.bottom,40)
               
        }
    }
}

struct LocationMapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotation()
    }
}
