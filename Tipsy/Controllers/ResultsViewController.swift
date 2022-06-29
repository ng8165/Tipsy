//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Nelson Gou on 6/23/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalView: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: Float = 0.0
    var percent = 0
    var people = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalView.text = String(format: "%.2f", result)
        settingsLabel.text = "Split between \(people) people, with \(percent)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
