//
//  ClimaView.swift
//  Clima
//
//  Created by Arilson Silva on 07/04/25.
//

import UIKit

class ClimaView: UIView {
    
    let searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        searchTextField.borderStyle = .roundedRect
        searchTextField.placeholder = "Search "
        searchTextField.textAlignment = .right
        searchTextField.font = UIFont.systemFont(ofSize: 20)
        
        return searchTextField
    }()
    
    let buttonSearch: UIButton = {
        let buttonSearch = UIButton()
        buttonSearch.translatesAutoresizingMaskIntoConstraints = false
        
        
        let icon = UIImage(systemName: "magnifyingglass")
        buttonSearch.setImage(icon, for: .normal)
        buttonSearch.imageView?.contentMode = .scaleAspectFit
        buttonSearch.contentHorizontalAlignment = .fill
        buttonSearch.contentVerticalAlignment = .fill
        return buttonSearch
    }()
    
    let conditionImageView: UIImageView = {
        let conditionImageView = UIImageView()
        conditionImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let icon = UIImage(systemName: "sun.max.fill") ?? UIImage()
        if #available(iOS 17.0, *) {
            conditionImageView.setSymbolImage(icon, contentTransition: .replace)
        } else {
            // Fallback on earlier versions
        }
        conditionImageView.contentMode = .scaleAspectFit
        
        return conditionImageView
    }()
    
    let temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        temperatureLabel.text = "20º C"
        temperatureLabel.font = .systemFont(ofSize: 50)
        
        return temperatureLabel
    }()
    
    let cityLabel: UILabel = {
        let cityLabel = UILabel()
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cityLabel.text = "Londres"
        cityLabel.font = .systemFont(ofSize: 50)
        
        return cityLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(searchTextField)
        addSubview(buttonSearch)
        addSubview(conditionImageView)
        addSubview(temperatureLabel)
        addSubview(cityLabel)
        
        setContraints()
    }
    
    func setContraints(){
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70)
        ])
        
        NSLayoutConstraint.activate([
            buttonSearch.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            buttonSearch.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 15),
            buttonSearch.heightAnchor.constraint(equalTo: searchTextField.heightAnchor),
            buttonSearch.widthAnchor.constraint(equalTo: buttonSearch.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            conditionImageView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 100),
            conditionImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            conditionImageView.widthAnchor.constraint(equalToConstant: 150),
            conditionImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: conditionImageView.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: conditionImageView.bottomAnchor, constant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: temperatureLabel.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 50)
        ])
    }
}
