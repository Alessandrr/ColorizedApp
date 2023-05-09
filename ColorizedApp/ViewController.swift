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
    
    //MARK: - Private properties
    private var redValue: CGFloat = 0.5
    private var greenValue: CGFloat = 0.5
    private var blueValue: CGFloat = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 20
        setupViewColor(for: coloredView, red: redValue, green: greenValue, blue: blueValue)
    }

    //MARK: - IBActions
    @IBAction func redSliderAction(_ sender: UISlider) {
        redValueLabel.text = String(format: "%.2f", sender.value)
        redValue = CGFloat(sender.value)
        setupViewColor(for: coloredView, red: redValue, green: greenValue, blue: blueValue)
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        greenValueLabel.text = String(format: "%.2f", sender.value)
        greenValue = CGFloat(sender.value)
        setupViewColor(for: coloredView, red: redValue, green: greenValue, blue: blueValue)
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        blueValueLabel.text = String(format: "%.2f", sender.value)
        blueValue = CGFloat(sender.value)
        setupViewColor(for: coloredView, red: redValue, green: greenValue, blue: blueValue)
    }
    
    //MARK: - Private functions
    
    private func setupViewColor(for view: UIView, red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
    
}

