//
//  ColorViewController.swift
//  ColorizedApp
//
//  Created by Aleksandr Mamlygo on 28.05.23.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setViewColor(using color: Color)
}

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.currentColor = getViewColor()
        settingsVC.delegate = self
    }
    
    private func getViewColor() -> Color {
        view.backgroundColor?.rgba ?? Color(red: 0, green: 0, blue: 0)
    }

}

extension ColorViewController: SettingsViewControllerDelegate {
    func setViewColor(using color: Color) {
        view.backgroundColor = UIColor(
            red: CGFloat(color.red),
            green: CGFloat(color.green),
            blue: CGFloat(color.blue),
            alpha: 1
        )
    }
    
    
}

extension UIColor {
    var rgba: Color {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return Color(red: Float(red), green: Float(green), blue: Float(blue))
    }
}
