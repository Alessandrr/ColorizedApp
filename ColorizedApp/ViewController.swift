//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Aleksandr Mamlygo on 09.05.23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var coloredView: UIView!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 20
    }

    //MARK: - IBActions
    @IBAction func redSliderAction(_ sender: UISlider) {
        redValueLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        greenValueLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        blueValueLabel.text = String(format: "%.2f", sender.value)
    }
    
}

