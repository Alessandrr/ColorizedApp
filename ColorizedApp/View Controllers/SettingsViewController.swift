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
    
    @IBOutlet var redValueTF: UITextField!
    @IBOutlet var greenValueTF: UITextField!
    @IBOutlet var blueValueTF: UITextField!
    
    @IBOutlet var colorInputToolbar: UIToolbar!
    
    var currentColor: Color!
    var delegate: SettingsViewControllerDelegate!
    
    //MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 20
        updateViewColor(for: coloredView)
        updateSliderUI()
        setupFields()
        updateFieldValues()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    //MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: sender)
            currentColor.red = redSlider.value
        case greenSlider:
            greenValueLabel.text = string(from: sender)
            currentColor.green = greenSlider.value
        default:
            blueValueLabel.text = string(from: sender)
            currentColor.blue = blueSlider.value
        }
        
        updateViewColor(for: coloredView)
        updateFieldValues()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setViewColor(using: currentColor)
        dismiss(animated: true)
    }
    
    @IBAction func keyboardDoneButtonItemPressed(_ sender: UIBarButtonItem) {
        view.endEditing(true)
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
    
    private func updateSliderUI() {
        redSlider.setValue(currentColor.red, animated: true)
        greenSlider.setValue(currentColor.green, animated: true)
        blueSlider.setValue(currentColor.blue, animated: true)
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
    
    private func updateFieldValues() {
        redValueTF.text = string(from: redSlider)
        greenValueTF.text = string(from: greenSlider)
        blueValueTF.text = string(from: blueSlider)
    }
    
    private func setupFields() {
        for field in [redValueTF, greenValueTF, blueValueTF] {
            field?.inputAccessoryView = colorInputToolbar
            field?.delegate = self
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}

//MARK: - Extensions
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newColorValue = Float(textField.text?.replacingOccurrences(of: ",", with: ".") ?? "") else {
            showAlert(
                withTitle: "Wrong format",
                message: "Please enter a valid number",
                textField: textField
            )
            return
        }
        
        guard newColorValue <= 1 && newColorValue >= 0 else {
            showAlert(
                withTitle: "Not a valid number",
                message: "Please enter a number between 0 and 1",
                textField: textField
            )
            return
        }
        
        switch textField {
        case redValueTF:
            currentColor.red = newColorValue
        case greenValueTF:
            currentColor.green = newColorValue
        default:
            currentColor.blue = newColorValue
        }
        
        updateViewColor(for: coloredView)
        updateSliderUI()
    }
    
    func showAlert(withTitle title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text?.removeAll()
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

