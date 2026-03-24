//
//  MarkerCustom.swift
//  MapApp
//
//  Created by Thiago Lourenço on 23/03/26.
//

import SwiftUI

struct MarkerCustom: View {
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .tint(accentColor)
                .foregroundStyle(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundStyle(.accent)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 35)
        }
    }
}

#Preview {
    MarkerCustom()
}
