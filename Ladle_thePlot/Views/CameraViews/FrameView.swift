//
//  FrameView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 08/03/22.
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
                    
                Path { path in
                    path.move(to: CGPoint(x: 200, y: 100))
                    path.addLine(to: CGPoint(x: 100, y: 300))
                   
                }.foregroundColor(.white).opacity(0.3)
            }
        }
    }
}



import AVFoundation

class FrameManager: NSObject, ObservableObject {
  static let shared = FrameManager()

  @Published var current: CVPixelBuffer?

  let videoOutputQueue = DispatchQueue(
    label: "ladle.video",
    qos: .userInitiated,
    attributes: [],
    autoreleaseFrequency: .workItem)

  private override init() {
    super.init()

    CameraManager.shared.set(self, queue: videoOutputQueue)
  }
}

extension FrameManager: AVCaptureVideoDataOutputSampleBufferDelegate {
  func captureOutput(
    _ output: AVCaptureOutput,
    didOutput sampleBuffer: CMSampleBuffer,
    from connection: AVCaptureConnection
  ) {
    if let buffer = sampleBuffer.imageBuffer {
      DispatchQueue.main.async {
        self.current = buffer
      }
    }
  }
}


struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView(image: nil)
    }
}
