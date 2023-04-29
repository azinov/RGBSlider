//
//  ViewController.swift
//  RGBSlider
//
//  Created by Alexey Zinoviev on 29.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var hexView: UILabel!
    @IBOutlet weak var rgbView: UILabel!
    
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        sliderActions()
    }

    //MARK: - IBAction
    @IBAction func redSliderAction() {
        sliderActions()
    }
    
    @IBAction func greenSliderAction() {
        sliderActions()
    }
    
    @IBAction func blueSliderAction() {
        sliderActions()
    }
    
    //MARK: - Private Methods
    private func sliderActions () {
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
        hexView.text = String(
            format:"HEX: #%02x%02x%02x", //x - convert to hex value
            Int(red * 255),
            Int(green * 255),
            Int(blue * 255)
        )
        rgbView.text = String(
            format:"RGB: %u %u %u", //u - convert to Int
            Int(red * 255),
            Int(green * 255),
            Int(blue * 255)
        )
        
    }
    
}



