//
//  ViewController.swift
//  YTIntegration
//
//  Created by Dharmatej Parvathaneni on 3/5/20.
//  Copyright © 2020 dharmatej. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    // IBs
    @IBOutlet var customView: UIView!

    @IBAction func showYoutube() {
        self.loadVideo(.Youtube)
    }
    
    @IBAction func showVimeo() {
        self.loadVideo(.Vimeo)
    }
    
    @IBAction func showVimeoBP() {
        self.loadVideo(.ViemoBackGround)
    }
    
    // Locals
    private var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let webViewConfig = WKWebViewConfiguration()
        webViewConfig.allowsInlineMediaPlayback = true

        webView = WKWebView(frame: self.customView.bounds, configuration: webViewConfig)
        
        // Load Default Player Video
        self.loadVideo(.Youtube)
    }
    
    private func loadVideo(_ provider: VideoType) {
        var videoUrl: URL
        
        switch provider {
        case .Vimeo:
            videoUrl = URL(string: "https://player.vimeo.com/video/94078580?background=1")!
        case .Youtube:
            videoUrl = URL(string: "https://www.youtube.com/embed/fEMakZVwq-Y?playsinline=1&autoplay=1")!
        case .ViemoBackGround:
             videoUrl = URL(string: "https://player.vimeo.com/video/396010417?autoplay=1")!
        }
        webView.load(URLRequest(url: videoUrl))
        self.customView.addSubview(webView)
    }
}

enum VideoType {
    case Youtube
    case Vimeo
    case ViemoBackGround
}
