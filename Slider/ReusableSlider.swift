//
//  ReusableSlider.swift
//  Slider
//
//  Created by Shota Manasyan on 06.05.22.
//

import Foundation
import UIKit


class ReusableSlider: UIStackView {
    
    private var viewForSlider: UIView!
    private var slider: UISlider!
    private var sliderNameLabel: UILabel!
    private var sliderValueName: UILabel!
    private var sliderMinValueLabel: UILabel!
    private var sliderMaxValueLabel: UILabel!
    
    var setName: String? {
        get {
            return self.setName
        }
        set {
            sliderNameLabel.text = newValue
        }
    }
    var setSliderValue: Int {
        get {
            return self.setSliderValue
        }
        set {
            return slider.value = Float(newValue)
        }
    }
    
    
    var sliderValue: CGFloat {
        get {
            CGFloat(slider.value)
        }
    }
    
    var didValueChanged: ((Float) -> Void)!
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        axis = .horizontal
        spacing = 10
        
        initSliderNameLabel()
        initViewForSlider()
        initSlider()
        initSliderValueName()
        initSliderMinValueLabel()
        initSliderMaxValueLabel()
        constructHierarchy()
        activateConstraint()
    }
    
    required init(coder: NSCoder) {
        super .init(coder: coder)
        
        initSliderNameLabel()
        initViewForSlider()
        initSlider()
        initSliderValueName()
        initSliderMinValueLabel()
        initSliderMaxValueLabel()
        constructHierarchy()
        activateConstraint()
    }
    
    @objc func sliderSlided() {
        sliderValueName.text = "\(Int(slider.value))"
        didValueChanged(slider.value)
    }
    
    func setMinAndMaxValue(_ min: Int, _ max: Int) {
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        sliderMaxValueLabel.text = "\(max)"
        sliderMinValueLabel.text = "\(min)"
    }
    
    func setTinyColor(_ color: UIColor) {
        slider.thumbTintColor = color
        slider.maximumTrackTintColor = color
    }
}

extension ReusableSlider {
    
    func initSliderNameLabel() {
        sliderNameLabel = UILabel()
        sliderNameLabel.font = UIFont.systemFont(ofSize: 14)
        sliderNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initViewForSlider() {
        viewForSlider = UIView()
        viewForSlider.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initSliderValueName() {
        sliderValueName = UILabel()
        sliderValueName.font = UIFont.systemFont(ofSize: 12)
        sliderValueName.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initSliderMinValueLabel() {
        sliderMinValueLabel = UILabel()
        sliderMinValueLabel.font = UIFont.systemFont(ofSize: 12)
        sliderMinValueLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initSliderMaxValueLabel() {
        sliderMaxValueLabel = UILabel()
        sliderMaxValueLabel.font = UIFont.systemFont(ofSize: 12)
        sliderMaxValueLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initSlider() {
        slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.addTarget(self, action: #selector(sliderSlided), for: .valueChanged)
    }
    
    func constructHierarchy() {
        addArrangedSubview(sliderNameLabel)
        addArrangedSubview(viewForSlider)
        viewForSlider.addSubview(slider)
        viewForSlider.addSubview(sliderValueName)
        viewForSlider.addSubview(sliderMinValueLabel)
        viewForSlider.addSubview(sliderMaxValueLabel)
    }
    
    func activateConstraint() {
        NSLayoutConstraint.activate([
            sliderNameLabel.widthAnchor.constraint(equalToConstant: 80),
            
            slider.leadingAnchor.constraint(equalTo: viewForSlider.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: viewForSlider.trailingAnchor),
            slider.bottomAnchor.constraint(equalTo: viewForSlider.bottomAnchor),
            
            sliderMinValueLabel.topAnchor.constraint(equalTo: viewForSlider.topAnchor),
            sliderValueName.centerXAnchor.constraint(equalTo: slider.centerXAnchor),
            sliderValueName.bottomAnchor.constraint(equalTo: slider.topAnchor),
            
            sliderMinValueLabel.leadingAnchor.constraint(equalTo: slider.leadingAnchor),
            sliderMinValueLabel.bottomAnchor.constraint(equalTo: slider.topAnchor),
            
            sliderMaxValueLabel.trailingAnchor.constraint(equalTo: slider.trailingAnchor),
            sliderMaxValueLabel.bottomAnchor.constraint(equalTo: slider.topAnchor)
        ])
    }
}
