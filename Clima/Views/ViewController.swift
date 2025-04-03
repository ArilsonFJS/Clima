//
//  ViewController.swift
//  Clima
//
//  Created by Arilson Silva on 03/04/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var searchTextFiel: UITextField = {
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
        searchTextFiel.delegate = self
    }


}

