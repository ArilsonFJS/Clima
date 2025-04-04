//
//  ViewController.swift
//  Clima
//
//  Created by Arilson Silva on 03/04/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var searchTextField: UITextField = {
        let searchTextFiel = UITextField()
        searchTextFiel.translatesAutoresizingMaskIntoConstraints = false
        return searchTextFiel
    }()
    
    private lazy var buttonSearch: UIButton = {
        let buttonSearch = UIButton()
        buttonSearch.translatesAutoresizingMaskIntoConstraints = false
        return buttonSearch
    }()
    
    private lazy var conditionImageView: UIImageView = {
        let conditionImageView = UIImageView()
        conditionImageView.translatesAutoresizingMaskIntoConstraints = false
        return conditionImageView
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        return temperatureLabel
    }()
    
    private lazy var cityLabel: UILabel = {
        let cityLabel = UILabel()
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        return cityLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchTextField.delegate = self
        setupUI()
    }
    
    func setupUI(){
        addSubViews()
        setContraints()
    }
    
    func addSubViews(){
        view.addSubview(searchTextField)
        configSearchTextField()
        
        view.addSubview(buttonSearch)
        configButtonSearch()
        
        view.addSubview(conditionImageView)
        if #available(iOS 17.0, *) {
            configconditionImageView()
        } else {
            //TO-DO estudas como realizar definicao de UIImage de outra forma
            print("Versão iOS iferior ao 17.0")
        }
    }
    
    func configSearchTextField(){
        searchTextField.borderStyle = .roundedRect
        searchTextField.placeholder = "Search "
        searchTextField.textAlignment = .right
        searchTextField.font = UIFont.systemFont(ofSize: 20)
    }
    
    func configButtonSearch(){
        let icon = UIImage(systemName: "magnifyingglass")
        buttonSearch.setImage(icon, for: .normal)
        buttonSearch.imageView?.contentMode = .scaleAspectFit
        buttonSearch.contentHorizontalAlignment = .fill
        buttonSearch.contentVerticalAlignment = .fill
    }
    
    @available(iOS 17.0, *)
    func configconditionImageView() {
        let icon = UIImage(systemName: "sun.max.fill") ?? UIImage()
        conditionImageView.setSymbolImage(icon, contentTransition: .replace)
        conditionImageView.contentMode = .scaleAspectFit
    }
    
    func setContraints(){
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70)
        ])
        
        NSLayoutConstraint.activate([
            buttonSearch.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            buttonSearch.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 15),
            buttonSearch.heightAnchor.constraint(equalTo: searchTextField.heightAnchor),
            buttonSearch.widthAnchor.constraint(equalTo: buttonSearch.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            conditionImageView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 100),
            conditionImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conditionImageView.widthAnchor.constraint(equalToConstant: 100),
            conditionImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

