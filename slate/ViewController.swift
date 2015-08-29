//
//  ViewController.swift
//  slate
//
//  Created by Alex Macmillan on 29/08/2015.
//  Copyright © 2015 x13N. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var powerButton: UIButton!
    @IBOutlet var chromeButton: UIButton!
    @IBOutlet var playstationButton: UIButton!
    @IBOutlet var spotifyButton: UIButton!
    
    var buttons: Array<UIButton> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [powerButton, chromeButton, playstationButton, spotifyButton]
        
        for button in buttons {
            button.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.PrimaryActionTriggered)
        }
    }
    
    func buttonPressed(sender: UIView) {
        print("Button pressed")
        for button in buttons {
            button.selected = button == sender
        }
    }

    func listen() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let request = app.apiAI.requestWithType(.Voice)
        request.setCompletionBlockSuccess({ (request, response) -> Void in
            print("Success", response)
            }) { (request, error) -> Void in
                print("Error", error)
        }
        app.apiAI.enqueue(request)
    }
    

}

