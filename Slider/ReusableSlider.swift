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
    var didValueChanged: (Float) -> Void = {_ in }
    
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
    
    @objc func sliderTapped() {
        sliderValueName.text = "\(Int(slider.value))"
        didValueChanged(slider.value)
    }
    
    func setName(_ name: String) {
        sliderNameLabel.text = "\(name):"
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
    
    func setSliderValue(_ value: Int) {
        slider.value = Float(value)
    }
    
    func sliderValue() -> CGFloat {
        return CGFloat(slider.value)
    }
}

private extension ReusableSlider {
    
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
        
        slider.addTarget(self, action: #selector(sliderTapped), for: .valueChanged)
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
