//
//  ViewController.swift
//  Matsedeln
//
//  Created by Jonas Jacobsson on 2016-03-02.
//  Copyright © 2016 Jonas Jacobsson. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var mapBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    let res: Resource = Resource.btnColor()
    let backgroundColor: UIColor = Resource.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        initButtons()
        initLabel()
        
        let url = NSURL (string: "http://www.sourcefreeze.com");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
        //let s: HTMLDocument
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func initButtons(){
        normalBtn(infoBtn, s: res)
        normalBtn(mapBtn, s: res)
        normalBtn(menuBtn, s: res)
    }
    
    func initLabel(){
        
        
    }
    
    // Touch Down INFO
    @IBAction func btnInfoHighlight(sender: UIButton) {
        highlightBtn(sender, s: res)
    }
    // Touch Up Inside INFO
    @IBAction func btnInfoNormal(sender: UIButton) {
        normalBtn(sender, s: res)
    }
    
    // Touch Down MAP
    @IBAction func btnMapHighlight(sender: UIButton) {
        highlightBtn(sender, s: res)
    }
    // Touch Up Inside MAP
    @IBAction func btnMapNormal(sender: UIButton) {
        normalBtn(sender, s: res)
    }
    
    // Touch Down NORMAL MENU
    @IBAction func btnMenuHighlight(sender: UIButton) {
        highlightBtn(sender, s: res)
    }
    // Touch Up Inside NORMAL MENU
    @IBAction func btnMenuNormal(sender: UIButton) {
        normalBtn(sender, s: res)
    }

    
    // Change button color method
    
    func highlightBtn(b: UIButton, s: Resource){
        b.backgroundColor = s.color(.Highlighted, depth: .Background)
        b.setTitleColor(s.color(.Highlighted), forState: .Highlighted)
    }
    
    func normalBtn(b: UIButton, s: Resource){
        b.backgroundColor = s.color(.Normal, depth: .Background)
        b.setTitleColor(s.color(.Normal), forState: .Normal)
    }
}

