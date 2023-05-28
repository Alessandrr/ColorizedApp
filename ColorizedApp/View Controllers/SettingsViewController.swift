//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Aleksandr Mamlygo on 09.05.23.
//

import UIKit

class SettingsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var currentColor: Color!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 20
        updateViewColor(for: coloredView)
        setupSliderUI()
    }

    //MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        currentColor = Color(
            red: redSlider.value,
            green: greenSlider.value,
            blue: blueSlider.value
        )
        updateViewColor(for: coloredView)
        
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: sender)
        case greenSlider:
            greenValueLabel.text = string(from: sender)
        default:
            blueValueLabel.text = string(from: sender)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setViewColor(using: currentColor)
        dismiss(animated: true)
    }
    
    
    //MARK: - Private functions
    private func updateViewColor(for view: UIView) {
        view.backgroundColor = UIColor(
            red: CGFloat(currentColor.red),
            green: CGFloat(currentColor.green),
            blue: CGFloat(currentColor.blue),
            alpha: 1
        )
    }
    
    private func setupSliderUI() {
        redSlider.setValue(currentColor.red, animated: true)
        greenSlider.setValue(currentColor.green, animated: true)
        blueSlider.setValue(currentColor.blue, animated: true)
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}

