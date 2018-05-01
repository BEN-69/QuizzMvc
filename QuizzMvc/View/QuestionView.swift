//
//  QuestionView.swift
//  QuizzMvc
//
//  Created by Benaata on 27/04/2018.
//  Copyright © 2018 RabiiBenaata. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!

    enum Style {
        case correct, incorrect, standard
    }

    var style: Style = .standard {
        didSet {
            setStyle(style)
        }
    }


    private func setStyle(_ style: Style) {
        switch style {
        case .correct:
            backgroundColor = UIColor(red: 200.0/255.0, green: 236.0/255.0, blue: 160.0/255.0, alpha: 1)
            icon.image = #imageLiteral(resourceName: "Icon Correct")
            icon.isHidden = false
        case .incorrect:
            backgroundColor = UIColor(red: 243.0/255.0, green: 135.0/255.0, blue: 148.0/255.0, alpha: 1)
            icon.image = #imageLiteral(resourceName: "Icon Error")
            icon.isHidden = false
        case .standard:
            backgroundColor = UIColor(red: 236.0/255.0, green: 254.0/255.0, blue: 220.0/255.0, alpha: 1)
            icon.isHidden = true
        }
    }

    var title = "" {
        didSet {
            label.text = title
        }
    }

}
