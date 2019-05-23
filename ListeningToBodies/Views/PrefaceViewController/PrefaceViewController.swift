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

    var scanPlayer: AVAudioPlayer
    var breathingPlayer: AVAudioPlayer

    @IBOutlet weak var tableView: PrefaceTableView!

    required init?(coder aDecoder: NSCoder) {
        let scanURL = Bundle.main.url(forResource: "body_scan_1", withExtension: "mp3")!
        scanPlayer = try! AVAudioPlayer(contentsOf: scanURL)
        
        let breathingURL = Bundle.main.url(forResource: "breathing_practices", withExtension: "mp3")!
        breathingPlayer = try! AVAudioPlayer(contentsOf: breathingURL)
        
        super.init(coder: aDecoder)
    }

    @IBOutlet weak var prefaceTextView: UITextView!
    
    @IBAction func bsClicked(_ sender: UIButton) {
        if scanPlayer.isPlaying == false {
            scanPlayer.play()
        } else {
            scanPlayer.pause()
        }
    }
    
    
    @IBAction func bpClicked(_ sender: UIButton) {
        if breathingPlayer.isPlaying == false {
            breathingPlayer.play()
        } else {
            breathingPlayer.pause()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scanPlayer.prepareToPlay()
        breathingPlayer.prepareToPlay()
        setupTableView()
//        prefaceTextView.textColor = .darkText
//        print(prefaceTextView.textStorage)
//        let mutableAttrString = NSMutableAttributedString(string: prefaceTextView.text)
//        let sourceRange = //
//
//            mutableAttrString.addAttribute(.foregroundColor, value: UIColor.white, range: sourceRange)
//        prefaceTextView.attributedText = mutableAttrString
    
    }

    private func setupTableView() {
        guard let textPath = Bundle.main.path(forResource: "TextData", ofType: "json") else { return }
        do {
            let data        = try Data(contentsOf: URL(fileURLWithPath: textPath))
            let textBlocks  = try JSONDecoder().decode([TextBlock].self, from: data)
            
            tableView.configure(textBlocks)
        } catch {
            print(error)
        }
    }
}
