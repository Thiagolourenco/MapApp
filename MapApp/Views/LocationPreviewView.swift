//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by Thiago Lourenço on 21/03/26.
//

import SwiftUI

struct LocationPreviewView: View {
    let location: LocationModel
    @Environment(LocationViewModel.self) var viewModel: LocationViewModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageView
                
                groupText
            }
            
            groupButton
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.ultraThinMaterial)
                .offset(y: 60)
        )
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()
    }
}

#Preview {
    ZStack {
        Color.blue.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .environment(LocationViewModel())

    }
}

extension LocationPreviewView {
    private var imageView: some View {
        ZStack(alignment: .leading) {
            if let imagePreview = location.imageNames.first {
                Image(imagePreview )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }

        }
        .padding(6)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var groupText: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .bold()
            Text(location.cityName)
                .font(.headline)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var groupButton: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button {
                
            } label: {
                Text("Lear more")
                    .font(.subheadline)
                    .frame(width: 123)
            }
            .buttonStyle(.borderedProminent)

            Button {
                viewModel.nextItem(location: location)
            } label: {
                Text("Next")
                    .frame(width: 123)

            }
            .buttonStyle(.bordered)

        }

    }
}
