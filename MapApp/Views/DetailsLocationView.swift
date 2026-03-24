//
//  DetailsLocationView.swift
//  MapApp
//
//  Created by Thiago Lourenço on 24/03/26.
//

import SwiftUI
import MapKit

struct DetailsLocationView: View {
    let location: LocationModel
    @Environment(LocationViewModel.self) private var viewModel: LocationViewModel
    
    var body: some View {
        @Bindable var model = viewModel

        GeometryReader { proxy in
            let width = proxy.size.width
            ScrollView {
                imageSection(width: width)
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    
                    descriptionSection
                    
                    Divider()
                    
                    mapLayer(position: $model.mapPosition)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .frame(width: width)
            .background(.ultraThinMaterial)

       
        }
        .ignoresSafeArea()
        .overlay(backButton, alignment: .topLeading)

    }
}

#Preview {
    DetailsLocationView(location: LocationsDataService.locations.first!)
        .environment(LocationViewModel())
}

extension DetailsLocationView {
    private func imageSection(width: CGFloat) -> some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width)
                    .clipped()
            }
        }
        .tabViewStyle(.page)
        .frame(height: 500)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.title)
                .bold()
            Text(location.cityName)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.secondaryLabel))
        }
        
    }
 
    private var descriptionSection: some View {
        Text(location.description)
            .font(.subheadline)
            .foregroundStyle(Color(.secondaryLabel))
        
    }
    
    private var backButton: some View {
        Button {
            viewModel.showDetailsLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundStyle(.gray)
        }
        .frame(width: 32, height: 32)
        .background(.ultraThickMaterial.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()
    }
    
    private func mapLayer(position: Binding<MapCameraPosition>) -> some View {
        Map(position: position) {
            Annotation("", coordinate: location.coordinates) {
                MarkerCustom()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode:.fit)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

