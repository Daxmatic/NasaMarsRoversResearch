//
//  PhotoDetailView.swift
//  Nasa Mars Rovers
//
//  Created by Dax Hoes on 04/10/2021.
//

import SwiftUI

struct PhotoDetailView: View {
    @State var url:String

    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
                .scaledToFill()
                .statusBar(hidden: true)
                .navigationBarHidden(true)
        } placeholder: {
            ProgressView()
        }
        //.frame(width: 264, height: 480)
    }
}


struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(url: "http://localhost/images/FLR_0000_0666958220_664ECM_N0010052AUT_04096_00_2I3J01_1200.jpg")
    }
}
