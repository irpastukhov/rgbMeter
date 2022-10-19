//
//  GameViewController.swift
//  PracticeWithUiElements
//
//  Created by Ivan Pastukhov on 10.10.2022.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var titleLabel: UIStackView!
    
    
    private var blackLabel = UILabel()
    private var colorLabel = UILabel()
    private var nameLabel = UILabel()
    private var sliderR = UISlider()
    private var sliderG = UISlider()
    private var sliderB = UISlider()
    private var labelsRGB = [UILabel]()
    private var labelsRGBValues = [UILabel]()
    private let colorsDictionary = ["Absolute Zero": hexStringToUIColor(hex: "0048BA"), "Acid green": hexStringToUIColor(hex: "B0BF1A"), "Aero": hexStringToUIColor(hex: "7CB9E8"), "African violet": hexStringToUIColor(hex: "#B284BE"), "Air superiority blue": hexStringToUIColor(hex: "72A0C1"), "Alizarin": hexStringToUIColor(hex: "DB2D43"), "Alloy orange": hexStringToUIColor(hex: "C46210"), "Almond": hexStringToUIColor(hex: "EFDECD"), "Amaranth deep purple": hexStringToUIColor(hex: "9F2B68")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = UIColor(red: 241 / 255, green: 238 / 255, blue: 228 / 255, alpha: 1)
        view.backgroundColor = .white
        
        makeTitleLabel()
        makeBlackLabel()
        makeColorLabel()
        makeSliders()
        makeNameLabel()
        makeLabelsRGBValues()
        labelsRGBValuesZero()
        
        slidersActions()
        
    }
    
    private func makeTitleLabel() {
        
        titleLabel.snp.makeConstraints { make in
            let viewRatio = view.frame.height / view.frame.width
            make.left.equalTo(40 * viewRatio)
            make.top.equalTo(25 * viewRatio)
            
        }
    }
    
    private func makeBlackLabel() {
        blackLabel.layer.cornerRadius = 15
        blackLabel.layer.masksToBounds = true
        blackLabel.backgroundColor = .black
        view.addSubview(blackLabel)
        
        blackLabel.snp.makeConstraints { make in
            let viewRatio = view.frame.height / view.frame.width
            
            make.width.equalTo(92.5 * viewRatio)
            make.height.equalTo(92.5 * viewRatio)
            
            make.centerX.equalToSuperview()
            make.top.equalTo(70 * viewRatio)
        }
    }
    
    private func makeColorLabel() {
        colorLabel.layer.masksToBounds = true
        let randomDictElement = colorsDictionary.randomElement()
        colorLabel.backgroundColor = randomDictElement?.value
        nameLabel.text = randomDictElement?.key
        blackLabel.addSubview(colorLabel)
        
        colorLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
            make.bottom.equalToSuperview()
        }
    }
    
    private func makeNameLabel() {
        nameLabel.font = .systemFont(ofSize: 21, weight: .medium)
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            let viewRatio = view.frame.height / view.frame.width
            make.centerX.equalToSuperview()
            make.width.equalTo(270)
            make.bottom.equalTo(blackLabel).inset(-23 * viewRatio)
        }
    }
    
//    private func settingsLabel() {
//        let mainLabel = UILabel()
//        mainLabel.backgroundColor = view.backgroundColor?.withAlphaComponent(0.98)
//        view.addSubview(mainLabel)
//        mainLabel.snp.makeConstraints { make in
//            make.width.height.equalToSuperview()
//        }
//
//        let titleLabelSettings = titleLabel!
//
//        mainLabel.addSubview(titleLabelSettings)
//
//    }
    
    private func makeSliders() {
        view.addSubview(sliderR)
        view.addSubview(sliderG)
        view.addSubview(sliderB)
        
        sliderR.tintColor = .red
        sliderR.thumbTintColor = .systemRed
        sliderR.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.bottom.equalToSuperview().dividedBy(1.5)
        }
        
        sliderG.tintColor = .green
        sliderG.thumbTintColor = .systemGreen
        sliderG.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(sliderR).inset(80)
        }
        
        sliderB.tintColor = .blue
        sliderB.thumbTintColor = .systemBlue
        sliderB.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(sliderG).inset(80)
        }
    }
    
    
    
    private func slidersActions() {
        let slidersArr = [sliderR, sliderG, sliderB]
        for slider in slidersArr {
            slider.addTarget(self, action: #selector(sliderAction), for: .allEvents)
            
        }

        let arrRGB = ["R", "G", "B"]
        for i in 0..<arrRGB.count {
            let labelRGAndB = UILabel()
            
            labelRGAndB.textAlignment = .center
            labelRGAndB.font = UIFont.boldSystemFont(ofSize: 20)
            labelRGAndB.text = arrRGB[i]
            view.addSubview(labelRGAndB)
            labelRGAndB.snp.makeConstraints { make in
                make.left.equalTo(slidersArr[i]).inset(-27)
                make.bottom.equalTo(slidersArr[i]).inset(5)
                
            }
            labelsRGB += [labelRGAndB]
        }
    
    
    
    }
    
    private func makeLabelsRGBValues() {
        let slidersArr = [sliderR, sliderG, sliderB]
        
        for i in 0..<slidersArr.count {
        let labelRGAndBValue = UILabel()
        labelRGAndBValue.textAlignment = .center
        labelRGAndBValue.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(labelRGAndBValue)
        labelRGAndBValue.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(slidersArr[i]).inset(38)
        }
        labelsRGBValues += [labelRGAndBValue]
    }
    }
    
    
    
    @objc func sliderAction() {
        blackLabel.backgroundColor = UIColor(red: CGFloat(sliderR.value), green: CGFloat(sliderG.value), blue: CGFloat(sliderB.value), alpha: 1)
        winDefiner()
        print("colorlabel -", colorLabel.backgroundColor!)
        print("blackLabel -", blackLabel.backgroundColor!)
        
        let slidersArr = [sliderR, sliderG, sliderB]
        var numb = 0
        for i in labelsRGBValues {
            i.text = String(Int(round(slidersArr[numb].value * 255)))
            numb += 1
        }
        
    }
    
    private func labelsRGBValuesZero() {
        for i in labelsRGBValues {
            i.text = "0"
        }
    }
    
    
    private func fillDictionary() {
        //        coloursDictionary["Absolute Zero"] = UIColor(rgb: #0048BA)
    }
    
    private func winDefiner() {
        let colorComponents = colorLabel.backgroundColor?.cgColor.components
        var colorArr = [Int]()
        for i in colorComponents.unsafelyUnwrapped {
            let newColor = Int(i * 10)
            colorArr.append(newColor)
        }
        
        let blackComponents = blackLabel.backgroundColor?.cgColor.components
        var blackArr = [Int]()
        for i in blackComponents.unsafelyUnwrapped {
            let newColor = Int(i * 10)
            blackArr.append(newColor)
        }
        if colorArr == blackArr {
//            Timer.scheduledTimer(withTimeInterval: 0, repeats: false) { timer in
//                self.sliderR.isEnabled = false
//                self.sliderG.isEnabled = false
//                self.sliderB.isEnabled = false
//            }
            
//            Timer(timeInterval: 5, repeats: false) { timer in
//                self.mySlider1.isEnabled = false
//                self.mySlider2.isEnabled = false
//                self.mySlider3.isEnabled = false
//            }
            
            let randomDictElement = colorsDictionary.randomElement()
            colorLabel.backgroundColor = randomDictElement?.value
            nameLabel.text = randomDictElement?.key
            blackLabel.backgroundColor = .black
            
        }
    }
    
    
}


//MARK: - hexStringToUIColor
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
