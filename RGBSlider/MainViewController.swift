//
//  MainViewController.swift (5.0)
//  RGBSlider
//  
//  Created by Alexey Zinoviev on 21.05.2023
//
	

import UIKit

class MainViewController: UIViewController {
    
    var backgroundColor = UIColor(red: 0.1, green: 0.5, blue: 0.1, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let colorSettingsVC = segue.destination as? ColorSettingsViewController  {
            colorSettingsVC.backgroundColor = backgroundColor
            colorSettingsVC.backgroundColorChanged = self
        }
        
    }
    
    @IBAction func unwindToMain(_ sender: UIStoryboardSegue) {}

}

extension MainViewController: BackgroundColorDelegate {
    func colorDelegate(colorRGB: UIColor) {
        view.backgroundColor = colorRGB
    }
  
}
