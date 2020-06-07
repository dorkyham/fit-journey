//
//  VideoViewCell.swift
//  Fit Journey
//
//  Created by Annisa Nabila Nasution on 07/06/20.
//  Copyright © 2020 Annisa Nabila Nasution. All rights reserved.
//

import UIKit
import AVFoundation

class VideoViewCell: UITableViewCell {
    
    
    @IBOutlet weak var video_layer: UIView!
    
    var avQueuePlayer   : AVQueuePlayer?
    var avPlayerLayer   : AVPlayerLayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func addPlayer(for url: URL) {
        self.avQueuePlayer = AVQueuePlayer(url: url)
        self.avPlayerLayer = AVPlayerLayer(player: self.avQueuePlayer!)
        self.avPlayerLayer?.frame = self.video_layer.bounds
        self.avPlayerLayer?.fillMode = .both
     self.video_layer.layer.addSublayer(self.avPlayerLayer!)
        self.avQueuePlayer?.play()
    }
}
