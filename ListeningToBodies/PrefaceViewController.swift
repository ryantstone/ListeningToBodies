//
//  PrefaceViewController.swift
//  ListeningToBodies
//
//  Created by James Slusser on 1/14/19.
//  Copyright © 2019 James Slusser. All rights reserved.
//

import UIKit
import AVFoundation

class PrefaceViewController: UIViewController {


    var testPlayer: AVAudioPlayer
    
    required init?(coder aDecoder: NSCoder) {
        
        let testURL = Bundle.main.url(forResource: "body_scan_1", withExtension: "mp3")!
        testPlayer = try! AVAudioPlayer(contentsOf: testURL)
        
        super.init(coder: aDecoder)
    }

    @IBOutlet weak var prefaceTextView: UITextView!
    

    @IBAction func testClicked(_ sender: UIButton) {
        if testPlayer.isPlaying == false {
            testPlayer.play()
        } else {
            testPlayer.pause()
        }
    }
    
    @IBOutlet weak var avTest: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testPlayer.prepareToPlay()
        
//        let attributedString = NSMutableAttributedString(string: "Want to learn iOS? You should visit the best source of free iOS tutorials!")
//        attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: 19, length: 55))
//
//        prefaceTextView.attributedText = attributedString
//    }
//
//    func prefaceTextView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
//        UIApplication.shared.open(URL)
//        return false
   }
}
