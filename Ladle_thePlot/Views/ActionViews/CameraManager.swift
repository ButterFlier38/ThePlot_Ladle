////
////  CameraManager.swift
////  Ladle_thePlot
////
////  Created by Irene Fernando on 04/03/22.
////
//
//import Foundation
//import AVFoundation
//// 1
//class CameraManager: ObservableObject {
//  // 2
//    
//    // 1
//    @Published var error: CameraError?
//    // 2
//    let session = AVCaptureSession()
//    // 3
//    private let sessionQueue = DispatchQueue(label: "com.raywenderlich.SessionQ")
//    // 4
//    private let videoOutput = AVCaptureVideoDataOutput()
//    // 5
//    private var status = Status.unconfigured
//  enum Status {
//    case unconfigured
//    case configured
//    case unauthorized
//    case failed
//  }
//  // 3
//  static let shared = CameraManager()
//    
//    
//  // 4
//  private init() {
//    configure()
//  }
//  // 5
//  private func configure() {
//  }
//}
