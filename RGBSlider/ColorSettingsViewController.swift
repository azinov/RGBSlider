//
//  ViewController.swift
//  RGBSlider
//
//  Created by Alexey Zinoviev on 29.04.2023.
//

import UIKit

protocol BackgroundColorDelegate: AnyObject {
    func colorDelegate(colorRGB: UIColor)
}

final class ColorSettingsViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var rgbLabel: UILabel!
    
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    weak var backgroundColorChanged: BackgroundColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
                
        red = backgroundColor.rgba.red
        green = backgroundColor.rgba.green
        blue = backgroundColor.rgba.blue
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        sliderAction()
        
    }
    
        
    override func viewWillDisappear(_ animated: Bool) {
        backgroundColorChanged?.colorDelegate(colorRGB: backgroundColor)
    }

       
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destVC = segue.destination as! MainViewController
//        destVC.backgroundColor = backgroundColorChanged
//    }
    
    //MARK: - IBAction
    @IBAction func sliderAction() {
        let red = redSlider.value
        let green = greenSlider.value
        let blue = blueSlider.value
        
        redValue.text = String(format: "%.2f", red)
        greenValue.text = String(format: "%.2f", green)
        blueValue.text = String(format: "%.2f", blue)
        
        colorView.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
        
        backgroundColor = colorView.backgroundColor!
        
        hexLabel.text = String(
            format:"HEX: #%02x%02x%02x", //x - convert to hex value
            Int(red * 255),
            Int(green * 255),
            Int(blue * 255)
        )
        
        rgbLabel.text = String(
            format:"RGB: %d %d %d", //d - convert to Int
            Int(red * 255),
            Int(green * 255),
            Int(blue * 255)
        )
        
       
    }

       
}

extension UIColor {
   var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
       var r: CGFloat = 0
       var g: CGFloat = 0
       var b: CGFloat = 0
       var a: CGFloat = 0
       self.getRed(&r, green: &g, blue: &b, alpha: &a)
       return (r, g, b, a)
   }
   
   var hsba: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
       var h: CGFloat = 0
       var s: CGFloat = 0
       var b: CGFloat = 0
       var a: CGFloat = 0
       self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
       return (h, s, b, a)
   }
}

