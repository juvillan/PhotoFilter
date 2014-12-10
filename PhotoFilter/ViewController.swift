//
//  ViewController.swift
//  PhotoFilter
//
//  Created by Justin Villani on 11/12/14.
//  Copyright (c) 2014 Justin Villani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //This is object of the image
    @IBOutlet weak var photoimageview: UIImageView!
    
    //Create a place to render the image
    let context = CIContext(options:nil);
    
    //this is an action created for the apply filter button
    @IBAction func applyFilter(sender: AnyObject)
    {
        
        //Create an image to filter
        let InputImage = CIImage(image:photoimageview.image);
        
        //Create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey:(Double(arc4random_uniform(314))/100)];
        
        //Apply a filter to the image
        let filterImage = InputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor);
        
        //Render the filter image
        let renderImage = context.createCGImage(filterImage, fromRect: filterImage.extent());
        
        //Reflect the change back in the interface
        photoimageview.image = UIImage(CGImage: renderImage);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

