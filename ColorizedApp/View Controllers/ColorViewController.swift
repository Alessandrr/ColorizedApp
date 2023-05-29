//
//  ColorViewController.swift
//  ColorizedApp
//
//  Created by Aleksandr Mamlygo on 28.05.23.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setViewColor(using color: UIColor)
}


class ColorViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.currentColor = getViewColor()
        settingsVC.delegate = self
    }
    
    private func getViewColor() -> UIColor {
        let rgbValues = view.backgroundColor?.rgb ?? (red: 0, green: 0, blue: 0)
        return UIColor(red: rgbValues.red, green: rgbValues.green, blue: rgbValues.blue, alpha: 1)
    }

}

//MARK: - Extensions
extension ColorViewController: SettingsViewControllerDelegate {
    func setViewColor(using color: UIColor) {
        view.backgroundColor = color
    }
}

extension UIColor {
    var rgb: (red: CGFloat, green: CGFloat, blue: CGFloat) {
        let ciColor = CIColor(color: self)
        return (red: ciColor.red, green: ciColor.green, blue: ciColor.blue)
    }
}
