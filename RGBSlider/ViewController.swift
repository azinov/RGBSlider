//
//  ViewController.swift
//  RGBSlider
//
//  Created by Alexey Zinoviev on 29.04.2023.
//

import UIKit

final class ViewController: UIViewController {

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
        sliderActions()
    }
    
    @IBAction func redSliderAction() {
        sliderActions()
    }
    
    @IBAction func greenSliderAction() {
        sliderActions()
    }
    
    @IBAction func blueSliderAction() {
        sliderActions()
    }
    
    private func sliderActions () {
        redValue.text = String(format: "%.2f", redSlider.value)
        greenValue.text = String(format: "%.2f", greenSlider.value)
        blueValue.text = String(format: "%.2f", blueSlider.value)
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        hexView.text = String(
            format:"HEX: #%02x%02x%02x",
            Int(redSlider.value * 255),
            Int(greenSlider.value * 255),
            Int(blueSlider.value * 255)
        )
        rgbView.text = String(
            format:"RGB: %u %u %u",
            Int(redSlider.value * 255),
            Int(greenSlider.value * 255),
            Int(blueSlider.value * 255)
        )
    }
    
}

