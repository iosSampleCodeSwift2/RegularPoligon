//
//  PoligonView.swift
//  RegularPoligon
//
//  Created by Daesub Kim on 2016. 11. 1..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit
import Foundation

class PolygonView : UIView {
    
    var side = 5
    let lineWidth: CGFloat = 3
    var fillColor: UIColor! = UIColor.blueColor()
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
    }
    override func drawRect(rect: CGRect) {
        //let path = UIBezierPath(ovalInRect: rect)
        //UIColor.greenColor().setFill()
        //path.fill()
        
        path = regularPolygon(rect)
        UIColor.blueColor().setFill()
        path.fill()
    }
    
    func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
        return CGPointMake(radius * cos(angle) + offset.x, radius * sin(angle) + offset.y)
    }
    func regularPolygon(rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        let center = CGPointMake(rect.width/2.0, rect.height/2.0)
        var angle: CGFloat = -CGFloat(M_PI/2.0)
        let angleIncre = CGFloat(M_PI * 2.0 / Double(side))
        let radius = rect.width/2.0
        path.moveToPoint(pointFrom(angle, radius: radius, offset: center))
        
        for i in 1...side - 1 {
            angle += angleIncre
            path.addLineToPoint(pointFrom(angle, radius: radius, offset: center))
        }
        path.closePath()
        return path
    }
    func setNumberOfPolygon(sides: Int) {
        side = sides
        if side <= 3 { side = 3 }
        self.setNeedsDisplay() // 다시 그리라는 Event를 호출.
    }
}
