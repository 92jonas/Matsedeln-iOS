//
//  ViewController.swift
//  Matsedeln
//
//  Created by Jonas Jacobsson on 2016-03-02.
//  Copyright © 2016 Jonas Jacobsson. All rights reserved.
//

import UIKit
import MagicalRecord
import CoreData
import HTMLReader

class MainVC: UIViewController {
    
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var mapBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var weekNbrLabel: UILabel!
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var thusdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    
    let res: Resource = Resource.btnColor()
    let backgroundColor: UIColor = Resource.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        initButtons()
        initLabel()
        
        let testUrl = NSURL(string: "http://midgarden.se/menu-category/food-menu/")
        var htmls = NSString()
        do {
            htmls = try NSString(contentsOfURL: testUrl!, encoding: NSUTF8StringEncoding)
        } catch{print(error)}
        
        let html: String = htmls as String
        //        print(html)
        
        // HTML PARSING
        let doc: HTMLDocument = HTMLDocument(string: html)
        
        
        setCurrWeek(doc)
        
        setNextWeek(doc)
        
        
        
        
        setMealsOfCurrWeek(doc)
        
        
    }
    func setCurrWeek(doc: HTMLDocument){
        // NUVARANDE VECKA
        let h3s = doc.nodesMatchingSelector("h3")
        if let element = h3s[0] as? HTMLElement {
            weekNbrLabel.text =  element.textContent.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        }
    }
    
    func setNextWeek(doc: HTMLDocument){
        // NÄSTA VECKA
        let h3s = doc.nodesMatchingSelector("h3")
        if let element = h3s[1] as? HTMLElement {
            let nextWeek =  element.textContent.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            print("NEXT WEEK: " + nextWeek)
        }
    }
    func setMealsOfCurrWeek(doc: HTMLDocument){
        let sections = doc.nodesMatchingSelector("section")
        //        for section in sections{
        if let element = sections[1] as? HTMLElement {
            let text =  element.textContent.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            
            print(text)
            
            let ps = element.nodesMatchingSelector("p")
            var pStrs = [String]()
            for p in ps{
                
                let pText = p.textContent.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                pStrs.append(pText)
            }
            self.mondayLabel.text = pStrs[0]
            self.thusdayLabel.text = pStrs[1]
            self.wednesdayLabel.text = pStrs[2]
            self.thursdayLabel.text = pStrs[3]
            self.fridayLabel.text = pStrs[4]

        }
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

