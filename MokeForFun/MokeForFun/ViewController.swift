//
//  ViewController.swift
//  MokeForFun
//
//  Created by Gerry on 8/15/16.
//  Copyright © 2016 gaoyve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isPlaying = false
    let rotateString = "Rotate"
    let stopString = "Stop"
    
    @IBOutlet var mokeLoadingView: MokeLoadingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet var rotateButton: UIButton!
    @IBAction func rotateStop(_ sender: AnyObject) {
        if isPlaying {
//            mokeLoadingView.stopAnimate()
            isPlaying = false
            rotateButton.setTitle(rotateString, for: .normal)
        } else {
            mokeLoadingView.startAnimateLayers()
            isPlaying = true
            rotateButton.setTitle(stopString, for: .normal)
        }
    }
    
    
    
}

