//
//  LocationView.swift
//  MapApp
//
//  Created by Thiago Lourenço on 18/03/26.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @Environment(LocationViewModel.self) var viewModel: LocationViewModel
    
    var body: some View {
        @Bindable var model = viewModel
        ZStack(alignment: .top) {
            Map(position: $model.mapPosition) {
                ForEach(viewModel.locations) { location in
                    Annotation("asd", coordinate: location.coordinates) {
                        MarkerCustom()
                            .scaleEffect(location == viewModel.mapLocation ? 1 : 0.7)
                            .shadow(radius: 10)
                            .onTapGesture {
                                viewModel.nextLocation(location: location)
                            }
                    }
                }
            }

            VStack {
                header
          
                 Spacer()
                 
                 ZStack() {
                     ForEach(viewModel.locations) { location in
                         
                         if location == viewModel.mapLocation {
                             LocationPreviewView(location: location)
                                 .shadow(color: .black.opacity(0.5), radius: 50)
                                 .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                         }
                      
                     }
                 }
            }
        }
        .sheet(item: $model.showDetailsLocation) { (detailsLocation: LocationModel) in
            DetailsLocationView(location: detailsLocation)
        }
    }
}

#Preview {
    LocationView()
        .environment(LocationViewModel())
}

extension LocationView {
    private var header: some View {
        VStack {
            
            Button {
                viewModel.showLocations()
            } label: {
                Text("\(viewModel.mapLocation.name) - \(viewModel.mapLocation.cityName)")
                    .font(.headline)
                    .foregroundStyle(.gray)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.mapPosition)
                    .overlay(alignment: .leading, content: {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .padding()
                            .foregroundStyle(.gray)
                            .rotationEffect(viewModel.showList ? Angle.degrees(180) : Angle.degrees(0))
                    })

            }
            
            if viewModel.showList {
                ListLocationView()
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

