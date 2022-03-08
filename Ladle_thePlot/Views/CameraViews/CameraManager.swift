
import AVFoundation

class CameraManager: ObservableObject {
  enum Status {
    case unconfigured
    case configured
    case unauthorized
    case failed
  }

  static let shared = CameraManager()

//  @Published var error: CameraError?

  let session = AVCaptureSession()

  private let sessionQueue = DispatchQueue(label: "ladle.sesion")
  private let videoOutput = AVCaptureVideoDataOutput()
  private var status = Status.unconfigured

  private init() {
    configure()
  }

  private func configureCaptureSession() {
    guard status == .unconfigured else {
      return
    }

    session.beginConfiguration()

    defer {
      session.commitConfiguration()
    }

    let device = AVCaptureDevice.default(
      .builtInWideAngleCamera,
      for: .video,
      position: .back)
    guard let camera = device else {
//      set(error: .cameraUnavailable)
      status = .failed
      return
    }

    do {
      let cameraInput = try AVCaptureDeviceInput(device: camera)
      if session.canAddInput(cameraInput) {
        session.addInput(cameraInput)
      } else {
//        set(error: .cannotAddInput)
        status = .failed
        return
      }
    } catch {
//      set(error: .createCaptureInput(error))
      status = .failed
      return
    }

    if session.canAddOutput(videoOutput) {
      session.addOutput(videoOutput)

      videoOutput.videoSettings =
        [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]

      let videoConnection = videoOutput.connection(with: .video)
      videoConnection?.videoOrientation = .portrait
    } else {
//      set(error: .cannotAddOutput)
      status = .failed
      return
    }

    status = .configured
  }

  private func configure() {
//    checkPermissions()

    sessionQueue.async {
      self.configureCaptureSession()
      self.session.startRunning()
    }
  }

  func set(
    _ delegate: AVCaptureVideoDataOutputSampleBufferDelegate,
    queue: DispatchQueue
  ) {
    sessionQueue.async {
      self.videoOutput.setSampleBufferDelegate(delegate, queue: queue)
    }
  }
}

import CoreGraphics
import VideoToolbox

extension CGImage {
  static func create(from cvPixelBuffer: CVPixelBuffer?) -> CGImage? {
    guard let pixelBuffer = cvPixelBuffer else {
      return nil
    }

    var image: CGImage?
    VTCreateCGImageFromCVPixelBuffer(
      pixelBuffer,
      options: nil,
      imageOut: &image)
    return image
  }
}


import CoreImage

class ContentViewModel: ObservableObject {
  @Published var error: Error?
  @Published var frame: CGImage?

  private let context = CIContext()

  private let cameraManager = CameraManager.shared
  private let frameManager = FrameManager.shared

  init() {
    setupSubscriptions()
  }

  func setupSubscriptions() {
    // swiftlint:disable:next array_init
//    cameraManager.$error
//      .receive(on: RunLoop.main)
//      .map { $0 }
//      .assign(to: &$error)

    frameManager.$current
      .receive(on: RunLoop.main)
      .compactMap { buffer in
        guard let image = CGImage.create(from: buffer) else {
          return nil
        }

        var ciImage = CIImage(cgImage: image)
   return self.context.createCGImage(ciImage, from: ciImage.extent)
      }
      .assign(to: &$frame)
  }
}

