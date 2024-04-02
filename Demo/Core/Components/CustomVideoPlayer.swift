//
//  CustomVideoPlayer.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI
import AVKit

struct CustomVideoPlayer : UIViewControllerRepresentable{
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.entersFullScreenWhenPlaybackBegins = true
        controller.allowsPictureInPicturePlayback = true
        controller.videoGravity = .resizeAspectFill
        controller.player?.play()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
