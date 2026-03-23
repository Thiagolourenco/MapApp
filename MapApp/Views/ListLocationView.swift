//
//  ListLocationView.swift
//  MapApp
//
//  Created by Thiago Lourenço on 20/03/26.
//

import SwiftUI

struct ListLocationView: View {
    @Environment(LocationViewModel.self) var viewModel: LocationViewModel
    
    var body: some View {
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
    }
}

#Preview {
    ListLocationView()
        .environment(LocationViewModel())
}
