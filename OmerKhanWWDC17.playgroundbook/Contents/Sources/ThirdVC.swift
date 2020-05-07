//
//  ThirdVC.swift
//  
//
//  Created by Omer Khan on 3/25/17.
//
//

import Foundation
import UIKit
import PlaygroundSupport
import SpriteKit
import AVFoundation
import GameplayKit
import UIKit
import ImageIO

var view = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: 1200))
var imgView31 = UIImageView(frame: CGRect(x: 45, y: 200, width: 500, height: 400))
let receiver = Receiver()
var question = UILabel(frame: CGRect(x:55, y:-40, width: 500, height: 200))


var x: Int = 2
var ibR1C1: UIButton!
var ibR1C2: UIButton!
var ibR2C1: UIButton!
var ibR2C2: UIButton!
var ibR3C1: UIButton!
var ibR3C2: UIButton!
var ibR4C1: UIButton!
var ibR4C2: UIButton!

var topLabel = UILabel(frame: CGRect(x:4, y:500, width: 500, height: 200))


var firstCorrectOption1 = UIButton(frame: CGRect(x:260, y:180, width: 225, height: 50)) //get rid of solid or patterened
var firstCorrectOption2 = UIButton(frame: CGRect(x:260, y:240, width: 225, height: 50)) //get rid of solid or patterened


var secondCorrectOption1 = UIButton(frame: CGRect(x:260, y:300, width: 225, height: 50)) //get rid of solid or patterened
var lastoption = UIButton(frame: CGRect(x:260, y:360, width: 225, height: 50)) //get blue or black



class Receiver{
    
    
  
    
    @objc func buttonClicked()
        
    {
        
        if(ibR1C2.isHidden == true)
        {
            //they chose pattern
            
            topLabel.text = "No more Filled Shapes Left, Try Again!"
            topLabel.textColor = UIColor.red
            topLabel.font = UIFont.systemFont(ofSize: 26)

            
            
        }
        
        
        x = 8
        if(x==8)
        {
            ibR1C2.isEnabled = false
            ibR2C2.isEnabled = false
            ibR3C2.isEnabled = false //Yes it is a solid, thus get rid of all the pattern ones
            ibR4C2.isEnabled = false
            firstCorrectOption2.isHidden = true
            firstCorrectOption1.isHidden = true
            topLabel.text = "Yes, the shape does not have a pattern!"
            topLabel.textColor = UIColor(red:0.00, green:0.50, blue:0.00, alpha:1.0)
            topLabel.frame = CGRect(x:30, y:500, width:600, height: 200)

            topLabel.font = UIFont.systemFont(ofSize: 26)

            
            
        
        }
        

        
        
        
    }
    
    @objc func buttonClicked2()
    {
        
        
        
        x = 8
        if(x==8)
        {
            ibR1C2.isEnabled = false
            ibR2C2.isEnabled = false  //No it is not a pattern, get rid of all of those
            ibR3C2.isEnabled = false
            ibR4C2.isEnabled = false
            
            topLabel.text = "No, the shape does not have a pattern!"
            topLabel.textColor = UIColor(red:0.00, green:0.50, blue:0.00, alpha:1.0)
            topLabel.font = UIFont.systemFont(ofSize: 26)
            topLabel.frame = CGRect(x:30, y:500, width:600, height: 200)

            
            firstCorrectOption2.isHidden = true
            firstCorrectOption1.isHidden = true
            
            

            
            
            
        }
        
        

        

        
    }
    
    
    @objc func buttonClicked3()
    {
        
        if x==8 {
            //Hiding black pentagon
            
            x = 5
            ibR3C1.isEnabled = false  //They have chosen solid or pattern because x = 1
            ibR4C1.isEnabled = false  //No it does not have a hole in it, get rid of holes
            
            
            topLabel.text = "No, the shape does not have a hole in it!"
            topLabel.textColor = UIColor(red:0.00, green:0.50, blue:0.00, alpha:1.0)
            topLabel.font = UIFont.systemFont(ofSize: 26)
            topLabel.frame = CGRect(x:30, y:500, width:600, height: 200)

            firstCorrectOption1.isHidden = true
            firstCorrectOption2.isHidden = true
            secondCorrectOption1.isHidden = true
            
            
            
            
        } else
       
        {
            
            topLabel.frame = CGRect(x:4, y:500, width: 500, height: 200)

            topLabel.text = "*In order to narrow down shapes more efficiently, choose another option!"
            topLabel.textColor = UIColor.red
            topLabel.font = UIFont.systemFont(ofSize: 15)
            
        }
        
        
        
        
        
    }
    
    @objc func buttonClicked4()
    {
        
        if x==5 {
            
            
            ibR2C1.isEnabled = false
            
            imgView31.loadGif(name: "giphy")
            
            
            topLabel.text = "Congrats, you found the shape!"
            topLabel.frame = CGRect(x:70, y:500, width: 500, height: 200)
            topLabel.textColor = UIColor(red:0.00, green:0.50, blue:0.00, alpha:1.0)
            topLabel.font = UIFont.systemFont(ofSize: 26)
           
            
            
        } else
        {
            topLabel.frame = CGRect(x:4, y:500, width: 500, height: 200)

         
            topLabel.text = "*In order to narrow down shapes more efficiently, choose another option!"
            topLabel.textColor = UIColor.red
            topLabel.font = UIFont.systemFont(ofSize: 15)
            
            
        }
        
        
        
        
        
    }

    
    
}


 public class ThirdVC: UIViewController
 {





let image1 = UIImage(named: "shape-01.png")
let image2 = UIImage(named: "shape-02.png")
let image3 = UIImage(named: "shape-03.png")
let image4 = UIImage(named: "shape-06.png")
let image5 = UIImage(named: "shape-09.png")
let image6 = UIImage(named: "shape-10.png")
let image7 = UIImage(named: "shape-11.png")
let image8 = UIImage(named: "shape-16.png")








 
 public override func viewDidLoad()
 {
 
    ibR1C1 = UIButton(frame: CGRect(x:0, y:0, width:200, height:300))
    ibR1C1.setImage(image1, for: UIControlState.normal)
    
    ibR1C2 = UIButton(frame: CGRect(x:100, y:0, width:200, height:300))
    ibR1C2.setImage(image2, for: UIControlState.normal)
    
    ibR2C1 = UIButton(frame: CGRect(x:0, y:100, width:200, height:300))
    ibR2C1.setImage(image3, for: UIControlState.normal)
    
    ibR2C2 = UIButton(frame: CGRect(x:100, y:100, width:200, height:300))
    ibR2C2.setImage(image4, for: UIControlState.normal)
    
    ibR3C1 = UIButton(frame: CGRect(x:0, y:200, width:200, height:300))
    ibR3C1.setImage(image5, for: UIControlState.normal)
    
    ibR3C2 = UIButton(frame: CGRect(x:100, y:200, width:200, height:300))
    ibR3C2.setImage(image6, for: UIControlState.normal)
    
    ibR4C1 = UIButton(frame: CGRect(x:0, y:300, width:200, height:300))
    ibR4C1.setImage(image7, for: UIControlState.normal)
    
    ibR4C2 = UIButton(frame: CGRect(x:100, y:300, width:200, height:300))
    ibR4C2.setImage(image8, for: UIControlState.normal)
    
    firstCorrectOption1.addTarget(receiver, action: #selector(Receiver.buttonClicked), for: .touchUpInside)
    firstCorrectOption2.addTarget(receiver, action: #selector(Receiver.buttonClicked2), for: .touchUpInside)
    secondCorrectOption1.addTarget(receiver, action: #selector(Receiver.buttonClicked3), for: .touchUpInside)
    lastoption.addTarget(receiver, action: #selector(Receiver.buttonClicked4), for: .touchUpInside)


    question.text = "Find the shape using the questions"
    question.font = UIFont.systemFont(ofSize: 26)
    
    view.addSubview(question)


    
    firstCorrectOption1.backgroundColor = UIColor(red:0.40, green:0.60, blue:1.00, alpha:1.0)
    firstCorrectOption2.backgroundColor = UIColor(red:0.40, green:0.60, blue:1.00, alpha:1.0)
    lastoption.backgroundColor = UIColor(red:0.80, green:0.40, blue:1.00, alpha:1.0)
    secondCorrectOption1.backgroundColor = UIColor(red:0.80, green:0.40, blue:1.00, alpha:1.0)


    
    topLabel.text = ""

    topLabel.textColor = UIColor.blue


    
    firstCorrectOption1.layer.cornerRadius = 17
    firstCorrectOption2.layer.cornerRadius = 17
    secondCorrectOption1.layer.cornerRadius = 17
    lastoption.layer.cornerRadius = 17

    
   
    

    
    firstCorrectOption1.setTitle(".HasNoPattern()", for: .normal)
    firstCorrectOption2.setTitle(".IsPatterned()", for: .normal)
    secondCorrectOption1.setTitle(".HasHoles()", for: .normal)
    lastoption.setTitle(".IsBlack()", for: .normal)



    
    
    view.addSubview(firstCorrectOption1)
    view.addSubview(firstCorrectOption2)
    view.addSubview(secondCorrectOption1)
    view.addSubview(lastoption)



    
    
    
    
    view.backgroundColor = UIColor(red:0.80, green:1.0, blue:0.80, alpha:1.0)
    view.addSubview(ibR1C1)
    view.addSubview(ibR1C2)
    view.addSubview(ibR2C1)
    view.addSubview(ibR2C2)
    view.addSubview(ibR3C1)
    view.addSubview(ibR3C2)
    view.addSubview(ibR4C1)
    view.addSubview(ibR4C2)
    view.addSubview(topLabel)
    view.addSubview(imgView31)



}
    
 
 }



extension UIImageView {
    
    public func loadGif(name: String) {
        DispatchQueue.global().async {
            let image = UIImage.gif(name: name)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
}

extension UIImage {
    
    public class func gif(data: Data) -> UIImage? {
        // Create source from data
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            print("SwiftGif: Source for the image does not exist")
            return nil
        }
        
        return UIImage.animatedImageWithSource(source)
    }
    
    public class func gif(url: String) -> UIImage? {
        // Validate URL
        guard let bundleURL = URL(string: url) else {
            print("SwiftGif: This image named \"\(url)\" does not exist")
            return nil
        }
        
        // Validate data
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(url)\" into NSData")
            return nil
        }
        
        return gif(data: imageData)
    }
    
    public class func gif(name: String) -> UIImage? {
        // Check for existance of gif
        guard let bundleURL = Bundle.main
            .url(forResource: name, withExtension: "gif") else {
                print("SwiftGif: This image named \"\(name)\" does not exist")
                return nil
        }
        
        // Validate data
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            return nil
        }
        
        return gif(data: imageData)
    }
    
    internal class func delayForImageAtIndex(_ index: Int, source: CGImageSource!) -> Double {
        var delay = 0.001
        
        // Get dictionaries
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifPropertiesPointer = UnsafeMutablePointer<UnsafeRawPointer?>.allocate(capacity: 0)
        if CFDictionaryGetValueIfPresent(cfProperties, Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque(), gifPropertiesPointer) == false {
            return delay
        }
        
        let gifProperties:CFDictionary = unsafeBitCast(gifPropertiesPointer.pointee, to: CFDictionary.self)
        
        // Get delay time
        var delayObject: AnyObject = unsafeBitCast(
            CFDictionaryGetValue(gifProperties,
                                 Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
            to: AnyObject.self)
        if delayObject.doubleValue == 0 {
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                                                             Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
        }
        
        delay = delayObject as? Double ?? 0
        
        if delay < 0.001 {
            delay = 0.001 // Make sure they're not too fast
        }
        
        return delay
    }
    
    internal class func gcdForPair(_ a: Int?, _ b: Int?) -> Int {
        var a = a
        var b = b
        // Check if one of them is nil
        if b == nil || a == nil {
            if b != nil {
                return b!
            } else if a != nil {
                return a!
            } else {
                return 0
            }
        }
        
        // Swap for modulo
        if a! < b! {
            let c = a
            a = b
            b = c
        }
        
        // Get greatest common divisor
        var rest: Int
        while true {
            rest = a! % b!
            
            if rest == 0 {
                return b! // Found it
            } else {
                a = b
                b = rest
            }
        }
    }
    
    internal class func gcdForArray(_ array: Array<Int>) -> Int {
        if array.isEmpty {
            return 1
        }
        
        var gcd = array[0]
        
        for val in array {
            gcd = UIImage.gcdForPair(val, gcd)
        }
        
        return gcd
    }
    
    internal class func animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = [CGImage]()
        var delays = [Int]()
        
        // Fill arrays
        for i in 0..<count {
            // Add image
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(image)
            }
            
            // At it's delay in cs
            let delaySeconds = UIImage.delayForImageAtIndex(Int(i),
                                                            source: source)
            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
        }
        
        // Calculate full duration
        let duration: Int = {
            var sum = 0
            
            for val: Int in delays {
                sum += val
            }
            
            return sum
        }()
        
        // Get frames
        let gcd = gcdForArray(delays)
        var frames = [UIImage]()
        
        var frame: UIImage
        var frameCount: Int
        for i in 0..<count {
            frame = UIImage(cgImage: images[Int(i)])
            frameCount = Int(delays[Int(i)] / gcd)
            
            for _ in 0..<frameCount {
                frames.append(frame)
            }
        }
        
        // Heyhey
        let animation = UIImage.animatedImage(with: frames,
                                              duration: Double(duration) / 1000.0)
        
        return animation
    }
    
}





















 
