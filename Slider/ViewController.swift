//
//  ViewController.swift
//  Slider
//
//  Created by Shota Manasyan on 06.05.22.
//

import UIKit

class ViewController: UIViewController {
    
    var verticalStackView: UIStackView!
    var titleLabel: UILabel!
    var fontScaleLabel: ReusableSlider!
    var redColor: ReusableSlider!
    var greenColor: ReusableSlider!
    var blueColor: ReusableSlider!
    var segmentControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTitleLabel()
        initverticalStackView()
        
        initFontScale()
        initRedColorSlider()
        initGreenColorSlider()
        initBlueColorSlider()
        initSegmentControl()
        
        constructHierarchy()
        activateConstraint()
    }

    func chnaged(value: Float) {
        titleLabel.font = UIFont.systemFont(ofSize: fontScaleLabel.sliderValue())
        titleLabel.textColor = .init(
            red: redColor.sliderValue() / CGFloat(255),
            green: greenColor.sliderValue() / CGFloat(255),
            blue: blueColor.sliderValue() / CGFloat(255),
            alpha: 1)
    }
    
    @objc func tappedSegmendControl() {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            titleLabel.font = UIFont.systemFont(ofSize: fontScaleLabel.sliderValue(), weight: .ultraLight)
        case 1:
            titleLabel.font = UIFont.systemFont(ofSize: fontScaleLabel.sliderValue(), weight: .light)
        default:
            titleLabel.font = UIFont.systemFont(ofSize: fontScaleLabel.sliderValue(), weight: .heavy)
        }
    }
}
    
extension ViewController {
    
    func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Title"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initverticalStackView() {
        verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 15
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initFontScale() {
        fontScaleLabel = ReusableSlider()
        fontScaleLabel.setName("Font Scale")
        fontScaleLabel.setMinAndMaxValue(10, 100)
        fontScaleLabel.setSliderValue(20)
        fontScaleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        fontScaleLabel.didValueChanged = chnaged
    }
    
    func initRedColorSlider() {
        redColor = ReusableSlider()
        redColor.setName("Red color")
        redColor.setMinAndMaxValue(0, 255)
        redColor.setTinyColor(.red)
        redColor.translatesAutoresizingMaskIntoConstraints = false
        
        redColor.didValueChanged = chnaged
    }
    
    func initGreenColorSlider() {
        greenColor = ReusableSlider()
        greenColor.setName("Green color")
        greenColor.setMinAndMaxValue(0, 255)
        greenColor.setTinyColor(.green)
        greenColor.translatesAutoresizingMaskIntoConstraints = false
        
        greenColor.didValueChanged = chnaged
    }
    
    func initBlueColorSlider() {
        blueColor = ReusableSlider()
        blueColor.setName("Blue color")
        blueColor.setMinAndMaxValue(0, 255)
        blueColor.setTinyColor(.blue)
        blueColor.translatesAutoresizingMaskIntoConstraints = false
        
        blueColor.didValueChanged = chnaged
    }
    
    func initSegmentControl() {
        segmentControl = UISegmentedControl(items: ["Light","Medium","heavy"])
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentControl.addTarget(self, action: #selector(tappedSegmendControl), for: .valueChanged)
    }
    
    func constructHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(fontScaleLabel)
        verticalStackView.addArrangedSubview(redColor)
        verticalStackView.addArrangedSubview(greenColor)
        verticalStackView.addArrangedSubview(blueColor)
        verticalStackView.addArrangedSubview(segmentControl)
    }
    
    func activateConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  50),
            
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            verticalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50)
        ])
    }
}

