//
//  ViewController.swift
//  BorisDrawer
//
//  Created by iGuest on 5/19/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var start: CGPoint?
    
    @IBOutlet weak var drawImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch!
        start = touch.locationInView(self.drawImageView)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch!
        let end = touch.locationInView(self.drawImageView)
        
        // interaction call
        if let s = self.start {
            draw(s, end: end)
        }
        
        // sets the end of the touch interaction to the start of the new one
        self.start = end
    }
    
    func draw(start: CGPoint, end: CGPoint) {
        
        //how big the image view will be
        UIGraphicsBeginImageContext(self.drawImageView.frame.size)
        
        let context = UIGraphicsGetCurrentContext()
        
        drawImageView?.image?.drawInRect(CGRect(x: 0, y: 0, width: drawImageView.frame.width, height: drawImageView.frame.height))
    
        CGContextSetLineWidth(context, 6)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, start.x, start.y)
        CGContextAddLineToPoint(context, end.x, end.y)
        CGContextStrokePath(context)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        drawImageView.image = newImage
    
    
    
    }
}

