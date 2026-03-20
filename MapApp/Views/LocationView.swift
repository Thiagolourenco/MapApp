//
//  LocationView.swift
//  MapApp
//
//  Created by Thiago Lourenço on 18/03/26.
//

import SwiftUI
import MapKit

struct LocationView: View {
//    @State var viewModel: LocationViewModel = LocationViewModel()
    @Environment(LocationViewModel.self) var viewModel: LocationViewModel
    
    var body: some View {
        @Bindable var model = viewModel
        ZStack(alignment: .top) {
            Map(position: $model.mapPosition)
            
            VStack() {
                Button {
                    viewModel.showLocations()
                } label: {
                    Text("\(viewModel.mapLocation.name) - \(viewModel.mapLocation.cityName)")
                        .font(.headline)
                        .foregroundStyle(.gray)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .animation(.none, value: model.mapPosition)
                        .overlay(alignment: .leading, content: {
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .padding()
                                .foregroundStyle(.gray)
                                .rotationEffect(viewModel.showList ? Angle.degrees(180) : Angle.degrees(0))
                        })

                }

                if viewModel.showList {
                    List {
                        ForEach(viewModel.locations) { location in
                            Button {
                                viewModel.nextLocation(location: location)
                            } label: {
                                HStack {
                                    Image(location.imageNames[0])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                     
                                    VStack(alignment: .leading) {
                                        Text(location.cityName)
                                            .font(.headline)
                                        
                                        Text(location.name)
                                            .font(.callout)
                                            .foregroundStyle(.gray.opacity(0.9))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }

                           
                        }
                    }
                    .listStyle(.plain)
                }
              
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: Color.gray.opacity(0.3), radius: 9, x: 0, y: 8)
            .padding()
            
        }
    }
}

#Preview {
    LocationView()
        .environment(LocationViewModel())
}

