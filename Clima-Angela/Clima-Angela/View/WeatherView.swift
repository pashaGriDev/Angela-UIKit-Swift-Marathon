//
//  WeatherView.swift
//  Clima-Angela
//
//  Created by Павел Грицков on 21.02.23.
//

import UIKit
import SnapKit

class WeatherView: UIView {
    
    let bacgroungImageView = UIImageView()
    
    let searchButton = UIButton(type: .system)
    let locationButton = UIButton(type: .system)
    let searchTextField = UITextField()
    
    let weatherImageView = UIImageView()
    
    let tempLabel = UILabel()
    let tempSymbolLabel = UILabel()
    
    let cityNameLabel = UILabel()

    init() {
        super.init(frame: .zero)
        
        setup(bacgroungImageView, imageName: "background2" ,contentMode: .scaleAspectFill)
        setup(locationButton, imageName: "location.circle.fill", imageSize: 40, tintColor: .label)
        setup(searchButton, imageName: "magnifyingglass.circle.fill", imageSize: 40, tintColor: .label)
        setupSearchTextField()
        setup(weatherImageView, imageName: "cloud", contentMode: .scaleAspectFit)
        setup(tempLabel, text: "22", size: 80, weight: .heavy)
        setup(tempSymbolLabel, text: "℃", size: 80, weight: .light)
        setup(cityNameLabel, text: "London", size: 30, weight: .regular)
        
        layout()
    }
    
    // MARK: - Layout setting
    
    private func layout() {
        
        bacgroungImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        locationButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(locationButton.snp.height)
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(self.snp.leading).offset(20)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.height.equalTo(locationButton.snp.height)
            make.top.equalTo(locationButton.snp.top)
            make.leading.equalTo(locationButton.snp.trailing).offset(10)
        }
        
        searchButton.snp.makeConstraints { make in
            make.height.width.equalTo(locationButton.snp.height)
            make.top.equalTo(locationButton.snp.top)
            make.leading.equalTo(searchTextField.snp.trailing).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(10)
            make.height.equalTo(self.snp.width).multipliedBy(0.3)
            make.width.equalTo(weatherImageView.snp.height)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        
        tempSymbolLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView.snp.bottom).offset(10)
            make.trailing.equalTo(weatherImageView.snp.trailing)
            make.height.width.equalTo(100)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.height.equalTo(tempSymbolLabel.snp.height)
            make.width.equalTo(self.snp.width).multipliedBy(0.6)
            make.top.equalTo(tempSymbolLabel.snp.top)
            make.trailing.equalTo(tempSymbolLabel.snp.leading)
        }
        
        cityNameLabel.snp.makeConstraints { make in
            make.top.equalTo(tempSymbolLabel.snp.bottom).offset(10)
            make.trailing.equalTo(weatherImageView.snp.trailing)
            make.height.equalTo(30)
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
        }
    }
    
    // MARK: - Setup methods
    
    private func setup(_ button: UIButton, imageName: String, imageSize: CGFloat, tintColor: UIColor) {
        let image = UIImage.getImageWith(
            systemName: imageName,
            size: imageSize,
            weight: .regular)
        button.setImage(image, for: .normal)
        button.tintColor = tintColor
        
        addSubview(button)
    }
    
    private func setupSearchTextField() {
        searchTextField.font = UIFont.systemFont(ofSize: 22)
        searchTextField.placeholder = "Search"
        searchTextField.textColor = .label
        searchTextField.textAlignment = .right
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .systemFill.withAlphaComponent(0.2)
        
        addSubview(searchTextField)
    }
    
    private func setup(_ imageView: UIImageView, imageName: String, contentMode: UIView.ContentMode) {
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = contentMode
        
        addSubview(imageView)
    }
    
    private func setup(_ label: UILabel ,text: String, size: CGFloat, weight: UIFont.Weight) {
        label.textColor = .label
        label.text = text
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.textAlignment = .right
        
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
