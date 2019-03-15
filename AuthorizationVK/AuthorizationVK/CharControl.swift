//
//  CharControl.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 14/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class CharControl: UIControl {
    
    var selectedChar: String? {
        didSet {
            updateSelectChar()
            sendActions(for: .valueChanged)
        }
    }
    
    private var buttonsArray = [UIButton]()
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor.white.withAlphaComponent(0)
        
        
        let button = UIButton(type: .custom)
        let searchButtonImage = UIImage(named: "searchButton")
        button.setImage(searchButtonImage, for: .normal)
        button.addTarget(self, action: #selector(selectChar(_:)), for: .touchUpInside)
        buttonsArray.append(button)
        
        for char in FriendsController.sectionName {
            let button = UIButton(type: .system)
            button.setTitle(char, for: .normal)
            button.setTitleColor(#colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1), for: .normal)
            button.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .selected)
            button.addTarget(self, action: #selector(selectChar(_:)), for: .touchUpInside)
            buttonsArray.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: buttonsArray)
        self.addSubview(stackView)
        
        stackView.spacing = 8.0
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually

    }
    
    private func updateSelectChar() {
        for (index, button) in buttonsArray.enumerated() {
            guard index == buttonsArray.count - 1 else {continue}
            let char = FriendsController.sectionName[index - 1]
            button.isSelected = char == selectedChar
        }
    }
    
    @objc func selectChar(_ sender: UIButton) {
        
        guard let index = buttonsArray.index(of: sender) else { return }
        if index == 0 {
            selectedChar = "search"
        } else {
            let char = FriendsController.sectionName[index - 1]
            selectedChar = char
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        stackView.frame = bounds
        
    }
    

}
