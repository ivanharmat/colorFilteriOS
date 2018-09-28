//
//  ViewController.swift
//  ImageFilter
//
//  Created by Ivan Harmat on 3/23/16.
//  Copyright © 2016 Ivan Harmat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    // Create a place to render the filtered image
    let context = CIContext(options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func color1(sender: AnyObject) {
        let color1 = [kCIInputAngleKey: 1.50]
        print("color1 \(color1)")
        applyColorToImage(color: color1 as [String : AnyObject])
    }
    
    @IBAction func color2(sender: AnyObject) {
        let color2 = [kCIInputAngleKey: 2.6]
        print("color2 \(color2)")
        applyColorToImage(color: color2 as [String : AnyObject])
    }
    
    @IBAction func color3(sender: AnyObject) {
        let color3 = [kCIInputAngleKey: 3.05]
        print("color3 \(color3)")
        applyColorToImage(color: color3 as [String : AnyObject])
    }
    
    @IBAction func randomColor(sender: AnyObject) {
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        print("randomColor \(randomColor)")
        applyColorToImage(color: randomColor as [String : AnyObject])
    }
    

    @IBAction func originalAction(sender: AnyObject) {
        imageView.image = UIImage(named: "meadow")
    }
    
    func applyColorToImage(color : [String : AnyObject]?) {
        imageView.image = UIImage(named: "meadow")
        // Create an image to filter
        let inputImage = CIImage(image: imageView.image!)
        
        // Apply a filter to the image
        let filteredImage = inputImage!.applyingFilter("CIHueAdjust", withInputParameters: color!)

        
        // Render the filtered image
        let renderedImage = context.createCGImage(filteredImage, from: filteredImage.extent)
        
        // Reflect the change back in the interface
        imageView.image = UIImage(cgImage: renderedImage!)
    }
}

