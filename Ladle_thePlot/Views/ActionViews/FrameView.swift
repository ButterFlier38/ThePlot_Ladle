

import SwiftUI

struct FrameView: View {
  var image: CGImage?

  private let label = Text("Video feed")

  var body: some View {
    if let image = image {
      GeometryReader { geometry in
        Image(image, scale: 1.0, orientation: .upMirrored, label: label)
          .resizable()
          .scaledToFill()
          .frame(
            width: geometry.size.width,
            height: geometry.size.height,
            alignment: .center)
          .clipped()
      }
    } else {
//      EmptyView()
        
        GeometryReader { geometry in
        Circle().fill(CustomColor.selectiongreen).grayscale(0.2)
                .frame(
                  width: geometry.size.width,
                  height: geometry.size.height,
                  alignment: .center)
            .overlay(Image(systemName: "arrow.forward").resizable().scaledToFit().foregroundColor(.white).scaleEffect(0.55))
        }
    }
  }
}

struct CameraView_Previews: PreviewProvider {
  static var previews: some View {
    FrameView(image: nil)
  }
}
