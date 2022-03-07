//
//  FrameView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 04/03/22.
//

import SwiftUI
import UIKit


struct FrameView: View {
    var image: CGImage?
    
    private let label = Text("Video feed")
    
    var body: some View {
        if let image = image {
          GeometryReader { geometry in
                Circle().fill(CustomColor.selectiongreen).grayscale(0.2)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height,
                        alignment: .center)
                    .overlay(Image(image, scale: 1.0, orientation: .right, label: label)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle()))
            }
        } else {
            GeometryReader { geometry in
                Circle().fill(CustomColor.selectionblue).grayscale(0.2)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height,
                        alignment: .center)
                    .overlay(Image(systemName: "camera.fill")
                                .font(.system(size: 140.0, weight: .bold))
                                .grayscale(1)
                                .opacity(0.3))
            }
        }
    }
}






struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView(image: nil)
    }
}
