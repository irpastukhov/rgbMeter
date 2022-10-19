//
//  ViewController.swift
//  PracticeWithUiElements
//
//  Created by Ivan Pastukhov on 08.10.2022.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    
    private var colorsDictionary = [String: UIColor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorsDictionary = ["Absolute Zero": hexStringToUIColor(hex: "0048BA"), "Acid green": hexStringToUIColor(hex: "B0BF1A"), "Aero": hexStringToUIColor(hex: "7CB9E8"), "African violet": hexStringToUIColor(hex: "#B284BE"), "Air superiority blue": hexStringToUIColor(hex: "72A0C1"), "Alizarin": hexStringToUIColor(hex: "DB2D43"), "Alloy orange": hexStringToUIColor(hex: "C46210"), "Almond": hexStringToUIColor(hex: "EFDECD"), "Amaranth deep purple": hexStringToUIColor(hex: "9F2B68")]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "colorsDatabase" else { return }
        let navigationVC = segue.destination as! UINavigationController
        let colorsTableViewController = navigationVC.topViewController as! ColorsTableViewController
        for i in colorsDictionary {
            colorsTableViewController.colorsNameArr += [i.key]
            colorsTableViewController.colorsArr += [i.value]
        }
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
    
    private func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
