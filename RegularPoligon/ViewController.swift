//
//  ViewController.swift
//  RegularPoligon
//
//  Created by Daesub Kim on 2016. 11. 1..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOfSides = 5;
    
    @IBOutlet weak var label01: UILabel!
    @IBOutlet weak var polygonView: PolygonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label01.text = "Number of Sides : \(numberOfSides)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func decreBtn(sender: UIButton) {
        numberOfSides -= 1
        if numberOfSides <= 3 {
            self.numberOfSides = 3
        }
        label01.text = "Number of Sides : \(numberOfSides)"
        polygonView.setNumberOfPolygon(numberOfSides)
    }
    @IBAction func increBtn(sender: UIButton) {
        numberOfSides += 1
        label01.text = "Number of Sides : \(numberOfSides)"
        polygonView.setNumberOfPolygon(numberOfSides)
    }
 


}

extension String {
    
}
