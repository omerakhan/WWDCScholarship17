
import PlaygroundSupport
import UIKit
import Foundation
import ImageIO

var view = UIView(frame: CGRect(x:0, y:0, width:800, height:1200))

var x: Int = 5
var y: Int = 5
var messageLabel = UILabel(frame: CGRect(x:40, y:200, width:470 , height: 200))
var imgView2 = UIImageView(frame: CGRect(x: 45, y: 200, width: 500, height: 400))
var whichnumberLabel = UILabel(frame: CGRect(x:7, y:70, width:600 , height: 200))
var imgView3 = UIImageView(frame: CGRect(x: 221, y: 200, width: 70, height: 70))




var five: UIButton!
var seven: UIButton!
var twelve: UIButton!
var nineteen: UIButton!
var twentythree: UIButton!
var twentyeight: UIButton!
var thirtyone: UIButton!
var fourtythree: UIButton!
var fifty: UIButton!

var Cfive: UIButton!
var Cseven: UIButton!
var Ctwelve: UIButton!
var Cnineteen: UIButton!
var Ctwentyeight: UIButton!
var Cthirtyone: UIButton!
var Cfourtythree: UIButton!
var Cfifty: UIButton!

var C2fourtythree: UIButton!
var C2fifty: UIButton!

let redfiveimage = UIImage(named: "fivered.jpg")
let redsevenimage = UIImage(named: "7red.jpg")
let redtwelveimage = UIImage(named: "12red.jpg")
let rednineteenimage = UIImage(named: "19red.jpg")
let red23image = UIImage(named: "23red.jpg")
let red28image = UIImage(named: "28red.jpg")
let red31image = UIImage(named: "31red.jpg")
let red43image = UIImage(named: "43red.jpg")
let red50image = UIImage(named: "50red.jpg")

var questionimage = UIImage(named: "blanknumb.jpg")






let fiveimage = UIImage(named: "five.jpg")
let sevenimage = UIImage(named: "seven.jpg")
let twelveimage = UIImage(named: "twelve.jpg")
let nineteenimage = UIImage(named: "nineteen.jpg")

let twentythreeimage = UIImage(named: "twentythree.jpg")
let twentyeightimage = UIImage(named: "twentyeight.jpg")
let thirtyoneimage = UIImage(named: "thirtyone.jpg")
let fourtythreeimage = UIImage(named: "fourtythree.jpg")
let fiftyimage = UIImage(named: "fifty.jpg")

class Receiver{
    
    
    
    @objc func buttonClicked()
        
    {
        x=10
        
        five.setImage(redfiveimage, for: UIControlState.normal)
        seven.setImage(redsevenimage, for: UIControlState.normal)
        twelve.setImage(redtwelveimage, for: UIControlState.normal)
        nineteen.setImage(rednineteenimage, for: UIControlState.normal)
        twentythree.setImage(red23image, for: UIControlState.normal)
        twentyeight.setImage(red28image, for: UIControlState.normal)
        thirtyone.setImage(red31image, for: UIControlState.normal)
        fourtythree.setImage(red43image, for: UIControlState.normal)
        fifty.setImage(red50image, for: UIControlState.normal)

        
        
        



   
     
     
        
        five.isEnabled = false
        
        seven.isEnabled = false
        
        twelve.isEnabled = false
        
        nineteen.isEnabled = false
        messageLabel.text = ""
        
        twentythree.isEnabled = false
        
        twentyeight.isHidden = true
        twentyeight.isEnabled = false
        
        thirtyone.isHidden = true
        thirtyone.isEnabled = false
        
        fourtythree.isHidden = true
        fourtythree.isEnabled = false
        
        fifty.isHidden = true
        fifty.isEnabled = false
        
        
        
        
        view.addSubview(Ctwentyeight)
        view.addSubview(Cthirtyone)
        view.addSubview(Cfourtythree)
        view.addSubview(Cfifty)

        
        

        
        
        
        
        
        
        
        
    }
    
    @objc func buttonClickedWrong()
        
    {
        
        if(x != 10)
        {
            
            messageLabel.font = UIFont.systemFont(ofSize: 26)
            messageLabel.textColor = UIColor.red
            messageLabel.text = "Sorry, please choose the middle value"
            
        }
        
    }
    
    
    @objc func buttonClickedRight()
        
    {
        
       y = 10
        
        Ctwentyeight.setImage(red28image, for: UIControlState.normal)
        Ctwentyeight.isEnabled = false
        
        Cthirtyone.setImage(red31image, for: UIControlState.normal)
        Cthirtyone.isEnabled = false
        
        view.addSubview(C2fourtythree)
        view.addSubview(C2fifty)

        
        messageLabel.text = ""
        
        
        
    }

    
  
    
    
    @objc func buttonClicked2()
        
    {
        
        if(y != 10)
        {
            
            messageLabel.font = UIFont.systemFont(ofSize: 26)
            messageLabel.textColor = UIColor.red
            messageLabel.text = "Sorry, please choose the middle value"
            
        }
        
    }
    
    @objc func buttonClickedFinalRight()
        
    {
        
        Cfifty.isEnabled = false
        Cfifty.isHidden = true
        C2fifty.setImage(red50image, for: UIControlState.normal)
        
        
        C2fifty.isEnabled = false

        imgView3.image = fourtythreeimage
        
        messageLabel.font = UIFont.systemFont(ofSize: 26)
            messageLabel.textColor = UIColor(red:0.00, green:0.50, blue:0.00, alpha:1.0)
        messageLabel.frame = CGRect(x:20, y:200, width:600, height: 200)
            messageLabel.text = "Congrats, you selected the right number!"
        view.addSubview(messageLabel)
   
        imgView2.loadGif(name: "giphy")
             view.addSubview(imgView2)
        
        Cfifty.isEnabled = false
        Cfifty.isHidden = true
        
        C2fifty.setImage(red50image, for: UIControlState.normal)
        
        
        C2fifty.isEnabled = false
        
        
    }
    
    @objc func buttonClickedFinalWrong()
        
    {
   

        
        
        messageLabel.font = UIFont.systemFont(ofSize: 26)
        messageLabel.textColor = UIColor.red
        messageLabel.text = "Sorry, please choose the middle value"
        
        
    }
    
    
    
    
    
    
}

let receiver = Receiver()

five = UIButton(frame: CGRect(x:0, y:400, width:50, height:50))
five.setImage(fiveimage, for: UIControlState.normal)


seven = UIButton(frame: CGRect(x:57.75, y:400, width:50, height:50))
seven.setImage(sevenimage, for: UIControlState.normal)

twelve = UIButton(frame: CGRect(x:115.25, y:400, width:50, height:50))
twelve.setImage(twelveimage, for: UIControlState.normal)

nineteen = UIButton(frame: CGRect(x:172.75, y:400, width:50, height:50))
nineteen.setImage(nineteenimage, for: UIControlState.normal)

twentythree = UIButton(frame: CGRect(x:230.25, y:400, width:50, height:50))
twentythree.setImage(twentythreeimage, for: UIControlState.normal)


twentyeight = UIButton(frame: CGRect(x:287.75, y:400, width:50, height:50))
twentyeight.setImage(twentyeightimage, for: UIControlState.normal)



thirtyone = UIButton(frame: CGRect(x:345.25, y:400, width:50, height:50))
thirtyone.setImage(thirtyoneimage, for: UIControlState.normal)


fourtythree = UIButton(frame: CGRect(x:402.75, y:400, width:50, height:50))
fourtythree.setImage(fourtythreeimage, for: UIControlState.normal)



fifty = UIButton(frame: CGRect(x:460.25, y:400, width:50, height:50))
fifty.setImage(fiftyimage, for: UIControlState.normal)
imgView3.image = questionimage

messageLabel.text = ""
view.addSubview(five)
view.addSubview(fifty)
view.addSubview(seven)
view.addSubview(twelve)
view.addSubview(nineteen)
view.addSubview(twentythree)
view.addSubview(thirtyone)
view.addSubview(twentyeight)
view.addSubview(fourtythree)
view.addSubview(imgView3)
view.addSubview(messageLabel)

whichnumberLabel.font = UIFont.systemFont(ofSize: 22)
whichnumberLabel.textColor = UIColor.black
whichnumberLabel.text = "Use binary search to figure out what number this is:"
view.addSubview(whichnumberLabel)






Ctwentyeight = UIButton(frame: CGRect(x:287.75, y:400, width:50, height:50))
Ctwentyeight.setImage(twentyeightimage, for: UIControlState.normal)

Cthirtyone = UIButton(frame: CGRect(x:345.25, y:400, width:50, height:50))
Cthirtyone.setImage(thirtyoneimage, for: UIControlState.normal)

Cfourtythree = UIButton(frame: CGRect(x:402.75, y:400, width:50, height:50))

Cfourtythree.setImage(fourtythreeimage, for: UIControlState.normal)

Cfifty = UIButton(frame: CGRect(x:460.25, y:400, width:50, height:50))
Cfifty.setImage(fiftyimage, for: UIControlState.normal)

C2fourtythree = UIButton(frame: CGRect(x:402.75, y:400, width:50, height:50))
C2fourtythree.setImage(fourtythreeimage, for: UIControlState.normal)


C2fifty = UIButton(frame: CGRect(x:460.25, y:400, width:50, height:50))
C2fifty.setImage(fiftyimage, for: UIControlState.normal)





twentythree.addTarget(receiver, action: #selector(Receiver.buttonClicked), for: .touchUpInside)
five.addTarget(receiver, action: #selector(Receiver.buttonClickedWrong), for: .touchUpInside)
seven.addTarget(receiver, action: #selector(Receiver.buttonClickedWrong), for: .touchUpInside)
twelve.addTarget(receiver, action: #selector(Receiver.buttonClickedWrong), for: .touchUpInside)
nineteen.addTarget(receiver, action: #selector(Receiver.buttonClickedWrong), for: .touchUpInside)
twentyeight.addTarget(receiver, action: #selector(Receiver.buttonClickedWrong), for: .touchUpInside)
thirtyone.addTarget(receiver, action: #selector(Receiver.buttonClickedWrong), for: .touchUpInside)
fourtythree.addTarget(receiver, action: #selector(Receiver.buttonClickedWrong), for: .touchUpInside)
fifty.addTarget(receiver, action: #selector(Receiver.buttonClickedWrong), for: .touchUpInside)


Cthirtyone.addTarget(receiver, action: #selector(Receiver.buttonClickedRight), for: .touchUpInside)
Ctwentyeight.addTarget(receiver, action: #selector(Receiver.buttonClicked2), for: .touchUpInside)
Cfourtythree.addTarget(receiver, action: #selector(Receiver.buttonClicked2), for: .touchUpInside)
Cfifty.addTarget(receiver, action: #selector(Receiver.buttonClicked2), for: .touchUpInside)

C2fourtythree.addTarget(receiver, action: #selector(Receiver.buttonClickedFinalRight), for: .touchUpInside)
C2fifty.addTarget(receiver, action: #selector(Receiver.buttonClickedFinalWrong), for: .touchUpInside)
















view.backgroundColor = UIColor(red:0.90, green:0.80, blue:1.00, alpha:1.0)

let page = PlaygroundPage.current
page.liveView = view



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
























